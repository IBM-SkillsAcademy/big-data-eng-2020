#!/bin/bash

DB2GRP=$1

function pause(){
 read -s -n 1 -p 'Press any key to continue . . .'
 echo ''
}

echo 'Granting db2 priviledges to all students ...'
db2 connect to bigsql
db2 grant CONNECT, CREATETAB, IMPLICIT_SCHEMA, LOAD ON DATABASE TO GROUP $DB2GRP
db2 grant DBADM on database to group $DB2GRP
db2 revoke DBADM on database from group $DB2GRP
db2 connect reset
pause
echo ''

echo 'Fix permissions of samples folder ...'
cd /usr/ibmpacks/bigsql/6.0.0.0/bigsql/
chmod -R o+r samples/
chmod -R o+x samples/
pause
echo ''

echo 'Downloading Big SQL Lab Files ...'
mkdir -p /home/bigsql/labfiles/
cd /home/bigsql/labfiles/
rm -Rf *
wget https://github.com/IBM-SkillsAcademy/big-data-eng-2020/raw/master/big-sql/bigsql.tar.gz
pause
echo ''

echo 'Extracting Big SQL Lab Files ...'
tar zxvf bigsql.tar.gz
chmod -R u+w bigsql
cd ..
chown -R bigsql:hadoop labfiles
chmod -R o+x labfiles
chmod -R o+r labfiles
pause
echo ''

exit

