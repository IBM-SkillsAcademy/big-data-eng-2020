#!/bin/bash

echo 'Start executing Ex 5 for ' $1 ' - part 1'
ls /labfiles/WordCount2/
cp /labfiles/WordCount2/WordCount2.java .
hadoop classpath
javac -cp `hadoop classpath` WordCount2.java
jar cf WC2.jar *.class
rm *.class
hdfs dfs -put /labfiles/WordCount2/patternsToSkip
hadoop jar WC2.jar WordCount2 -D wordcount.case.sensitive=false Gutenberg/*.txt wc2out -skip patternsToSkip
hdfs dfs -ls wc2out
hdfs dfs -cat wc2out/part-r-00000
hdfs dfs -rm -R wc2out

