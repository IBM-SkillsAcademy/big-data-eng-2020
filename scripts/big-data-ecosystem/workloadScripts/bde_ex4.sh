#!/bin/bash

r=$(( ( $RANDOM % 300 ) +1 ))
echo 'Sleeping ' ${r} 's before Ex 4 - Part 1 for ' $1 ' ...'
sleep ${r}s

start=$(date +%s.%N)

echo '\nStart executing Ex 4 for ' $1 ' - part 1'
hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar
hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount  Gutenberg/Frankenstein.txt wcount
hdfs dfs -ls wcount 1> /dev/null
hadoop fs -cat wcount/part-r-00000 1> /dev/null
hdfs dfs -rm -R wcount

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

#echo "hellllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllloooooooooooooooooooooooooooooooooooo"
#echo "hellllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllloooooooooooooooooooooooooooooooooooo" >> /workloadScripts/ex4_time
echo "$1 - Ex4:Part1 Execution Time: $execution_time" >> /workloadScripts/Adel/ex4p1_time

#wait

#sleeptime=$(( ( RANDOM % 4 )  + 3 ))
sleeptime=$(( ( RANDOM % 11 )  + 10 ))
echo 'Sleeping ' ${sleeptime} 'm before Ex 4 - Part 3 for ' $1 ' ...'
sleep ${sleeptime}m

start=$(date +%s.%N)

echo '\nStart executing Ex 4 for ' $1 ' - part 3'
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/Frankenstein.txt wcount2
hdfs dfs -rm -R wcount*
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/* wcount2
hdfs dfs -rm -R wcount*

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "$1 - Ex4:Part3 Execution Time: $execution_time" >> /workloadScripts/Adel/ex4p3_time
