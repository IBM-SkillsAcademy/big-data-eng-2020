#!/bin/bash

#SCRIPTS_PATH=/workloadScripts
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin
current_student=$1
current_student_bigsql_passwd=$2
foldername=$3

su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/init.sql -U $current_student -P $current_student_bigsql_passwd"
echo
echo '*** IGNORE THE ABOVE ERROR ***'
echo

echo 'Clearing Database for user ' $current_student 
su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex3_clear.sql  -U $current_student -P $current_student_bigsql_passwd"
cp $SCRIPTS_PATH/bsq_ex3_clear.sql $SCRIPTS_PATH/$foldername
su $current_student -c "hadoop fs -rm -r /user/$current_student/sampledata"

