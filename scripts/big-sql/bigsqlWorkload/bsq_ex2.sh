#!/bin/bash

#!/bin/bash
export SCRIPTS_PATH=/workloadScripts
export GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020

cd $GIT_REPO_DIR
git pull
#
/bin/cp $GIT_REPO_DIR/scripts/big-sql/*.sh $SCRIPTS_PATH/
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sh $SCRIPTS_PATH/
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sql $SCRIPTS_PATH/
chmod a+x $SCRIPTS_PATH/*.sh
export JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
#export JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh
n=12



current_student=$1
current_student_bigsql_passwd=$2
echo 'Start executing Ex 2 for ' $current_student ' - part 1,2'


su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2_A.sql  -U $current_student -P $current_student_bigsql_passwd"


#su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/1_CREATE\ TABLE\ statements.sql"
#su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /bigsqlWorkload/bsq_ex2_part2.sql"

echo 'Start executing Ex 2 for ' $current_student ' - part 3'

su $current_student -c "hadoop fs -mkdir /user/$current_student/sampledata"
su $current_student -c "hadoop fs -ls /user/$current_student/"
su $current_student -c "hadoop fs -copyFromLocal /usr/ibmpacks/bigsql/6.0.0.0/bigsql/samples/data/ /user/$current_student/sampledata"
su $current_student -c "hadoop fs -ls /user/$current_student/sampledata/data"

echo 'Start executing Ex 2 for ' $current_student ' - part 4,5,6'
su $current_student -c "hadoop fs -ls /user/$current_student/sampledata/data/GOSALESDW.SLS_PRODUCT_LOOKUP.txt"

/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_B.sql $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql
sed -i 's/username/$current_student/' $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql
su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2_B_$current_student.sql  -U $current_student -P $current_student_bigsql_passwd"
rm $SCRIPTS_PATH/bsq_ex2_B_$current_student.sql


echo 'Start executing Ex 2 for ' $current_student ' - part 7'


	
	

su $current_student -c "hdfs dfs -mkdir /user/$current_student/bigsql_lab"
su $current_student -c "hdfs dfs -mkdir /user/$current_student/bigsql_lab/sls_product_dim"
su $current_student -c "hdfs dfs -chmod -R 777 /user/$current_student/bigsql_lab"

su $current_student -c "hdfs dfs -copyFromLocal /usr/ibmpacks/bigsql/6.0.0.0/bigsql/samples/data/GOSALESDW.SLS_PRODUCT_DIM.txt /user/$current_student/bigsql_lab/sls_product_dim/SLS_PRODUCT_DIM.txt"


su $current_student -c "hdfs dfs -ls /user/$current_student/bigsql_lab/sls_product_dim"

/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex2_C.sql $SCRIPTS_PATH/bsq_ex2_C_$current_student.sql
sed -i "'s/username/$current_student/' $SCRIPTS_PATH/bsq_ex2_D_$current_student.sql"
su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2_C_$current_student.sql  -U $current_student -P $2"
rm $SCRIPTS_PATH/bsq_ex2_C_$current_student.sql
