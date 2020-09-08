#!/bin/bash
# chkconfig: 2345 10 90 
#description:开机自启脚本

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


su - es <<EOF
/home/es/elasticsearch-5.6.16/bin/elasticsearch -d;
exit;
EOF

checkPortFun 9200

echo `whoami`
