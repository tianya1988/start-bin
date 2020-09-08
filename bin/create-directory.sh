#!/bin/sh
mkdir -p /data/es-alarm/data
mkdir -p /data/es-alarm/logs
mkdir -p /data/flink/flink-checkpoints
mkdir -p /data/flink/flink-tmp
mkdir -p /data/kafka/kafka-logs
mkdir -p /data/kafka/logs
mkdir -p /data/zookeeper
mkdir -p /data/jupiter
mkdir -p /data/suricata
mkdir -p /data/mongo
chown -R es:es /data/es-alarm
