#!/bin/bash

numMem=$(dmidecode -t memory | egrep  -i '^(\s|\t)+Size' | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}')
if [ $numMem -lt 124048 ]; then
   read -p "Warning: The Memory size is less than 124 GB. Some services might fail to start. Are you sure you want to continue the setup script? " -n 1 -r
   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit
   fi
fi
echo "Memory size is $numMem";
noOfCpus=$(dmidecode -t processor | grep 'Socket Designation: CPU ' | wc -l)
if [ $noOfCpus -lt 12 ]; then
   read -p "Warning: The number of CPUs is less than 12. Some services might fail to start. Are you sure you want to continue the setup script? " -n 1 -r
   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit
   fi
fi
echo "The number of CPUs is $noOfCpus"

## validate ambari password
echo "curl --silent -u admin:$1 -X GET http://localhost:8080/api/v1/clusters/BDE_Cluster/services/HIVE?fields=ServiceInfo | grep '\"state\" : \"STARTED\"'"
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