import configparser
from proccesor.mysqlhandler import *
from proccesor.mssqlhandler import *
from proccesor.orahandler import *
from proccesor.pgsqlhandler import *
from kafka import KafkaProducer
import simplejson as json

config = configparser.ConfigParser()
config.read('configurator/rdbms.ini')
streamconfig = configparser.ConfigParser()
streamconfig.read('configurator/streaming.ini')
topics = streamconfig["kafka"]["topics"]
brokerAddresses = streamconfig["kafka"]["brokerAddresses"]
#awaitTermination = streamconfig["kafka"]["awaitTermination"]

class rdbmsManager():
    def __init__(self, source=None):
        self.kafka_producer = KafkaProducer(bootstrap_servers=brokerAddresses, value_serializer=lambda v: json.dumps(v).encode('utf-8'))
        self.checkpoint = 1
        self.checkpoint_count = 1
        self.con = None
        if source is not None:
            self.source = source
            self.df = pd.DataFrame()
            self.h = self.create_engine()
            self.destination = db.create_engine(config["destination"]["url"])
            self.last_vars_dict = {
                "last_reads": 0,
                "last_writes": 0,
                "last_batches": 0,
                "temp_reads": 0,
                "temp_writes": 0,
                "temp_batches": 0
            }
        else:
            self.destination = db.create_engine(config["destination"]["url"])
            self.handler = mysqlHandler(self.destination)

    def get_data(self):
        return pd.read_sql_query(config["destination"]["select"], self.destination)


    def run_metrics_with_kafka(self):
        dict = self.h.get_metrics()
        dict = self.increment_io_metrics(dict)
        dict = {**dict, **self.h.get_engine_stats()}
        self.kafka_producer.send(topics, dict)

    def run_metrics(self):
        dict = self.h.get_metrics()
        dict = self.increment_io_metrics(dict)
        dict = {**dict, **self.h.get_engine_stats()}
        self.df = self.df.append(dict, ignore_index=True)

    def increment_io_metrics(self, dict):
        dict['create_time'] = dt.datetime.now().strftime("%m/%d/%Y %H:%M:%S")
        #dict['cpu'] = ps.cpu_percent(interval=1, percpu=False)
        if self.last_vars_dict['last_reads'] == 0 and self.last_vars_dict['last_writes'] == 0 and self.last_vars_dict[
            'last_batches'] == 0:
            self.last_vars_dict['last_reads'] = dict['Disk Read IO/sec']
            self.last_vars_dict['last_writes'] = dict['Disk Write IO/sec']
            self.last_vars_dict['last_batches'] = dict['Batch Requests/sec']
            dict['Disk Read IO/sec'] -= self.last_vars_dict['last_reads']
            dict['Disk Write IO/sec'] -= self.last_vars_dict['last_writes']
            dict['Batch Requests/sec'] -= self.last_vars_dict['last_batches']
        else:
            self.last_vars_dict['temp_reads'] = self.last_vars_dict['last_reads']
            self.last_vars_dict['temp_writes'] = self.last_vars_dict['last_writes']
            self.last_vars_dict['temp_batches'] = self.last_vars_dict['last_batches']
            self.last_vars_dict['last_reads'] = dict['Disk Read IO/sec']
            self.last_vars_dict['last_writes'] = dict['Disk Write IO/sec']
            self.last_vars_dict['last_batches'] = dict['Batch Requests/sec']
            dict['Disk Read IO/sec'] -= self.last_vars_dict['temp_reads'] if dict['Disk Read IO/sec'] > \
                                                                             self.last_vars_dict['temp_reads'] else \
            dict['Disk Read IO/sec']
            dict['Disk Write IO/sec'] -= self.last_vars_dict['temp_writes'] if dict['Disk Write IO/sec'] > \
                                                                               self.last_vars_dict['temp_writes'] else \
            dict['Disk Write IO/sec']
            dict['Batch Requests/sec'] -= self.last_vars_dict['temp_batches'] if dict['Batch Requests/sec'] > \
                                                                                 self.last_vars_dict[
                                                                                     'temp_batches'] else dict[
                'Batch Requests/sec']
        return dict

    def stream_metrics(self, timeout=0):
        timeout_start = time.time()
        if timeout > 600:
            self.checkpoint = 300
            self.checkpoint_count = 1
        while time.time() < timeout_start + timeout:
            self.run_metrics_with_kafka()
            if time.time() > timeout_start + (self.checkpoint * self.checkpoint_count):
                self.checkpoint_count += 1
                #self.save_data()
        #self.get_kafka_data()
        #self.save_data()

    def create_engine(self):
        handler = None
        if self.source == 'mysql':
            self.con = config["mysql"]["url"]
            engine = db.create_engine(self.con, connect_args={"ssl": {"sslmode": "require"}} )
            handler = mysqlHandler(engine)
        if self.source == 'postgresql':
            self.con = config["postgres"]["url"]
            engine = db.create_engine(self.con)
            handler = pgsqlHandler(engine)
        if self.source == 'mssql':
            self.con = config["mssql"]["url"]
            engine = db.create_engine(self.con)
            handler = mssqlHandler(engine)
        if self.source == 'oracle':
            self.con = config["oracle"]["url"]
            engine = db.create_engine(self.con, max_identifier_length=128)
            handler = oracleHandler(engine)
        return handler
