#!/bin/bash

min=$1
max=$2
HDFSGRP=$3

function pause(){
 read -s -n 1 -p 'Press any key to continue . . .'
 echo ''
}

hdfs dfs -chmod 777 /user

for (( n=$min; n<=$max; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    hadoop fs -mkdir /user/$current_student/
    hadoop fs -chown $current_student:$HDFSGRP /user/$current_student
done
pause
echo ''

exit
