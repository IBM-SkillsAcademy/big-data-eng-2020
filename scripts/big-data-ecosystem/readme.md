---------------------------------------------------------------
Readme for preparing environment for BDE exercises
--------------------------------------------------------------

--------------------------------------------------------------
Using Ambari Web 
--------------------------------------------------------------

--------------------------------------------------------------
1- Change the password for Ambari Web
--------------------------------------------------------------
The default password for Ambari Web Admin is admin. It is required to change it to bigdata2020 as it will be used with the scripts (bdescripts/createHivePolicies.sh).

1-1: Open Ambari Web and login with the default password (admin/admin).
1-2: Select "admin" button in the top right of the screen -> Select "Manage Ambari"
1-3: Select "Users" at left side bar.
1-4: Select edit icon beside admin user (looks like a pen at left side)
1-5: Select change Password button
1-6: Type the old password (admin) and type bigdata2020 in the new password
1-7: Select OK button

--------------------------------------------------------------
2- Create Ambari user for exercises
--------------------------------------------------------------
2-1: Select "ADD USERS" button at the top right.
2-2: In "Add Users" dialog, type "ambari_user" in "Username" and type "SkillsAcademyBigData" in "Password" and "Confirm Password" fields.
2-3: Select "Save"


--------------------------------------------------------------
3- Enable Autherization for HBase
--------------------------------------------------------------
3-1: Select "Dashboard" at left side bar
3-2: Select "HBase" under Services at left side bar
3-3: Select "CONFIG" tab -> scrol down to "Security" section
3-4: Turn on "Enable Authorization"
3-5: Click "SAVE" button
3-6: In "Save Configuration" dialog, type: "Enable HBase Authorization", then clich "Save"
3-7: Ambari will prompt for some recommended changes, accept it.
3-8: Select "Restart" -> "Restart all required"
3-9: Confirm that all required services started successfully.

--------------------------------------------------------------
4- Enable Ranger Hive plugin
--------------------------------------------------------------
Follow the steps in https://www.thegeekdiary.com/how-to-configure-hive-authorization-using-apache-ranger/


__________________________________________________________________________

Steps to run the customization scripts for Big Data Ecosystem exercises
__________________________________________________________________________

1. copy the folder bdescripts from https://github.com/IBM-SkillsAcademy/big-data-eng-2020/tree/master/scripts/big-data-ecosystem/ to /root directory in the VM
2. login with root
3. cd /root/bdescripts
4. chmod 744 bde_envPrepare.sh
5. ./bde_envPrepare.sh



