#!/bin/bash

echo '\nStart executing Ex 4 for ' $1 ' - part 1'
hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar
hadoop jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/Frankenstein.txt wcount
hdfs dfs -ls wcount
hadoop fs -cat wcount/part-r-00000
hdfs dfs -rm -R wcount

echo '\nStart executing Ex 4 for ' $1 ' - part 3'
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/Frankenstein.txt wcount2
hdfs dfs -rm -R wcount*
yarn jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-mapreduce-examples.jar wordcount Gutenberg/* wcount2
hdfs dfs -rm -R wcount*
