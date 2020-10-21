#!/bin/bash

echo 'Reseting Ex 3 for ' $1 ' - part 2'

su $1 -c "hdfs dfs -rm -R /user/student0008/*"

echo 'Reseting Ex 7 for ' $1 ' - part 2'

su $1 -c "hbase shell ./bde_ex7_hbaseReset_$1.txt"

echo 'Reseting Ex 7 for ' $1 ' - part 3'

su $1 -c "hive -f bde_ex7_hiveReset_$1.sql"


