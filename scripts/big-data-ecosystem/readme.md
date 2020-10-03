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
4. Make sure that "Is this user an Ambari Admin?" field is set to "No".
5. Make sure that "User Status" is set to "Active"
6. Select "Save".


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
8. Click "PROCEED ANYWAY" then "OK"
9. Select "Restart" -> "Restart all affected" then "OK"
10. Confirm that all required services started successfully.

--------------------------------------------------------------
3- Enable Ranger Hive plugin
--------------------------------------------------------------
Follow the steps in https://www.thegeekdiary.com/how-to-configure-hive-authorization-using-apache-ranger/
1. Select "Dashboard" at left side bar
2. Select "Ranger" under Services at left side bar
3. Select "CONFIG" tab -> "Ranger Plugin" tab
4. Turn on "Hive Ranger Plugin"
5. Click "SAVE" button
6. In "Save Configuration" dialog, type: "Enable Hive Ranger Plugin", then clich "Save"
7. Ambari will prompt for some recommended changes, accept it.
8. Click "PROCEED ANYWAY" then "OK"
9. Select "Restart" -> "Restart all affected" then "OK"
10. Confirm that all required services started successfully.
11. Select "Summary" tab -> "Ranger Admin UI" under "Quick Links" section at left
12. Confirm that the link for pre-configured policies is shown under "Hive" section

-------------------------------------------------------------------------

Steps to run the customization scripts for Big Data Ecosystem exercises
--------------------------------------------------------------------------
1. Open PuTTy shell and login with root
2. Copy the compressed folder bdescripts from https://github.com/IBM-SkillsAcademy/big-data-eng-2020/tree/master/scripts/big-data-ecosystem/ to /root directory in the VM
3. Extract the compressed bdescript folder by using the command below:
   \n 
   tar zxvf bdescripts.tar.gz
4. Copy users.csv file, which consists of two columns (The 1st column contains the account name and the 2nd one contains the email) to /root/bdescripts
\n You can see a sample file at https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/scripts/big-data-ecosystem/bdescripts/users.csv
\n scp users.csv root@41.58.181.236:/root/bdescripts/users.csv
5. cd /root/bdescripts
6. chmod 744 bde_envPrepare.sh
7. ./bde_envPrepare.sh



