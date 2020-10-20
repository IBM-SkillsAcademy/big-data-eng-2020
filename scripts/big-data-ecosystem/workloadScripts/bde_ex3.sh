#!/bin/bash

echo '\nStart executing Ex 3 for ' $1 ' - part 1'
cd /usr/hdp
ls -l
ls -l 3*
ls -l current
cd /etc
ls -l
cd /etc/zookeeper/conf
ls -l

echo '\nStart executing Ex 3 for ' $1 ' - part 2'
hdfs dfs -mkdir Gutenberg
cd /labfiles
hdfs dfs -put *.txt Gutenberg
hdfs dfs -ls -R /user/$1

echo '\nStart executing Ex 3 for ' $1 ' - part 3'
hdfs fsck /user/$1/Gutenberg