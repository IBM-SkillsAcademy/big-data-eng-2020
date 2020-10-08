#!/bin/bash

function pause(){
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}

#if [[ ! ("$#" == 2 && $1 =~ ^[0-9]+$) ]]; then 
#    echo 'Please pass two numbers'
#    exit 1
#fi

#min=$1
#max=$2
DB2GRP=db2users
DB2GRPID=5000
#HADOOPGRP=hadoop
#HDFSGRP=hdfs

echo 'Creating db2users group ...'
groupadd -g $DB2GRPID $DB2GRP
pause
echo ''

awk -v RS='\r?\n' ' BEGIN { FS = OFS = "," } 
    { 
	  system("usermod -g hadoop "$1);
	  system("usermod -G db2users "$1);
      print "Student "$1" has been modified.";
    }
' users.csv

#echo 'Set ' $DB2GRP ' as the default group for all students ...'
#for (( n=$min; n<=$max; n++ ))
#do
#    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
#    usermod -G $DB2GRP $current_student
#    usermod -g $HADOOPGRP $current_student
#    echo 'Student ' $current_student ' has been modified.'
#    pause
#done
pause
echo ''

profile_filename=/etc/profile
echo 'Editing profile variables for all students ...'
command="\`id -Gn\`"
echo "if [[ $command == *$DB2GRP* ]]; then" >> $profile_filename
BIGSQL_HOME=/home/bigsql
echo "  PATH=$PATH:$BIGSQL_HOME/.local/bin:$BIGSQL_HOME/bin" >> $profile_filename
echo "  export PATH" >> $profile_filename
echo "  if [ -f /home/bigsql/sqllib/db2profile ]; then" >> $profile_filename
echo "      . /home/bigsql/sqllib/db2profile" >> $profile_filename
echo "  fi" >> $profile_filename
echo "fi" >> $profile_filename
pause
echo ''

echo 'Granting db2 priviledges to all students ...'
/bin/su -c "/home/bigsql/bigsql_grants.sh $DB2GRP" - bigsql
echo ''

#echo 'Creating folders for students in HDFS ...'
#/bin/su -c "/home/hdfs/bigsql_hdfs_folders.sh $min $max $HDFSGRP" - hdfs
#echo ''

