---------------------------------------------------------------
Readme for preparing environment for exercises
--------------------------------------------------------------

--------------------------------------------------------------
1- Start Ambari Services
--------------------------------------------------------------
1.  Open PuTTy shell and login with **root**
2.  Check if port 53 is available; run the following command:  
    `lsof -i :53`
    If you notice any service other than yarn occupying port 53, note the PID of the process and terminate by the following command  
    `kill -9 <PID>`  
3.  Make sure the PostgreSQL database is started; run the following command:  
    `systemctl status postgresql.service`
    If you see the service status as <B>Active: active (running)</B> then proceed to the next step, else run the following command to start the service:  
    `systemctl start postgresql.service`
4.  Make sure the Ambari Server is started; run the following command:  
    `systemctl status ambari-server.service`
    If you see the service status as <B>Active: active (running)</B> then proceed to the next step, else run the following command to start the service:  
    `systemctl start ambari-server.service`
5.  Make sure the Ambari Server is started; run the following command:  
    `systemctl status ambari-agent.service`
    If you see the service status as <B>Active: active (running)</B> then proceed to the next step, else run the following command to start the service:  
    `systemctl start ambari-agent.service`

--------------------------------------------------------------
2- Create Ambari user for exercises
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
3- Start services for BigData Ecosystem Course
--------------------------------------------------------------
1. Start Ambari Web UI (http://hostname:8080) and login with with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password\>**)
2. Check if all services are started.  
   a. Click **\>** next to Services to expand  
   b. Notice the color of he dots (Green=Started and Red=Stopped)  
   c. If Stopped, please start them by clicking "..." next to services, and click "Start All"  
   d. Starting up of all services takes approximately 20 minutes.
   
By default, some of the services have the maintenance mode turned on. These services are not required for the BDE course. By clicking "Start All", Ambari will try to start all services except the ones with maintenance mode turned on. The sign <img src="Maintenance%20Mode.png" width="20" height="20" /> beside the service name indicate it has maintenance mode turned on.

Services that should be stopped and put in maintenance mode for BigData Ecosystem Course:
* Accumulo
* SmartSense
* IBM Db2 Big SQL
* Druid
* Big SQL Console

-------------------------------------------------------------------------
4- Steps to run the customization scripts for Big Data Ecosystem exercises
--------------------------------------------------------------------------
1. Open PuTTy shell and login with **root**

2. Run the following command to download a set of scripts from IBM Skills Academy to /root directory in the VM  
    `wget https://github.com/IBM-SkillsAcademy/big-data-eng-2020/raw/master/scripts/big-data-ecosystem/bdescripts.tar.gz`  

3. Extract the compressed bdescript folder and change permissions by using the following command:  
    `tar zxvf bdescripts.tar.gz`  
    `cd /root/bdescripts`  
    `chmod 744 bde_envPrepare.sh`  

4. As a pre-requisite, you should have prepared a list of students in a csv file (users.csv).
   -  A sample file is available at <br> https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/scripts/big-data-ecosystem/bdescripts/users.csv
   -  Transfer the users.csv file to the VM  
    `scp users.csv root@<ip_address>:/root/bdescripts/users.csv`  

5. Execute the script   
    `./bde_envPrepare.sh "<Ambari_Admin_password>"`  
   where **\<Ambari_Admin_password\>** is the password of Ambari admin user
   <br>(the script is interactive and will ask you to press keys to proceed, so you need to keep an eye on it)

---------------------------------------------------------------------------
5- Steps to run the customization scripts for BigSQL exercises
---------------------------------------------------------------------------
<br> Follow the instructions in README in https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/big-sql/
