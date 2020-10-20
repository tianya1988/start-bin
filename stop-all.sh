kill -9 $(ps -ef | grep "suricata -i" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
#kill -9 $(ps -ef | grep "/opt/soft/kafka_2.11-1.0.0/bin" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
#systemctl stop kafka
#kill -9 $(ps -ef | grep "/opt/soft/zookeeper-3.4.6/bin" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
#systemctl stop zookeeper
kill -9 $(ps -ef | grep "/home/es/elasticsearch-5.6.16" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
#kill -9 $(ps -ef | grep "flink-1.9.1" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
kill -9 $(ps -ef | grep "apache-flume-1.8.0-bin" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
kill -9 $(ps -ef | grep "/opt/scsc/scsc-app-api" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
kill -9 $(ps -ef | grep "/opt/scsc/ti/manager" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')

docker stop jupiter
docker rm jupiter
systemctl stop mysql
systemctl stop mongod
