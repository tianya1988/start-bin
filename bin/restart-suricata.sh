#!/bin/sh
kill -9 $(ps -ef | grep "suricata -i em2 -D" | grep -v "grep" | awk '{print $2}' | awk -F"/" '{ print $1 }')
rm -rf /usr/local/var/run/suricata.pid
suricata -i em2 -D
