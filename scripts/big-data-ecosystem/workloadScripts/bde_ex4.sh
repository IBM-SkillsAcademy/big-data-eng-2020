#!/bin/bash

start=$(date +%s.%N)

echo '\nStart executing Ex 4 for ' $1 ' - part 1'
hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar
hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/Frankenstein.txt wcount
hdfs dfs -ls wcount
hadoop fs -cat wcount/part-r-00000
hdfs dfs -rm -R wcount

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "$1 - Ex4:Part1 Execution Time: $execution_time" >> /workloadScripts/ex4_time

start=$(date +%s.%N)

echo '\nStart executing Ex 4 for ' $1 ' - part 3'
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/Frankenstein.txt wcount2
hdfs dfs -rm -R wcount*
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/* wcount2
hdfs dfs -rm -R wcount*

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "$1 - Ex4:Part3 Execution Time: $execution_time" >> /workloadScripts/ex4_time