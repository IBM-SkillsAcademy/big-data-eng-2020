#!/bin/bash

#!/bin/bash
#SCRIPTS_PATH=/workloadScripts
#GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020

#cd $GIT_REPO_DIR
#git pull
#
#/bin/cp $GIT_REPO_DIR/scripts/big-sql/*.sh $SCRIPTS_PATH/
#/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sh $SCRIPTS_PATH/
#/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sql $SCRIPTS_PATH/
#chmod a+x $SCRIPTS_PATH/*.sh
JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin
#n=12

current_student=$1
current_student_bigsql_passwd=$2
filename=$3

r=$(( ( $RANDOM % 300 ) +1 ))
echo 'Sleeping ' ${r} 's before Ex2 for ' $1 ' ...'
sleep ${r}s

su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/init.sql -U $current_student -P $current_student_bigsql_passwd"
echo
echo '*** IGNORE THE ABOVE ERROR ***'
echo

echo 'Start executing Ex 2 for ' $current_student ' - part 1,2'
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_A.sql -U $current_student -P $current_student_bigsql_passwd"
end1=$(date +%s.%N)
duration1=$(echo "$end1 - $start" | bc)
execution_time1=`printf "%.2f seconds" $duration1`

echo 'Start executing Ex 2 for ' $current_student ' - part 3'
start=$(date +%s.%N)
su $current_student -c "hadoop fs -mkdir /user/$current_student/sampledata"
su $current_student -c "hadoop fs -ls /user/$current_student/"
su $current_student -c "hadoop fs -copyFromLocal /usr/ibmpacks/bigsql/6.0.0.0/bigsql/samples/data/ /user/$current_student/sampledata"
su $current_student -c "hadoop fs -ls /user/$current_student/sampledata/data"
end3=$(date +%s.%N)
duration3=$(echo "$end3 - $start" | bc)
execution_time3=`printf "%.2f seconds" $duration3`

echo 'Start executing Ex 2 for ' $current_student ' - part 4,5,6'
su $current_student -c "hadoop fs -ls /user/$current_student/sampledata/data/GOSALESDW.SLS_PRODUCT_LOOKUP.txt"

/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B0.sql $SCRIPTS_PATH/bsq_ex2_B0_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B1.sql $SCRIPTS_PATH/bsq_ex2_B1_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B2.sql $SCRIPTS_PATH/bsq_ex2_B2_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B3.sql $SCRIPTS_PATH/bsq_ex2_B3_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B4.sql $SCRIPTS_PATH/bsq_ex2_B4_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B5.sql $SCRIPTS_PATH/bsq_ex2_B5_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B6.sql $SCRIPTS_PATH/bsq_ex2_B6_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B7.sql $SCRIPTS_PATH/bsq_ex2_B7_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B.sql $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql

sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B0_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B1_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B2_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B3_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B4_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B5_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B6_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B7_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD1 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B0_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B0_$current_student.sql $SCRIPTS_PATH/$filename
end4=$(date +%s.%N)
duration4=$(echo "$end4 - $start" | bc)
execution_time4=`printf "%.2f seconds" $duration4`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD2 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B1_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B1_$current_student.sql $SCRIPTS_PATH/$filename
end5=$(date +%s.%N)
duration5=$(echo "$end5 - $start" | bc)
execution_time5=`printf "%.2f seconds" $duration5`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD3 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B2_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B2_$current_student.sql $SCRIPTS_PATH/$filename
end6=$(date +%s.%N)
duration6=$(echo "$end6 - $start" | bc)
execution_time6=`printf "%.2f seconds" $duration6`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD4 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B3_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B3_$current_student.sql $SCRIPTS_PATH/$filename
end7=$(date +%s.%N)
duration7=$(echo "$end7 - $start" | bc)
execution_time7=`printf "%.2f seconds" $duration7`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD5 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B4_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B4_$current_student.sql $SCRIPTS_PATH/$filename
end8=$(date +%s.%N)
duration8=$(echo "$end8 - $start" | bc)
execution_time8=`printf "%.2f seconds" $duration8`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD6 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B5_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B5_$current_student.sql $SCRIPTS_PATH/$filename
end9=$(date +%s.%N)
duration9=$(echo "$end9 - $start" | bc)
execution_time9=`printf "%.2f seconds" $duration9`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD7 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B6_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B6_$current_student.sql $SCRIPTS_PATH/$filename
end10=$(date +%s.%N)
duration10=$(echo "$end10 - $start" | bc)
execution_time10=`printf "%.2f seconds" $duration10`

r=$(( ( $RANDOM % 60 )+0 ))
echo 'Sleeping ' ${r} 's before LOAD8 for ' $1 ' ...'
sleep ${r}s
start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B7_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B7_$current_student.sql $SCRIPTS_PATH/$filename
end11=$(date +%s.%N)
duration11=$(echo "$end11 - $start" | bc)
execution_time11=`printf "%.2f seconds" $duration11`

start=$(date +%s.%N)
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql $SCRIPTS_PATH/$filename
end12=$(date +%s.%N)
duration12=$(echo "$end12 - $start" | bc)
execution_time12=`printf "%.2f seconds" $duration12`

echo 'Start executing Ex 2 for ' $current_student ' - part 7'
start=$(date +%s.%N)
su $current_student -c "hdfs dfs -mkdir /user/$current_student/bigsql_lab"
su $current_student -c "hdfs dfs -mkdir /user/$current_student/bigsql_lab/sls_product_dim"
su $current_student -c "hdfs dfs -chmod -R 777 /user/$current_student/bigsql_lab"
su $current_student -c "hdfs dfs -copyFromLocal /usr/ibmpacks/bigsql/6.0.0.0/bigsql/samples/data/GOSALESDW.SLS_PRODUCT_DIM.txt /user/$current_student/bigsql_lab/sls_product_dim/SLS_PRODUCT_DIM.txt"
su $current_student -c "hdfs dfs -ls /user/$current_student/bigsql_lab/sls_product_dim"
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_C.sql $SCRIPTS_PATH/bsq_ex2_C_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex2_C_$current_student.sql
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex2_C_$current_student.sql -U $current_student -P $current_student_bigsql_passwd"
mv $SCRIPTS_PATH/bsq_ex2_C_$current_student.sql $SCRIPTS_PATH/$filename
end13=$(date +%s.%N)
duration13=$(echo "$end13 - $start" | bc)
execution_time13=`printf "%.2f seconds" $duration13`

echo "$current_student - Ex2: Execution Times: $execution_time1, $execution_time3, $execution_time4, $execution_time5, $execution_time6, $execution_time7, $execution_time8, $execution_time9, $execution_time10, $execution_time11, $execution_time12, $execution_time13" >> $SCRIPTS_PATH/$filename/bsq_ex2_time

