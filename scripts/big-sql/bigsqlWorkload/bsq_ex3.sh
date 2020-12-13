#!/bin/bash

echo 'Start executing Ex 3 for ' $1 ' - part 1 & 2'


su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_A.sql -C $JSQSH_CONF -U $1 -P $2"



#echo 'Start executing Ex 3 for ' $1 ' - part 3'

su $1 -c "/bin/cp /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/Array_Data.txt /home/$1/product_line_array.csv"
su $1 -c "cat /home/$1/product_line_array.csv"

su $1 -c "hadoop fs -copyFromLocal  /user/$1/sampledata /user/$1/sampledata/data"
su $1 -c "hadoop fs -ls /user/$1/sampledata/data"

echo 'Start executing Ex 2 for ' $1 ' - part 4'

su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_B.sql -C $JSQSH_CONF -U $1 -P $2"

#echo 'Start executing Ex 3 for ' $1 ' - part 4 & 5'
su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_C.sql -C $JSQSH_CONF -U $1 -P $2"

su $1 -c "hadoop fs  -ls /warehouse/tablespace/external/hive/$1.db/big_sales_parquet"