#!/bin/bash

echo 'Start executing Ex 7 for ' $1 ' - part 2'
start=$(date +%s.%N)
su $1 -c "hbase shell ./bde_ex7_hbaseCmds_$1.txt"
su $1 -c "hdfs dfs -ls -R /apps/hbase/data/data/ns_$1 > /dev/null"
duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "$1 - Ex7: Part 2 Execution Time: $execution_time" >> /workloadScripts/ex7p2_time

echo 'Start executing Ex 7 for ' $1 ' - part 3'
start=$(date +%s.%N)
su $1 -c "hive -f bde_ex7_hiveCmds_$1.sql"
duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "$1 - Ex7: Part 3 Execution Time: $execution_time" >> /workloadScripts/ex7p3_time

echo 'Start executing Ex 7 for ' $1 ' - part 4'
start=$(date +%s.%N)
su $1 -c "beeline -u jdbc:hive2://dataengineer:10000/ -n $1 -p $2 -f bde_ex7_BeeCmds_$1.sql"
duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "$1 - Ex7: Part 4 Execution Time: $execution_time" >> /workloadScripts/ex7p4_time

