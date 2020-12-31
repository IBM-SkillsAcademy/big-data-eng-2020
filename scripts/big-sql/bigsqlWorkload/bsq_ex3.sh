#!/bin/bash

SCRIPTS_PATH=/workloadScripts
GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020
JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin

current_student=$1
current_student_bigsql_passwd=$2
foldername=$3

r=$(( ( $RANDOM % 300 ) +1 ))
echo 'Sleeping ' ${r} 's before Ex3 for ' $1 ' ...'
sleep ${r}s

su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/init.sql -U $current_student -P $current_student_bigsql_passwd"
echo
echo '*** IGNORE THE ABOVE ERROR ***'
echo

echo 'Start executing Ex 3 for ' $current_student ' - part 1 & 2'
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_A.sql -U $current_student -P $current_student_bigsql_passwd"
cp $SCRIPTS_PATH/bsq_ex3_A.sql $SCRIPTS_PATH/$foldername
end1=$(date +%s.%N)
duration1=$(echo "$end1 - $start" | bc)
execution_time1=`printf "%.2f seconds" $duration1`


r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before Part 3 for ' $1 ' ...'
sleep ${r}s

echo 'Start executing Ex 3 for ' $current_student ' - part 3'
start=$(date +%s.%N)
su $current_student -c "/bin/cp /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/Array_Data.txt /home/$current_student/product_line_array.csv"
su $current_student -c "cat /home/$current_student/product_line_array.csv"
su $current_student -c "hadoop fs -copyFromLocal /home/$current_student/product_line_array.csv /user/$current_student/sampledata/data"
su $current_student -c "hadoop fs -ls /user/$current_student/sampledata/data/product_line_array.csv"
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex3_B.sql $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex3_B_$current_student.sql $SCRIPTS_PATH/$foldername
end3=$(date +%s.%N)
duration3=$(echo "$end3 - $start" | bc)
execution_time3=`printf "%.2f seconds" $duration3`

echo 'Start executing Ex 3 for ' $current_student ' - part 4,5'
start=$(date +%s.%N)
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex3_C.sql $SCRIPTS_PATH/
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_C.sql -U $current_student -P $current_student_bigsql_passwd"
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_D.sql -U $current_student -P $current_student_bigsql_passwd > /dev/null"
su $current_student -c "hadoop fs -ls /warehouse/tablespace/external/hive/$current_student.db/big_sales_parquet"
end4=$(date +%s.%N)
duration4=$(echo "$end4 - $start" | bc)
execution_time4=`printf "%.2f seconds" $duration4`

echo "$current_student - Ex3: Execution Times: $execution_time1, $execution_time3, $execution_time4" >> $SCRIPTS_PATH/$foldername/bsq_ex3_time

