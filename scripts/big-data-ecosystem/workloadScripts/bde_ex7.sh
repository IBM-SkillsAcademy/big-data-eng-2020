#!/bin/bash

echo 'Start executing Ex 7 for ' $1 ' - part 2'

su $1 -c "hbase shell ./bde_ex7_hbaseCmds_$1.txt"
su $1 -c "hdfs dfs -ls -R /apps/hbase/data/data/ns_$1"

echo 'Start executing Ex 7 for ' $1 ' - part 3'

su $1 -c "hive -f bde_ex7_hiveCmds_$1.sql"

echo 'Start executing Ex 7 for ' $1 ' - part 4'

su $1 -c "beeline -u jdbc:hive2://dataengineer:10000/ -n $1 -p $2 -f bde_ex7_BeeCmds_$1.sql"


