#!/bin/bash

echo 'Start executing Ex 6 for ' $1 ' - part 2'
cd  /usr/hdp/current/spark2-client/examples/src/main/python/
ls
cat wordcount.py
spark-submit /usr/hdp/current/spark2-client/examples/src/main/python/wordcount.py /user/$1/Gutenberg/Pride_and_Prejudice.txt

