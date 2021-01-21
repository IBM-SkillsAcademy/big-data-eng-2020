#!/bin/bash
export USERS_FILE=$2


if [ -r $USERS_FILE ];
then
   echo "$USERS_FILE is readable"
else
   echo "$USERS_FILE is not readable"
   exit 1
fi
numMem=$(dmidecode -t memory | egrep  -i '^(\s|\t)+Size' | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}')
if [ $numMem -lt 140000 ]; then
   read -p "Warning: The Memory size is less than 140 GB. Some services might fail to start. Are you sure you want to continue the setup script? " -n 1 -r
   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit
   fi
fi
echo "Memory size is $numMem";
noOfCpus=$(dmidecode -t processor | grep 'Socket Designation: CPU ' | wc -l)
if [ $noOfCpus -lt 30 ]; then
   read -p "Warning: The number of CPUs is less than 30. Some services might fail to start. Are you sure you want to continue the setup script? " -n 1 -r
   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit
   fi
fi
echo "The number of CPUs is $noOfCpus"

## validate ambari password
checkpswd=$(curl --silent -u admin:$1 -X GET http://localhost:8080/api/v1/clusters/BDE_Cluster/services/HIVE?fields=ServiceInfo | grep '\"state\" : \"STARTED\"')
echo $checkpswd
if [ -z "$checkpswd" ]; then
   echo "wrong ambari password or Hive service is not started"
   exit
fi

function pause(){
    read -s -n 1 -p "Press any key to continue . . ."
    echo ""
}


echo 'Creating student accounts ...'
source createStudentAccounts.sh $USERS_FILE
pause

echo 'Adding java path to environment variables ...'
#cp -n myenvvars.sh /etc/profile.d/
source addJavaToEnvVars.sh
pause

echo 'Creating HBase namspaces and granting permissions ...'
source genHbasescript.sh $USERS_FILE
pause

echo 'Creating Hive databases ...'
source genCreateHiveDbCmds.sh $USERS_FILE
su hive -c 'hive -f createHiveDBs.sql'
source createHivePolicies.sh $1 $USERS_FILE
pause

echo 'Preparing labfiles folder ...'
source prepareLabfilesFolder.sh 

echo 'Congratulations! .. Environment is prepared for Big Data Ecosystem exercises'