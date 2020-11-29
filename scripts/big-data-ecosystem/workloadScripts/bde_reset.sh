#!/bin/bash

echo 'Reseting Ex 3 for ' $1 ' - part 2'
su $1 -c "hdfs dfs -rm -R Gutenberg"

echo 'Reseting Ex 5 for ' $1 ' - part 1'
su $1 -c "rm -R /home/$1/*"

echo 'Reseting Ex 7 for ' $1 ' - part 2'
su $1 -c "hbase shell ./bde_ex7_hbaseReset_$1.txt"

echo 'Reseting Ex 7 for ' $1 ' - part 3'
su $1 -c "hive -f bde_ex7_hiveReset_$1.sql"

echo 'Resetting /user folder'
su $1 -c "rm -R /user/$1/*"

echo 'Clear Trash for ' $1 ' ...'
su $1 -c "hdfs dfs -rm -R .Trash/*"
