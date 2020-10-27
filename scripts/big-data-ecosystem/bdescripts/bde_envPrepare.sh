#!/bin/bash

numMem=$(dmidecode -t memory | grep  Size: | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}')
if [ $numMem -lt 124000 ]; then
echo "Error: Memory size is less than 124 GB"; exit;
fi
echo "Memory size is $numMem";
noOfCpus=$(dmidecode -t processor | grep 'Socket Designation: CPU #' | wc -l)
if [ $noOfCpus -lt 12 ]; then
   echo "Error: The number of CPUs is less than 12"
   exit
fi
echo "The number of CPUs is $noOfCpus"

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