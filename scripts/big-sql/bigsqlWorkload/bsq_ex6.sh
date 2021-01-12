#!/bin/bash
#SCRIPTS_PATH=/workloadScripts
#GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020
JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin

current_student=$1
current_student_bigsql_passwd=$2
foldername=$3

r=$(( ( $RANDOM % 300 ) +1 ))
echo 'Sleeping ' ${r} 's before Ex6 for ' $1 ' ...'
sleep ${r}s

#source  $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/env_variables.sh
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_A.sql $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_B.sql $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_C.sql $SCRIPTS_PATH/bsq_ex6_C_$current_student.sql
sed -i 's/db2_username/'$DB2_USERNAME'/g' $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i 's/db2_password/'$DB2_PASSWORD'/g' $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i 's/db2_hostname/'$DB2_HOSTNAME'/g' $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i 's/db2_port/'$DB2_PORT'/g' $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i 's/db2_name/'$DB2_DB'/g' $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql

sed -i 's/db2_username/'$DB2_USERNAME'/g' $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql

sed -i 's/db2_username/'$DB2_USERNAME'/g' $SCRIPTS_PATH/bsq_ex6_C_$current_student.sql
sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex6_C_$current_student.sql

su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/init.sql -U $current_student -P $current_student_bigsql_passwd"
echo
echo '*** IGNORE THE ABOVE ERROR ***'
echo

echo 'Start executing Ex 6 for ' $current_student 'Part 1'
start=$(date +%s.%N)
su bigsql -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql -U bigsql -P $BIGSQL_PASSWD"
mv $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql $SCRIPTS_PATH/$foldername
end1=$(date +%s.%N)
duration1=$(echo "$end1 - $start" | bc)
execution_time1=`printf "%.2f seconds" $duration1`

echo 'Start executing Ex 6 for ' $current_student 'Part 2'
start=$end1
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql  -U $current_student -P $current_student_bigsql_passwd "
mv $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql $SCRIPTS_PATH/$foldername
end2=$(date +%s.%N)
duration2=$(echo "$end2 - $start" | bc)
execution_time2=`printf "%.2f seconds" $duration2`


echo 'Start executing Ex 6 for ' $current_student 'Part 3'
start=$end2
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex6_C_$current_student.sql -U $current_student -P $current_student_bigsql_passwd > /dev/null"
mv $SCRIPTS_PATH/bsq_ex6_C_$current_student.sql $SCRIPTS_PATH/$foldername
end3=$(date +%s.%N)
duration3=$(echo "$end3 - $start" | bc)
execution_time3=`printf "%.2f seconds" $duration3`

echo "$current_student - Ex6: Execution Times: $execution_time1, $execution_time2, $execution_time3" >> $SCRIPTS_PATH/$foldername/bsq_ex6_time
