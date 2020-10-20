#!/bin/bash

hbasefilename="bde_ex7_hbaseCmds_"$1".txt"
hbaseRsetfilename="bde_ex7_hbaseReset_"$1".txt"

echo "Creating "$hbasefilename" file"

if test -f "$hbasefilename"; then
rm $hbasefilename
fi

echo "help" >> $hbasefilename
echo "create 'ns_$1:t1', 'cf1', 'cf2', 'cf3'" >> $hbasefilename
echo "list_namespace_tables 'ns_$1'" >> $hbasefilename
echo "desc 'ns_$1:t1'" >> $hbasefilename
echo "alter 'ns_$1:t1', {NAME => 'cf1', COMPRESSION => 'GZ'}" >> $hbasefilename
echo "alter 'ns_$1:t1', {NAME => 'cf1', IN_MEMORY => 'true'}" >> $hbasefilename
echo "alter 'ns_$1:t1', {NAME => 'cf1', VERSIONS => 3}, {NAME => 'cf2', VERSIONS => 2}" >> $hbasefilename
echo "describe 'ns_$1:t1'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row1', 'cf1:c11', 'r1v11'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row1', 'cf1:c12', 'r1v12'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row1', 'cf2:c21', 'r1v21'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row1', 'cf3:c31', 'r1v31'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row2', 'cf1:d11', 'r2v11'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row2', 'cf1:d12', 'r2v12'" >> $hbasefilename
echo "put 'ns_$1:t1', 'row2', 'cf2:d21', 'r2v21'" >> $hbasefilename
echo "get 'ns_$1:t1', 'row1'" >> $hbasefilename
echo "scan 'ns_$1:t1'" >> $hbasefilename
echo "exit" >> $hbasefilename

echo "Creating $hbaseRsetfilename file"

if test -f "$hbaseRsetfilename"; then
rm $hbaseRsetfilename
fi

echo "disable 'ns_$1:t1'" >> $hbaseRsetfilename
echo "drop 'ns_$1:t1'" >> $hbaseRsetfilename
echo "exit" >> $hbaseRsetfilename

hivefilename="bde_ex7_hiveCmds_"$1".sql"
hiveResetfilename="bde_ex7_hiveReset_"$1".sql"

echo "Creating "$hivefilename" file"

if test -f "$hivefilename"; then
rm $hivefilename
fi


echo "create table db_$1.chicago_bus (timelog timestamp, region int, buscount int, logreads int, speed float) row format delimited fields terminated by ',' lines terminated by \"\n\" STORED AS TEXTFILE;" >> $hivefilename
echo "use db_$1;" >> $hivefilename
echo "show tables;" >> $hivefilename
echo "load data local inpath '/labfiles/Chicago_Traffic_Tracker.csv' into table db_$1.chicago_bus;" >> $hivefilename
echo "select * from db_$1.chicago_bus limit 10;" >> $hivefilename
echo "select to_date(timelog), region, avg(speed) from db_$1.chicago_bus group by to_date(timelog), region;" >> $hivefilename
echo "create table db_$1.chicago_region_speed (logdate timestamp, region int, speed float) row format delimited fields terminated by ',';" >> $hivefilename
echo "insert into table db_$1.chicago_region_speed select to_date(timelog) as timelog,region,avg(speed) as speed from db_$1.chicago_bus group by to_date(timelog),region;" >> $hivefilename
echo "select * from db_$1.chicago_region_speed limit 10;" >> $hivefilename

echo "Creating "$hiveResetfilename" file"

if test -f "$hiveResetfilename"; then
rm $hiveResetfilename
fi

echo "DROP TABLE IF EXISTS db_$1.chicago_bus;" >> $hiveResetfilename
echo "DROP TABLE IF EXISTS db_$1.chicago_region_speed;" >> $hiveResetfilename

beelinefilename="bde_ex7_BeeCmds_"$1".sql"

echo "Creating "$beelinefilename" file"

if test -f "$beelinefilename"; then
rm $beelinefilename
fi

echo "use db_$1;" >> $beelinefilename
echo "show tables;" >> $beelinefilename
echo "select * from db_$1.chicago_bus limit 10;" >> $beelinefilename
echo "select * from db_$1.chicago_region_speed limit 10;" >> $beelinefilename
