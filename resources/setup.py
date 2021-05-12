import urllib.request
import tarfile
import subprocess
import os
import configparser

class setup_kafka():
    def __init__(self):
        if not os.path.exists("./resources/kafka/kafka.tgz"):
            print('Downloading...')
            url = 'https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz'
            path = './resources/kafka/kafka.tgz'
            urllib.request.urlretrieve(url, path)
            my_tar = tarfile.open(path)
            my_tar.extractall('./resources/kafka/')
            my_tar.close()

        self.streamconfig = configparser.ConfigParser()
        self.streamconfig.read('configurator/streaming.ini')
        self.password = self.streamconfig["local"]["password"]
        self.startZookeeper = 'sudo -S ./resources/kafka/kafka_2.13-2.7.0/bin/zookeeper-server-start.sh -daemon \
        ./resources/kafka/kafka_2.13-2.7.0/config/zookeeper.properties'
        self.startKafka = 'sudo ./resources/kafka/kafka_2.13-2.7.0/bin/kafka-server-start.sh -daemon \
        ./resources/kafka/kafka_2.13-2.7.0/config/server.properties'
        self.topicName = "dataStream"
        self.createTopic = 'sudo -S ./resources/kafka/kafka_2.13-2.7.0/bin/kafka-topics.sh --create \
        --zookeeper 127.0.0.1:2181 --replication-factor 1 --partitions 2 --topic '+self.topicName
        self.stopZookeeper = 'sudo -S ./resources/kafka/kafka_2.13-2.7.0/bin/zookeeper-server-stop.sh'

        proc = subprocess.Popen(self.startZookeeper.split(), stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        proc.communicate(self.password.encode())
        proc = subprocess.Popen(self.startKafka.split(), stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        proc.communicate(self.password.encode())
        proc = subprocess.Popen(self.createTopic.split(), stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        proc.communicate(self.password.encode())

        #proc = subprocess.Popen(stopZookeeper.split(), stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        #proc.communicate(password.encode())