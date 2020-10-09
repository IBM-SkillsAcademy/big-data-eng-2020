#!/bin/bash

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
source createHivePolicies.sh
pause

echo 'Preparing labfiles folder ...'
source prepareLabfilesFolder.sh
pause

echo 'Congratulations! .. Environment is prepared for Big Data Ecosystem exercises'