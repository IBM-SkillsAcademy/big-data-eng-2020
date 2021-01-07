#!/bin/bash

r=$(( ($RANDOM % 300 ) +1 ))
echo 'Sleeping ' ${r} 's before Ex 6 for ' $1 ' ...'
sleep ${r}s

start=$(date +%s.%N)
echo 'Start executing Ex 6 for ' $1 ' - part 2'
cd  /usr/hdp/current/spark2-client/examples/src/main/python/
ls >> /dev/null
cat wordcount.py >> /dev/null
spark-submit /usr/hdp/current/spark2-client/examples/src/main/python/wordcount.py /user/$1/Gutenberg/Pride_and_Prejudice.txt

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "$1 - Ex6: Execution Time: $execution_time" >> /workloadScripts/ex6_time
