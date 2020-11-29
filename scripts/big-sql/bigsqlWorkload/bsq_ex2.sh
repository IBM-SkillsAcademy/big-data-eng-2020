#!/bin/bash

echo 'Start executing Ex 2 for ' $1 ' - part 1'

su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /bigsqlWorkload/bsq_ex2_part1.sql"

echo 'Start executing Ex 2 for ' $1 ' - part 2'

su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/1_CREATE\ TABLE\ statements.sql"
su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /bigsqlWorkload/bsq_ex2_part2.sql"

echo 'Start executing Ex 2 for ' $1 ' - part 3'

su $1 -c "hadoop fs -mkdir /user/$1/sampledata"
su $1 -c "hadoop fs -ls /user/$1/"
su $1 -c "hadoop fs -copyFromLocal /usr/ibmpacks/bigsql/6.0.0.0/bigsql/samples/data/ /user/$1/sampledata"
su $1 -c "hadoop fs -ls /user/$1/sampledata/data"

echo 'Start executing Ex 2 for ' $1 ' - part 4'

su $1 -c "/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh bigsql < /home/bigsql/labfiles/bigsql/BIG_SQL_Data_Analysis/bsq_ex2_part1_$1.sql"
