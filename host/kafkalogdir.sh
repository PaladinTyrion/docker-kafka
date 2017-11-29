#!/bin/bash

dir='/data0/kafka'

if [ $# -eq 0 ]; then
    echo "Usage: ./kafkalogdir.sh [path_name]"
    echo "Default path: /data0/kafka"
fi

if [ -n "$1" ]; then
   dir="$1"
fi

### create dir
mkdir -p $dir'/kafka-logs'
mkdir -p $dir'/kafka-runlog'
chmod -R +x $dir

### create groups && users
# create kafka user
id "kafka" >& /dev/null
if [ $? -ne 0 ]
then
    groupadd -r kafka -g 440
    useradd -r -s /sbin/nologin -M -c "Kafka service user" -u 440 -g kafka kafka
fi
# chown groups && users
chown -R kafka:kafka $dir
