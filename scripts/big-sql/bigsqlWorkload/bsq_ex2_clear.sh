#!/bin/bash
current_student=$1
current_student_bigsql_passwd=$2
echo 'Clearing Database for user ' $current_student 


su $current_student -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2_clear.sql  -U $current_student -P $current_student_bigsql_passwd"

echo 'Start executing Ex 2 for ' $1 ' - part 2'

#su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/1_CREATE\ TABLE\ statements.sql"
#su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /bigsqlWorkload/bsq_ex2_part2.sql"

echo 'Start executing Ex 2 for ' $current_student ' - part 3'

su $current_student -c "hadoop fs -rm -r /user/$current_student/sampledata"

