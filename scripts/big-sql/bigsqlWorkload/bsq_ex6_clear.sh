#!/bin/bash

SCRIPTS_PATH=/workloadScripts
GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020
JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin

current_student=$1
current_student_bigsql_passwd=$2
foldername=$3

source  $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/env_variables.sh

echo 'Start clearing Ex 6 for ' $current_student

/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_A_clear.sql $SCRIPTS_PATH/bsq_ex6_A_clear_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_B_clear.sql $SCRIPTS_PATH/bsq_ex6_B_clear_$current_student.sql

sed -i 's/username/'$current_student'/g' $SCRIPTS_PATH/bsq_ex6_A_clear_$current_student.sql

su $current_student -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex6_B_clear_$current_student.sql -U $current_student -P $current_student_bigsql_passwd "
su bigsql -c "$JSQSH_bin/jsqsh bigsql < $SCRIPTS_PATH/bsq_ex6_A_clear_$current_student.sql  -U bigsql -P $BIGSQL_PASSWD"
mv $SCRIPTS_PATH/bsq_ex6_B_clear_$current_student.sql $SCRIPTS_PATH/$foldername
mv $SCRIPTS_PATH/bsq_ex6_A_clear_$current_student.sql $SCRIPTS_PATH/$foldername

