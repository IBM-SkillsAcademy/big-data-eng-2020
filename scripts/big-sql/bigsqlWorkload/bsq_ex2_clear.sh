#!/bin/bash

echo 'Clearing Database for user ' $1 


su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /workloadScripts/bsq_ex2_clear.sql -C $JSQSH_CONF -U $1 -P $2"

echo 'Start executing Ex 2 for ' $1 ' - part 2'

#su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/1_CREATE\ TABLE\ statements.sql"
#su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /bigsqlWorkload/bsq_ex2_part2.sql"

echo 'Start executing Ex 2 for ' $1 ' - part 3'

su $1 -c "hadoop fs -rm -r /user/$1/sampledata"

