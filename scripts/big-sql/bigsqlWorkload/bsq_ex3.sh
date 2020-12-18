#!/bin/bash

SCRIPTS_PATH=/workloadScripts/Adel
GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020
JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin

current_student=$1
current_student_bigsql_passwd=$2

echo 'Start executing Ex 3 for ' $current_student ' - part 1 & 2'

su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_A.sql -U $current_student -P $current_student_bigsql_passwd"

#su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_A.sql -U $current_student -P $current_student_bigsql_passwd"

echo 'Start executing Ex 3 for ' $current_student ' - part 3'

#su $current_student -c "mkdir -p /home/$current_student/"
#su $current_student -c "hadoop fs -mkdir -p /home/$current_student/"
su $current_student -c "/bin/cp /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/Array_Data.txt /home/$current_student/product_line_array.csv"
su $current_student -c "cat /home/$current_student/product_line_array.csv"

su $current_student -c "hadoop fs -copyFromLocal /home/$current_student/product_line_array.csv /user/$current_student/sampledata/data"
su $current_student -c "hadoop fs -ls /user/$current_student/sampledata/data/product_line_array.csv"

/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex3_B.sql $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql
sed -i 's/username/'$current_student'/' $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
rm $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql

echo 'Start executing Ex 3 for ' $current_student ' - part 4,5'
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex3_C.sql $SCRIPTS_PATH/
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_C.sql -U $current_student -P $current_student_bigsql_passwd"

su $current_student -c "hadoop fs -ls /warehouse/tablespace/external/hive/$current_student.db/big_sales_parquet"

