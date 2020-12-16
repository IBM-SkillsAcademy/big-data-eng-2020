#!/bin/bash
current_student=$1
current_student_bigsql_passwd=$2

echo 'Start executing Ex 3 for ' $current_student ' - part 1 & 2'


su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_A.sql  -U $current_student -P $current_student_bigsql_passwd"

#su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_A.sql -U $1 -P $2"



echo 'Start executing Ex 3 for ' $current_student ' - part 3'

su $1 -c "/bin/cp /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/Array_Data.txt /home/$current_student/product_line_array.csv"
su $1 -c "cat /home/$current_student/product_line_array.csv"

su $1 -c "hadoop fs -copyFromLocal  /home/$current_student/sampledata /user/$current_student/sampledata/data"
su $1 -c "hadoop fs -ls /user/$current_student/sampledata/data"

/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex3_B.sql $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql
sed -i 's/username/$current_student/' $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql
su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_B_$current_student.sql  -U $current_student -P $current_student_bigsql_passwd"
rm $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql

echo 'Start executing Ex 2 for ' $1 ' - part 4'

su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_B.sql -C $JSQSH_CONF -U $1 -P $2"

#echo 'Start executing Ex 3 for ' $1 ' - part 4 & 5'
su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex3_C.sql -C $JSQSH_CONF -U $1 -P $2"

su $1 -c "hadoop fs  -ls /warehouse/tablespace/external/hive/$1.db/big_sales_parquet"

