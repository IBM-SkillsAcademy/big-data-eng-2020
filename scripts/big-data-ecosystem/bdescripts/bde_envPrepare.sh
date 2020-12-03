#!/bin/bash

numMem=$(dmidecode -t memory | grep  Size: | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}')
if [ $numMem -lt 145000 ]; then
   read -p "Warning: The Memory size is less than 124 GB. Some services might fail to start. Are you sure you want to continue the setup script? " -n 1 -r
   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit
   fi
fi
echo "Memory size is $numMem";
noOfCpus=$(dmidecode -t processor | grep 'Socket Designation: CPU #' | wc -l)
if [ $noOfCpus -lt 12 ]; then
   read -p "Warning: The number of CPUs is less than 12. Some services might fail to start. Are you sure you want to continue the setup script? " -n 1 -r
   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit
   fi
fi
echo "The number of CPUs is $noOfCpus"
## validate ambari password
AMBARI_HOST=localhost
AMBARI_PORT=8080
NETRC_FILE=/root/.netrc
AMBARI_URLBASE=$AMBARI_HOST/$AMBARI_PORT
AMBARI_CLUSTER_NAME=BDE_Cluster
CLUSTER_LINE=`curl --netrc-file .netrc  -i -H 'X-Requested-By:ambari' $AMBARI_URLBASE | grep cluster_name | grep BDE_Cluster`
if [ -z $CLUSTER_LINE ]; then
   echo "wrong ambari password"
   exit

function pause(){
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}


echo 'Creating student accounts ...'
source createStudentAccounts.sh
pause

echo 'Adding java path to environment variables ...'
#cp -n myenvvars.sh /etc/profile.d/
source addJavaToEnvVars.sh
pause

echo 'Creating HBase namspaces and granting permissions ...'
source genHbasescript.sh
pause

echo 'Creating Hive databases ...'
source genCreateHiveDbCmds.sh
su hive -c 'hive -f createHiveDBs.sql'
source createHivePolicies.sh $1
pause

echo 'Preparing labfiles folder ...'
source prepareLabfilesFolder.sh

echo 'Congratulations! .. Environment is prepared for Big Data Ecosystem exercises'