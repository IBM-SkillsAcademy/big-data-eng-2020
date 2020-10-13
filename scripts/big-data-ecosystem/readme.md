---------------------------------------------------------------
Readme for preparing environment for BDE exercises
--------------------------------------------------------------

______________________________________________________________
Configuration using Ambari Web UI
______________________________________________________________


--------------------------------------------------------------
1- Create Ambari user for exercises
--------------------------------------------------------------
1. Start Ambari Web UI (http://hostname:8080) and login with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password\>**)
2. Select "admin" menu at top right -> "Manage Ambari"
3. Select "Users" at left side bar.
4. Select "ADD USERS" button at the top right.
5. In "Add Users" dialog, type **\<ambari_user\>** in "Username" and type **\<ambari_password\>** in "Password" and "Confirm Password" fields.
6. Select "Cluster User" in "User Access" field.
7. Make sure that "Is this user an Ambari Admin?" field is set to "No".
8. Make sure that "User Status" is set to "Active"
9. Select "Save".


--------------------------------------------------------------
2- Enable Autherization for HBase
--------------------------------------------------------------
1.  Open PuTTy shell and login with **root**
2.  Check if port 53 is available; run the following command:  
    `lsof -i :53`  
      If you notice any service other than yarn occupying port 53, note the PID of the process and terminate by the following command  
    `kill -9 \<PID\>`  
3. Start Ambari Web UI (http://hostname:8080) and login with with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password\>**)
4. Check if all services are started.  
   a. Click **\>** next to Services to expand  
   b. Notice the color of he dots (Green=Started and Red=Stopped)  
   c. If Stopped, please start them by clicking "..." next to services, and click "Start All"  
   d. Starting up of all services takes approximately 10 minutes.   

5. Select "Dashboard" at left side bar
6. Select "HBase" under Services at left side bar
7. Select "CONFIG" tab -> scrol down to "Security" section
8. Turn on "Enable Authorization"
9. Click "SAVE" button
10. In "Save Configuration" dialog, type: "Enable HBase Authorization", then click "Save"
11. Ambari will prompt for some recommended changes, accept it.
12. Click "PROCEED ANYWAY" then "OK"
13. Select "Restart" -> "Restart all affected" then click "OK"
14. Confirm that all required services started successfully.

--------------------------------------------------------------
3- Enable Ranger Hive plugin
--------------------------------------------------------------
1. Start Ambari Web UI (http://hostname:8080) and login with with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password/>**)
2. Select "Dashboard" at left side bar
3. Select "Ranger" under Services at left side bar
4. Select "CONFIG" tab -> "Ranger Plugin" tab
5. Turn on "Hive Ranger Plugin"
6. Click "SAVE" button
7. In "Save Configuration" dialog, type: "Enable Hive Ranger Plugin", then click "Save"
8. Ambari will prompt for some recommended changes, accept it.
19. Click "PROCEED ANYWAY" then "OK"
10. Select "Restart" -> "Restart all affected" then "OK"
11. Confirm that all required services started successfully.
12. Select "Summary" tab, look for "Quick Links" section and click "Ranger Admin UI".
13. Confirm that a link appears under "Hive" section. This is for pre-configured policies. 

-------------------------------------------------------------------------

Steps to run the customization scripts for Big Data Ecosystem exercises
--------------------------------------------------------------------------
1. As a pre-requisite, you should have prepared a list of students in a csv file (users.csv).
   -  A sample file is available at <br> https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/scripts/big-data-ecosystem/bdescripts/users.csv
   -  Transfer the users.csv file to the VM  
    `scp users.csv root@<ip_address>:/root/bdescripts/users.csv`  

2. Open PuTTy shell and login with **root**

3. Run the following command to download a set of scripts from IBM Skills Academy to /root directory in the VM  
    `wget https://github.com/IBM-SkillsAcademy/big-data-eng-2020/raw/master/scripts/big-data-ecosystem/bdescripts.tar.gz`  

4. Extract the compressed bdescript folder and change permissions by using the following command:  
    `tar zxvf bdescripts.tar.gz`  
    `cd /root/bdescripts`  
    `chmod 744 bde_envPrepare.sh`  

5. Execute the script   
    `./bde_envPrepare.sh "<Ambari_Admin_password>"`  
   where **\<Ambari_Admin_password\>** is the password of Ambari admin user

---------------------------------------------------------------------------
Steps to run the customization scripts for Bigsql exercises
---------------------------------------------------------------------------
<br> Follow the instructions in README in https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/big-sql/
