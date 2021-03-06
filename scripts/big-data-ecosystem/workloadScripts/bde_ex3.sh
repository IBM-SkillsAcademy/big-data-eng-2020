#!/bin/bash

start=$(date +%s.%N)
echo '\nStart executing Ex 3 for ' $1 ' - part 1'
cd /usr/hdp
ls -l 1> /dev/null
ls -l 3* 1> /dev/null
ls -l current 1> /dev/null
cd /etc
ls -l 1> /dev/null
cd /etc/zookeeper/conf
ls -l 1> /dev/null

echo '\nStart executing Ex 3 for ' $1 ' - part 2'
hdfs dfs -mkdir Gutenberg
cd /labfiles
hdfs dfs -put *.txt Gutenberg
hdfs dfs -ls -R /user/$1 1> /dev/null

echo '\nStart executing Ex 3 for ' $1 ' - part 3'
hdfs fsck /user/$1/Gutenberg 1> /dev/null

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "$1 - Ex3: Execution Time: $execution_time" >> /workloadScripts/ex3_time
