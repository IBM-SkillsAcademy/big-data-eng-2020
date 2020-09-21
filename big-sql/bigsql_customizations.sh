#!/bin/bash


min=$1
max=$2
DB2GRP=db2users
HADOOPGRP=hadoop
HDFSGRP=hdfs

echo Creating db2users group ...
groupadd -g $DB2GRP

echo Set $DB2GRP as the default group for all students ...
for (( n=$min; n<=$max; n++ ))
do
	current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	usermod -G $DB2GRP $current_student
	usermod -g $HADOOPGRP $current_student
done

echo Editing profile variables for all students ...
echo "if [[ `id -Gn` == *$DB2GRP* ]]; then" >> /etc/.profile
echo "  BIGSQL_HOME=/home/bigsql" >> /etc/.profile
echo "  PATH=$PATH:$BIGSQL_HOME/.local/bin:$BIGSQL_HOME/bin" >> /etc/.profile
echo "  export PATH" >> /etc/.profile
echo "  if [ -f /home/bigsql/sqllib/db2profile ]; then" >> /etc/.profile
echo "      . /home/bigsql/sqllib/db2profile" >> /etc/.profile
echo "  fi" >> /etc/.profile
echo "fi" >> /etc/.profile

echo Granting db2 priviledges to all students ...
su - bigsql
db2 connect to bigsql
db2 grant CONNECT, CREATETAB, IMPLICIT_SCHEMA, LOAD ON DATABASE TO GROUP $DB2GRP
db2 grant DBADM on database to group $DB2GRP
db2 revoke DBADM on database from group $DB2GRP
db2 connect reset

echo Fix permissions of samples folder ...
cd /usr/ibmpacks/bigsql/6.0.0.0/bigsql/
chmod -R o+r samples/
chmod -R o+x samples/

echo Preparing labfiles ...
mkdir -p /home/bigsql/labfiles/
cd /home/bigsql/labfiles/
wget https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/big-sql/bigsql.tar.gz
tar zxvf bigsql.tar.gz
cd ..
chown -R bigsql:hadoop labfiles
chmod -R o+x labfiles
chmod -R o+r labfiles
exit

echo Creating folders for students in HDFS ...
su - hdfs
hdfs dfs -chmod 777 /user

for (( n=$min; n<=$max; n++ ))
do
	current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	hadoop fs -mkdir /user/$current_student/
	hadoop fs -chown $current_student:$HDFSGRP /user/$current_student
done

