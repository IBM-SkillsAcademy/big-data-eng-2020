---------------------------------------------------------------
Readme for preparing environment for BDE exercises
--------------------------------------------------------------

______________________________________________________________
Configuration using Ambari Web 
______________________________________________________________


--------------------------------------------------------------
1- Create Ambari user for exercises
--------------------------------------------------------------
1. Start Ambari Web (http://hostname:8080) and login with Ambari admin user ({Ambari_Admin}/{Ambari_Admin_password})
2. Select "admin" menu at top right -> "Manage Ambari"
3. Select "Users" at left side bar.
4. Select "ADD USERS" button at the top right.
5. In "Add Users" dialog, type {ambari_user} in "Username" and type {ambari_password} in "Password" and "Confirm Password" fields.
6. Select "Cluster User" in "User Access" field.
7. Make sure that "Is this user an Ambari Admin?" field is set to "No".
8. Make sure that "User Status" is set to "Active"
9. Select "Save".


--------------------------------------------------------------
2- Enable Autherization for HBase
--------------------------------------------------------------
1. Start Ambari Web (http://hostname:8080) and login with with Ambari admin user ({Ambari_Admin}/{Ambari_Admin_password})
2. Select "Dashboard" at left side bar
3. Select "HBase" under Services at left side bar
4. Select "CONFIG" tab -> scrol down to "Security" section
5. Turn on "Enable Authorization"
6. Click "SAVE" button
7. In "Save Configuration" dialog, type: "Enable HBase Authorization", then clich "Save"
8. Ambari will prompt for some recommended changes, accept it.
9. Click "PROCEED ANYWAY" then "OK"
10. Select "Restart" -> "Restart all affected" then "OK"
11. Confirm that all required services started successfully.

--------------------------------------------------------------
3- Enable Ranger Hive plugin
--------------------------------------------------------------
1. Start Ambari Web (http://hostname:8080) and login with with Ambari admin user ({Ambari_Admin}/{Ambari_Admin_password})
2. Select "Dashboard" at left side bar
3. Select "Ranger" under Services at left side bar
4. Select "CONFIG" tab -> "Ranger Plugin" tab
5. Turn on "Hive Ranger Plugin"
6. Click "SAVE" button
7. In "Save Configuration" dialog, type: "Enable Hive Ranger Plugin", then clich "Save"
8. Ambari will prompt for some recommended changes, accept it.
9. Click "PROCEED ANYWAY" then "OK"
10. Select "Restart" -> "Restart all affected" then "OK"
11. Confirm that all required services started successfully.
12. Select "Summary" tab -> "Ranger Admin UI" under "Quick Links" section at left
13. Confirm that the link for pre-configured policies is shown under "Hive" section

-------------------------------------------------------------------------

Steps to run the customization scripts for Big Data Ecosystem exercises
--------------------------------------------------------------------------
1. Open PuTTy shell and login with root
2. Run the command below to download the compressed folder bdescripts from https://github.com/IBM-SkillsAcademy/big-data-eng-2020/tree/master/scripts/big-data-ecosystem/ to /root directory in the VM
<br> wget https://github.com/IBM-SkillsAcademy/big-data-eng-2020/raw/master/scripts/big-data-ecosystem/bdescripts.tar.gz
3. Extract the compressed bdescript folder by using the command below:
   <br> 
   tar zxvf bdescripts.tar.gz
4. Copy users.csv file, which consists of two columns (The 1st column contains the account name and the 2nd one contains the email) to /root/bdescripts
<br>You can see a sample file at https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/scripts/big-data-ecosystem/bdescripts/users.csv
<br> scp users.csv root@{ip_address}:/root/bdescripts/users.csv
5. cd /root/bdescripts
6. chmod 744 bde_envPrepare.sh
7. ./bde_envPrepare.sh "{Ambari_Admin_password}" 
<br> where {Ambari_Admin_password} is the password of Ambari admin user

---------------------------------------------------------------------------
Steps to run the customization scripts for Bigsql exercises
---------------------------------------------------------------------------
Follow the instructions in README in https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/big-sql/

