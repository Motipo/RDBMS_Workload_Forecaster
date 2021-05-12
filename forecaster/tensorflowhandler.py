import configparser
import os
import shutil
import IPython.display
import pandas as pd
import sqlalchemy as db
from tensorflow.python.keras.models import load_model
from forecaster.windowgenerator import *
from forecaster.feedback import *
from datetime import datetime ,timedelta

#################################################

class time_series:
    def __init__(self, delta , from_date = "05/02/2021 01:00:00", timeframe = "h"):
        #################################################
        if os.path.exists("TFmodels"):
            shutil.rmtree("TFmodels")
        ################### data prep ###################
        self.delta = delta
        self.date_format = '%m/%d/%Y %H:%M:%S'

        if not (from_date is None):
            self.start_date = datetime.strptime(from_date, self.date_format)
            self.end_date = self.start_date + timedelta(hours=self.delta)
            self.filters = [('create_time', '>', self.start_date.strftime(self.date_format)),
                       ('create_time', '<', self.end_date.strftime(self.date_format))]
            self.hours_delta_add = (self.end_date - self.start_date).seconds // 3600
            self.timestamps = pd.date_range(self.end_date + timedelta(hours=1),
                                            periods=self.hours_delta_add, freq=timeframe)
            self.df = pd.read_parquet(path="clusteringPredictions_save", columns=None, filters=self.filters) \
                .replace([np.inf, -np.inf], np.nan).sort_values(by=['create_time'])

        if (from_date is None):
            self.filters = None
            self.df = pd.read_parquet(path="clusteringPredictions_save", columns=None, filters=self.filters) \
                .replace([np.inf, -np.inf], np.nan).sort_values(by=['create_time'])
            self.hours_delta_add = delta
            self.end_date = datetime.strptime(self.df['create_time'].max(), self.date_format)
            self.timestamps = pd.date_range(self.end_date + timedelta(hours=1),
                                            periods=self.hours_delta_add, freq=timeframe)

        #print(pd.read_parquet(path="clusteringPredictions_save", columns=None))
        #print(self.df,self.start_date.strftime(self.date_format), self.end_date.strftime(self.date_format) )
        if len(self.df) == 0:
            raise Exception("Sorry, no data found for the selected time frame")
        self.df = self.df.drop('class_name', 1)
        self.df = self.df.drop('pca_features', 1)
        self.df['create_time'] = pd.to_datetime(self.df['create_time'], format=self.date_format)
        self.date_time = self.df['create_time']
        self.df.set_index('create_time')
        self.df = self.df.resample('10S', on='create_time').median().round(decimals=4).fillna(0)
        #################################################
        ################### split data ###################
        n = len(self.df)
        self.train_df = self.df[0:int(n * 0.7)]
        self.val_df = self.df[int(n * 0.7):int(n * 0.9)]
        self.test_df = self.df[int(n * 0.9):]
        self.num_features = self.df.shape[1]
        #################################################
        ################### Normalize ###################
        '''train_mean = train_df.mean()
        train_std = train_df.std()
        train_df = (train_df - train_mean) / train_std
        val_df = (val_df - train_mean) / train_std
        test_df = (test_df - train_mean) / train_std'''
        #################################################
        self.create_window()
        self.run_all_models()
        self.members = self.load_all_models()
        self.final_df = pd.DataFrame(self.ensemble_predictions(self.members, self.multi_window.train).reshape(self.OUT_STEPS, -1),
                                    columns=['predictions'])
        self.final_df['timestamps'] = self.timestamps
        print(self.final_df)


    def create_window(self):
        self.OUT_STEPS = self.delta
        self.multi_window = WindowGenerator(date_indices=self.date_time, input_width=self.OUT_STEPS,
                                       label_width=self.OUT_STEPS,
                                       shift=self.OUT_STEPS,
                                       train_df=self.train_df, val_df=self.val_df,
                                       test_df=self.test_df, label_columns=['load'])

        #print(multi_window.__repr__)
        self.multi_val_performance = {}
        self.multi_performance = {}

    #################################################
    class MultiStepLastBaseline(tf.keras.Model):
      def __init__(self, output):
          tf.keras.Model.__init__(self)
          self.OUT_STEPS = output
      def call(self, inputs):
        return tf.tile(inputs[:, -1:, :], [1, self.OUT_STEPS, 1])

    class RepeatBaseline(tf.keras.Model):
      def call(self, inputs):
        return inputs

    #################################################
    def compile_and_fit(self, name ,model, window, patience=5):
      MAX_EPOCHS = 30
      early_stopping = tf.keras.callbacks.EarlyStopping(monitor='val_loss',
                                                        patience=patience,
                                                        mode='auto')
      opt = tf.optimizers.Adam(learning_rate=0.01)
      RMSprop = tf.optimizers.RMSprop()
      model.compile(loss=tf.losses.MeanSquaredError(),
                    optimizer=opt,#tf.optimizers.Adam(),
                    metrics=[tf.metrics.MeanAbsoluteError()])
    
      history = model.fit(window.train, epochs=MAX_EPOCHS,
                          validation_data=window.val,
                          callbacks=[early_stopping])

      modelfilename = 'TFmodels/' + model.name
      model.save(modelfilename, overwrite=True)
      return history
    #################################################
    #################################################
    def multi_base(self):
        last_baseline = self.MultiStepLastBaseline(self.OUT_STEPS)
        last_baseline.compile(loss=tf.losses.MeanSquaredError(),
                              metrics=[tf.metrics.MeanAbsoluteError()])
        self.multi_val_performance[last_baseline.name] = last_baseline.evaluate(self.multi_window.val)
        self.multi_performance[last_baseline.name] = last_baseline.evaluate(self.multi_window.test, verbose=0)
        filename = 'TFmodels/' + last_baseline.name
        last_baseline.save(filename)
        #multi_window.plot(last_baseline)
        return
    #################################################
    #################################################
    def multi_repeat(self):
        repeat_baseline = self.RepeatBaseline()
        repeat_baseline.compile(loss=tf.losses.MeanSquaredError(),
                                metrics=[tf.metrics.MeanAbsoluteError()])
        self.multi_val_performance[repeat_baseline.name] = repeat_baseline.evaluate(self.multi_window.val)
        self.multi_performance[repeat_baseline.name] = repeat_baseline.evaluate(self.multi_window.test, verbose=0)
        filename = 'TFmodels/' + repeat_baseline.name
        repeat_baseline.save(filename)
        #multi_window.plot(repeat_baseline)
        return
    #################################################
    ################## Linear ######################
    def multi_linear(self):
        name='Linear'
        multi_linear_model = tf.keras.Sequential([
            # Take the last time-step.
            # Shape [batch, time, features] => [batch, 1, features]
            tf.keras.layers.Lambda(lambda x: x[:, -1:, :]),
            # Shape => [batch, 1, out_steps*features]
            tf.keras.layers.Dense(self.OUT_STEPS*self.num_features,
                                  kernel_initializer=tf.initializers.zeros()),
            # Shape => [batch, out_steps, features]
            tf.keras.layers.Reshape([self.OUT_STEPS, self.num_features])
        ])
        multi_linear_model._name = name
        history = self.compile_and_fit(name, multi_linear_model, self.multi_window)
        IPython.display.clear_output()
        self.multi_val_performance[name] = multi_linear_model.evaluate(self.multi_window.val)
        self.multi_performance[name] = multi_linear_model.evaluate(self.multi_window.test, verbose=0)
        #multi_window.plot(multi_linear_model)
        return
    #################################################
    #################### DENSE #######################
    def multi_dense(self):
        name='Dense'
        multi_dense_model = tf.keras.Sequential([
            # Take the last time step.
            # Shape [batch, time, features] => [batch, 1, features]
            tf.keras.layers.Lambda(lambda x: x[:, -1:, :]),
            # Shape => [batch, 1, dense_units]
            tf.keras.layers.Dense(512, activation='relu'),
            # Shape => [batch, out_steps*features]
            tf.keras.layers.Dense(self.OUT_STEPS*self.num_features,
                                  kernel_initializer=tf.initializers.zeros()),
            # Shape => [batch, out_steps, features]
            tf.keras.layers.Reshape([self.OUT_STEPS, self.num_features])
        ])
        multi_dense_model._name = name
        history = self.compile_and_fit(name, multi_dense_model, self.multi_window)
        IPython.display.clear_output()
        self.multi_val_performance[name] = multi_dense_model.evaluate(self.multi_window.val)
        self.multi_performance[name] = multi_dense_model.evaluate(self.multi_window.test, verbose=0)
        #multi_window.plot(multi_dense_model)
        return
    #################################################
    ##################### CNN #######################
    def multi_cnn_conv(self):
        CONV_WIDTH = 3
        name='Conv'
        multi_conv_model = tf.keras.Sequential([
            # Shape [batch, time, features] => [batch, CONV_WIDTH, features]
            tf.keras.layers.Lambda(lambda x: x[:, -CONV_WIDTH:, :]),
            # Shape => [batch, 1, conv_units]
            tf.keras.layers.Conv1D(256, activation='relu', kernel_size=(CONV_WIDTH)),
            # Shape => [batch, 1,  out_steps*features]
            tf.keras.layers.Dense(self.OUT_STEPS*self.num_features,
                                  kernel_initializer=tf.initializers.zeros()),
            # Shape => [batch, out_steps, features]
            tf.keras.layers.Reshape([self.OUT_STEPS, self.num_features])
        ])
        multi_conv_model._name = name
        history = self.compile_and_fit(name, multi_conv_model, self.multi_window)
        IPython.display.clear_output()
        self.multi_val_performance[name] = multi_conv_model.evaluate(self.multi_window.val)
        self.multi_performance[name] = multi_conv_model.evaluate(self.multi_window.test, verbose=0)
        #multi_window.plot(multi_conv_model)
        return
    #################################################
    ################# RNN (LSTM) ####################
    def multi_rnn_lstm(self):
        name='LSTM'
        multi_lstm_model = tf.keras.Sequential([
            # Shape [batch, time, features] => [batch, lstm_units]
            # Adding more `lstm_units` just overfits more quickly.
            tf.keras.layers.LSTM(32, return_sequences=False),
            # Shape => [batch, out_steps*features]
            tf.keras.layers.Dense(self.OUT_STEPS*self.num_features,
                                  kernel_initializer=tf.initializers.zeros()),
            # Shape => [batch, out_steps, features]
            tf.keras.layers.Reshape([self.OUT_STEPS, self.num_features])
        ])
        multi_lstm_model._name = name
        history = self.compile_and_fit(name, multi_lstm_model, self.multi_window)
        IPython.display.clear_output()
        self.multi_val_performance[name] = multi_lstm_model.evaluate(self.multi_window.val)
        self.multi_performance[name] = multi_lstm_model.evaluate(self.multi_window.test, verbose=0)
        #multi_window.plot(multi_lstm_model)
        return
    #################################################
    ################## AR - LSTM ####################
    def multi_arr_lstm(self):
        name='AR_LSTM'
        feedback_model = FeedBack(units=32, out_steps=self.OUT_STEPS, num_features=self.num_features)
        feedback_model._name = name
        history = self.compile_and_fit(name, feedback_model, self.multi_window)
        IPython.display.clear_output()
        self.multi_val_performance[name] = feedback_model.evaluate(self.multi_window.val)
        self.multi_performance[name] = feedback_model.evaluate(self.multi_window.test, verbose=0)
        #multi_window.plot(feedback_model)
        return
    #################################################

    def run_all_models(self):
        self.multi_base()
        self.multi_repeat()
        self.multi_linear()
        self.multi_arr_lstm()
        self.multi_dense()
        self.multi_cnn_conv()
        self.multi_rnn_lstm()

    # load models from file
    def load_all_models(self,path='TFmodels/'):
        all_models = list()
        for folder in os.listdir(path):
            filename = path+folder
            # load model from file
            print (filename)
            model = load_model(filename, compile=True)
            # add to list of members
            all_models.append(model)
            print('>loaded %s' % filename)
        return all_models

    # make an ensemble prediction with weighted average per mae
    def ensemble_predictions(self,members, data):
        predictions = np.array([])
        weights = np.array([])
        for model in members:
            inputs, labels = next(iter(data))
            prediction = model(inputs) #predict
            prediction = prediction[1, :, self.num_features-1]
            for key, value in self.multi_performance.items():
                if key == str(model.name):
                    weights = np.append(weights, np.array(value[1]))
            predictions = np.concatenate([predictions, prediction])
        weights = 1/weights
        #print(weights)
        predictions = predictions.reshape(-1, self.OUT_STEPS)
        predictions = np.average(predictions, axis=0, weights=weights)
        return predictions

    def save_predictions_to_db(self):
        config = configparser.ConfigParser()
        config.read('configurator/rdbms.ini')
        destination = db.create_engine(config["destination"]["url"])
        self.final_df.to_sql(con=destination, name='timeseries_predictions', if_exists='append',
                       index=False)


