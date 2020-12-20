#!/bin/bash

current_student=$1
current_student_bigsql_passwd=$2
echo 'Start executing Ex 2 for ' $current_student ' - part 1,2'

DB2_HOSTNAME=$3
DB2_USERNAME=$4
DB2_PASSWORD=$5
DB2_PORT=$6
DB2_DB=$7
BIGSQL_PASSWD=$8
#su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2_A.sql  -U $current_student -P $current_student_bigsql_passwd"


#su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/1_CREATE\ TABLE\ statements.sql"
#su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /bigsqlWorkload/bsq_ex2_part2.sql"

echo 'Start executing Ex 6 for ' $current_student 'Part 1'



/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_A.sql $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/bsq_ex6_B.sql $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql

sed -i "s/db2_username/$DB2_USERNAME/" $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i "s/db2_password/$DB2_PASSWORD/" $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i "s/db2_hostname/$DB2_HOSTNAME/" $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i "s/db2_port/$DB2_PORT/" $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql
sed -i "s/db2_name/$DB2_DB/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
sed -i "s/username/$current_student/" $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql

su bigsql -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex6_A_$current_student.sql  -U bigsql -P $BIGSQL_PASSWD"
#rm $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql

sed -i "s/db2_username/$DB2_USERNAME/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
#sed -i "s/db2_password/$DB2_PASSWORD/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
#sed -i "s/db2_hostname/$DB2_HOSTNAME/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
#sed -i "s/db2_port/$DB2_PORT/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
#sed -i "s/db2_name/$DB2_DB/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
#sed -i "s/username/$current_student/" $SCRIPTS_PATH/bsq_ex6_B_$current_student.sql
#echo 'Start executing Ex 2 for ' $current_student ' - part 7'


echo 'Start executing Ex 6 for ' $current_student 'Part 2'
su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex6_B_$current_student.sql  -U bigsql -P $current_student_bigsql_passwd "
#rm $SCRIPTS_PATH/bsq_ex6_A_$current_student.sql

	
	

