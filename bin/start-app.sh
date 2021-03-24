#!/bin/sh
checkPortFun(){
    checkStr=`netstat -an | grep "$1" | awk '$NF == "LISTEN" {print $0}' | wc -l`
    while (($checkStr != 1))
    do
    checkStr=`netstat -an | grep "$1" | awk '$NF == "LISTEN" {print $0}' | wc -l`
    if(($checkStr == 1))
    then
    echo "$1 already start" 
    break;
    else
    echo "$1 wait .." 
    sleep 1
    fi
    done
}

echo "start mysql begin"
service mysqld start
checkPortFun 3306

echo "start mongod begin"
systemctl start mongod
#checkPortFun 27017

echo "start docker begin"
docker rm jupiter
docker run -d -p 127.0.0.1:5001:5001 --name jupiter --restart=always -v /opt/scsc/Jupiter/config.ini:/opt/scsc/Jupiter/config.ini -v /opt/scsc/Jupiter/pocs:/opt/scsc/Jupiter/pocs -v /opt/scsc/Jupiter/dicts:/opt/scsc/Jupiter/dicts  -v /opt/scsc/Jupiter/update:/opt/scsc/Jupiter/update scsc/jupiter:0.7.1
#docker start  jupiter
sleep 2
echo "start app-api begin"
cd /opt/scsc/scsc-app-api
sh scsc-app-api.sh start
checkPortFun 8214
sleep 2
echo "start flume step begin"
/opt/soft/apache-flume-1.8.0-bin/collectalert.sh
/opt/soft/apache-flume-1.8.0-bin/collectpro.sh
/opt/soft/apache-flume-1.8.0-bin/agentalert.sh
/opt/soft/apache-flume-1.8.0-bin/agentpro.sh
#echo "start flink cluster step begin"
#/opt/soft/flink-1.9.1/bin/start-cluster.sh
systemctl start flink
checkPortFun 8081
sleep 2
echo "start flink app step begin"
sleep 10
/opt/scsc/apps/bin/log2es.sh
sleep 5
/opt/scsc/apps/bin/logRule2es.sh
sleep 5
/opt/scsc/apps/bin/suricataAlert2EsService.sh
sleep 5
/opt/scsc/apps/bin/suricataData2es.sh
echo "start ti begin"
/opt/scsc/ti/start.sh
checkPortFun 5002
echo "flink app start ok"
