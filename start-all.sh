#!/bin/sh
# chkconfig: 2345 10 90 
#description:开机自启脚本
checkProgramFun(){
    checkStr=`ps -ef | grep "$1" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }' | wc -l`
    while (($checkStr != 1))
    do
    checkStr=`ps -ef | grep "$1" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }' | wc -l`
    if(($checkStr == 1))
    then
    echo "$1 already start"
    break;
    else
    echo "$1 wait ..."
    sleep 1
    fi
    done
}

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
    echo "$1 wait ..."
    sleep 1
    fi
    done
}
#mount /opt/soft/CentOS-7-x86_64-DVD-1810.iso /data/centos
source /etc/profile
/opt/start-bin/bin/start-es.sh
checkPortFun 9200
echo "start es alarm success !"
echo `whoami` 
echo "begin start mini application ..."
sleep 3
# rm -rf /data/zookeeper/*
#cd /opt/soft/zookeeper-3.4.6/bin/
#./zkServer.sh start
#checkPortFun 2181
#sleep 3
#cd /opt/soft/kafka_2.11-1.0.0/bin
#./kafka-server-start.sh -daemon ../config/server.properties
#checkPortFun 6667
#echo "start kafka success"
sleep 3
echo "start collector success"
rm -rf /usr/local/var/run/suricata.pid
suricata -i em2 -D
/opt/start-bin/bin/start-app.sh
#echo "start app ..."
echo "start success !"





