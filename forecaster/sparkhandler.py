import os
import configparser
import numpy as np
import pandas as pd
from datetime import datetime
from forecaster.streamingKMeansModel import StreamingKMeans
from pyspark.ml.feature import VectorAssembler, StandardScaler as scal, PCA
from pyspark.ml.evaluation import ClusteringEvaluator
from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.types import StructField, StringType, IntegerType, StructType, FloatType
from sklearn.tree import _tree, DecisionTreeClassifier

os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.1 pyspark-shell'

class sparkhandler():
    def __init__(self, schema, awaitTermination):
        ##Configorator##
        self.streamconfig = configparser.ConfigParser()
        self.streamconfig.read('configurator/streaming.ini')
        self.topics = self.streamconfig["kafka"]["topics"]
        self.brokerAddresses = self.streamconfig["kafka"]["brokerAddresses"]
        self.awaitTermination = awaitTermination
        ###############
        self.now = datetime.now()
        self.run_ext = self.now.strftime("%m%d%Y%H%M%S%f")
        self.queryname = "metrics_"+ self.run_ext
        self.appname = "workLoad"+ self.run_ext
        self.pcaDim = 4
        self.spark = SparkSession \
            .builder \
            .config("spark.driver.host", self.streamconfig["spark"]["driverhost"]) \
            .config("spark.driver.memory",  self.streamconfig["spark"]["memory"]) \
            .config('spark.sql.codegen.wholeStage', 'false') \
            .appName(self.appname) \
            .getOrCreate()
        self.update_spark_log_level('ERROR')
        self.schema = schema
        self.predSchema = StructType(
            [
                StructField("create_time", StringType()),
                StructField("class_name", IntegerType())
            ]
        )
        self.data = self.read_stream_kafka()
        self.data = self.data.select(from_json(col("value").cast("string"), self.schema).alias("metrics")) \
            .select("metrics.*") \
            .writeStream \
            .format("memory") \
            .trigger(processingTime='60 seconds') \
            .option("truncate", "true") \
            .queryName(self.queryname) \
            .start() \
            .awaitTermination(int(self.awaitTermination))
        self.data = self.spark.sql("select * from "+self.queryname)   \
            .withColumnRenamed('Batch Requests/sec','Batch_Requests_sec')\
            .withColumnRenamed('Disk Read IO/sec','Disk_Read_IO_sec')\
            .withColumnRenamed('Disk Write IO/sec','Disk_Write_IO_sec')
        self.createDF = self.data.select("create_time")
        self.feature_optimizer()
        self.dataClean = self.data.drop("create_time")

    def update_spark_log_level(self, log_level='info'):
        self.spark.sparkContext.setLogLevel(log_level)
        log4j = self.spark._jvm.org.apache.log4j
        logger = log4j.LogManager.getLogger("my custom Log Level")
        return logger;

    def read_stream_kafka(self):
        return self.spark.readStream.format('kafka') \
            .option('kafka.bootstrap.servers', self.brokerAddresses) \
            .option('subscribe', self.topics) \
            .option("startingOffsets", "latest") \
            .option("maxOffsetsPerTrigger", 2000) \
            .load() \
            .selectExpr("CAST(value AS STRING)")

    def run_model(self, clusters = 5):
        if(self.dataClean.count()>0):
            models = []
            predictions = []
            bestsilhouette = 0
            bestmodel = None
            seed = 10
            for i in range(clusters):
                exist_flag = 0
                clusters = clusters+(5*i)
                try:
                    clusterCenters = np.load(self.streamconfig["spark"]["centersPath"]+"/"+str(clusters)+"/centers.npy")
                    clusterWeights = np.load(self.streamconfig["spark"]["weightsPath"]+"/"+str(clusters)+"/weights.npy" )
                    models.append(StreamingKMeans(k=clusters, decayFactor=0.5).setInitialCenters(clusterCenters, clusterWeights))
                    exist_flag = 1
                except:
                    models.append(StreamingKMeans(k=clusters, decayFactor=0.5).setRandomCenters(self.pcaDim, 1.0, seed))
                    exist_flag = 0
                models[i].trainOn(self.dataClean.select("pca_features"))
                predictions.append(models[i].predictOn(dstream=self.data.select("create_time","pca_features")))
                predictions[i] = self.spark.createDataFrame(predictions[i].toLocalIterator(),schema=self.predSchema)
                predictions[i] = predictions[i].join(self.data, on=['create_time'], how='left_outer')
                #predictions[i].show(1000)
                canEvaluate = predictions[i].select(countDistinct("class_name")).collect()
                if canEvaluate[0][0] > 1:
                    silhouette = self.evaluate(predictions[i], clusters)
                else:
                    silhouette = 0
                if silhouette > bestsilhouette:
                    bestsilhouette = silhouette
                    bestmodel = models[i]
                    bestprediction = predictions[i]
                elif exist_flag == 1 and silhouette < 0.5:
                    models[i].remove(self.spark.sparkContext, self.streamconfig["spark"]["checkpoint"])
            if bestmodel is not None:
                self.bestprediction = bestprediction
                bestmodel.save(self.spark.sparkContext, self.streamconfig["spark"]["checkpoint"])
                self.cluster_report(self.bestprediction.select("Batch_Requests_sec","Disk_Read_IO_sec","Disk_Write_IO_sec").toPandas(),
                                    self.bestprediction.select("class_name").toPandas().to_numpy().flatten(), min_samples_leaf=2,
                                    pruning_level=0.01)

    def evaluate(self, predictions,clusters):
        evaluator = ClusteringEvaluator()
        evaluator.setPredictionCol("class_name")
        evaluator.setFeaturesCol("pca_features")
        silhouette = evaluator.evaluate(predictions)
        print("Silhouette with squared euclidean distance = " + str(silhouette) + " for "+str(clusters)+" clusters")
        return silhouette

    def feature_optimizer(self):
        for col_name in self.data.drop("create_time").columns:
            self.data = self.data.withColumn(col_name, log(col(col_name))).na.fill(0)
        assembler = VectorAssembler(inputCols=self.data.drop("create_time").columns, outputCol="vector")
        vectorized = assembler.transform(self.data)
        scalar = scal(inputCol="vector", outputCol="scaledVector",
                      withStd=False, withMean=False)
        scalerModel = scalar.fit(vectorized)
        self.data = scalerModel.transform(vectorized)
        #self.data.show(truncate=False)
        pca = PCA(k=4, inputCol="scaledVector")
        pca.setOutputCol("pca_features")
        model = pca.fit(self.data)
        self.data = model.transform(self.data)
        self.data = self.data.drop("scaledVector","vector")

    def get_class_rules(self, tree: DecisionTreeClassifier, feature_names: list):
        inner_tree: _tree.Tree = tree.tree_
        classes = tree.classes_
        class_rules_dict = dict()

        def tree_dfs(node_id=0, current_rule=[], load=10):
            # feature[i] holds the feature to split on, for the internal node i.
            split_feature = inner_tree.feature[node_id]
            if split_feature != _tree.TREE_UNDEFINED:  # internal node
                name = feature_names[split_feature]
                threshold = inner_tree.threshold[node_id]
                # left child
                left_rule = current_rule + ["({} <= {})".format(name, threshold)]
                load = load - threshold
                tree_dfs(inner_tree.children_left[node_id], left_rule, load)
                # right child
                right_rule = current_rule + ["({} > {})".format(name, threshold)]
                load = load + threshold
                tree_dfs(inner_tree.children_right[node_id], right_rule, load)
            else:  # leaf
                dist = inner_tree.value[node_id][0]
                dist = dist / dist.sum()
                #print(inner_tree.threshold[node_id])
                if inner_tree.threshold[node_id] ==0:
                    dup=1
                else:
                    dup=inner_tree.threshold[node_id]
                load = load * dup
                max_idx = dist.argmax()
                if len(current_rule) == 0:
                    rule_string = "ALL"
                else:
                    rule_string = " and ".join(current_rule)
                    rule_string = rule_string
                # register new rule to dictionary
                selected_class = classes[max_idx]
                class_probability = dist[max_idx]
                class_rules = class_rules_dict.get(selected_class, [])
                class_rules.append((rule_string, class_probability))
                class_rules_dict[selected_class] = [class_rules, load]

        tree_dfs()  # start from root, node_id = 0
        return class_rules_dict

    def cluster_report(self,data: pd.DataFrame, clusters, min_samples_leaf=15, pruning_level=0.01):
        # Create Model
        tree = DecisionTreeClassifier(min_samples_leaf=min_samples_leaf, ccp_alpha=pruning_level)
        tree.fit(data, clusters)
        # Generate Report
        feature_names = data.columns
        class_rule_dict = self.get_class_rules(tree, feature_names)
        report_class_list = []
        for class_name in class_rule_dict.keys():
            rule_list = class_rule_dict[class_name][0]
            load = class_rule_dict[class_name][1]
            combined_string = ""
            '''for rule in rule_list:
                if len(list(rule)) > 1:
                    combined_string += "[{}] {}".format(rule[1], rule[0])
                else:
                    combined_string += "[{}]".format(rule[0])'''
            #report_class_list.append((class_name, combined_string, load))
            report_class_list.append((class_name, load))

        print(report_class_list)
        report_scheme = StructType(
            [

                StructField("class_name", IntegerType()),
                StructField("load", FloatType())
            ]
        )
        loadsDF = self.spark.createDataFrame(data=pd.DataFrame(report_class_list, columns=['class_name', 'load']), schema=report_scheme) #had problem with numpy.int32 to pyspark so doing df in the middle
        loadsDF = loadsDF.withColumn('load', abs(loadsDF.load))
        loadsDF.show()
        self.bestprediction = self.bestprediction.join(loadsDF, on=['class_name'], how='left').na.drop()
        self.bestprediction.show(truncate=False)
        self.bestprediction.write.mode('append').parquet("clusteringPredictions_save")












