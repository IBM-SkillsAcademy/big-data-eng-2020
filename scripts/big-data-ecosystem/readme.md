---------------------------------------------------------------
Readme for preparing environment for BDE exercises
--------------------------------------------------------------

______________________________________________________________
Configuration using Ambari Web 
______________________________________________________________


--------------------------------------------------------------
1- Create Ambari user for exercises
--------------------------------------------------------------
1. Select "ADD USERS" button at the top right.
2. In "Add Users" dialog, type "ambari_user" in "Username" and type "SkillsAcademyBigData" in "Password" and "Confirm Password" fields.
3. Select "Cluster User" in "User Access" field.
4. Select "Save".


--------------------------------------------------------------
2- Enable Autherization for HBase
--------------------------------------------------------------
1. Select "Dashboard" at left side bar
2. Select "HBase" under Services at left side bar
3. Select "CONFIG" tab -> scrol down to "Security" section
4. Turn on "Enable Authorization"
5. Click "SAVE" button
6. In "Save Configuration" dialog, type: "Enable HBase Authorization", then clich "Save"
7. Ambari will prompt for some recommended changes, accept it.
8. Select "Restart" -> "Restart all required"
9. Confirm that all required services started successfully.

--------------------------------------------------------------
3- Enable Ranger Hive plugin
--------------------------------------------------------------
Follow the steps in https://www.thegeekdiary.com/how-to-configure-hive-authorization-using-apache-ranger/


-------------------------------------------------------------------------

Steps to run the customization scripts for Big Data Ecosystem exercises
--------------------------------------------------------------------------
1. copy the folder bdescripts from https://github.com/IBM-SkillsAcademy/big-data-eng-2020/tree/master/scripts/big-data-ecosystem/ to /root directory in the VM
2. login with root
3. cd /root/bdescripts
4. chmod 744 bde_envPrepare.sh
5. ./bde_envPrepare.sh



