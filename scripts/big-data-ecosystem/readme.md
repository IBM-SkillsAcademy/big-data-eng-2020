
---------------------------------------------------------------
Readme for preparing environment for exercises
--------------------------------------------------------------

  Before you start- Create the users.csv file based on the course attendees data
---------------------------------------------------------------------------------

1. You will have a spreadsheet with the users information in it, you will need to create a document containing only the emails of the attendees and manually add a column before the column of the emails containing the system usernames of all attendees , which will be in the following format

`student0000, student0001, ... up to student9999`

2. Make sure that first column is the one with the system usernames and the second column is the one with the user emails

3. It is better to manually validate the emails are valid emails (at least the contain the '@' character with some text before it)

4. It is better save first couple of accounts for instructors (student0000 until may be student0004 or student0005) depending on the number of instructors and assistants in the course

5. Make sure the saved file doesnt contain headers, usernames and emails should start at column 1, the file should be saved in csv format with the specific name of users.csv
  
6. In order to communicate the account name mapping to the students, a copy of the original file without sensitive data like (email , phone numbers) should be shared with the students, this copy will be in spreadsheet format and will contain name, university or organization name (as in the original sheet) along with the generated system username so it can be shared with all attendees without revealing the current password

7. The setup script will generate a system account for each user with the password of the first part of the email address (after dropping the domain, for example a user with the email tomshelby@myuniversity.edu will have a password of tomshelby , the user with an email of walter.white@gmail.com will have a password of walter.white)

8. Information about the initial password should be clearly communicated to students, if some error happens, they can manually ask the course instructors to change their passwords through private chat channel used during the course (slack)

--------------------------------------------------------------
1- Start Ambari Services
--------------------------------------------------------------
1. Open PuTTy shell and login with **root**

2. Check if port 53 is available; run the following command:   
   `lsof -i :53`  
   If you notice any service other than yarn occupying port 53, note the PID of the process and terminate by the following command.    
   `kill -9 <PID>`   

3. Make sure the PostgreSQL database is started; run the following command:   
   `systemctl status postgresql.service`   
   If you see the service status as <B>Active: active (running)</B> then proceed to the next step, else run the following command to start the service:   
   `systemctl start postgresql.service`   

4. Make sure the Ambari Server is started; run the following command:   
   `systemctl status ambari-server.service`   
   If you see the service status as <B>Active: active (running)</B> then proceed to the next step, else run the following command to start the service:   
   `systemctl start ambari-server.service`   

5. Make sure the Ambari Server is started; run the following command:   
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
1. Start Ambari Web UI (http://hostname:8080) and login with with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password\>**).  
2. Turn off maintenance mode for BigSQL service:   
    a. Click **\>** next to **Services** section to expand it   
    b. Select the **IBM Db2 Big SQL** service to open the **Summary** page   
    c. In the **IBM Db2 Big SQL Summary** page, click the **ACTIONS** button and select **Turn Off Maintenance Mode**   

2. Update a parameter in YARN configurations:   
    a. Click **\>** next to **Services** section to expand it   
    b. Select the **YARN** service to open the **Summary** page   
    c. In the **YARN Summary**, click the **CONFIGS** tab   
    d. In the search field, type **yarn.nodemanager.linux-container-executor.resources-handler.class** and click **Enter**   
    e. Change the value of the parameter to **org.apache.hadoop.yarn.server.nodemanager.util.DefaultLCEResourcesHandler**   
    f. Click the **SAVE** button at the button right, type a comment in the popup dialog, and click **SAVE**   
    g. Then you will get another pop up, click **“PROCEED ANYWAY”**   
    g. In the **Services** section, click the **"..."** next to services, and click **"Start All"**   
    
    If starting the services fail to start IBM Db2 Big SQL service, click the **"..."** next to services, and click **"Restart All Required"**.   

3. Stop IBM Db2 Big SQL service and put it in maintenance mode:   
    a. Click **\>** next to **Services** section to expand it   
    b. Select the **IBM Db2 Big SQL** service to open the **Summary** page   
    c. Click the **ACTIONS** button and select **Stop**   
    d. In the popup confirmation dialog, check the **Turn On Maintenance Mode for IBM Db2 Big SQL** checkbox and click **CONFIRM STOP**

## By default, some of the services have the maintenance mode turned on. These services are not required for the BDE course. By clicking "Start All", Ambari will try to start all services except the ones with maintenance mode turned on. The sign <img  src="Maintenance%20Mode.png"  width="20"  height="20"  /> beside the service name indicate it has maintenance mode turned on.

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

4. As a pre-requisite, you should have prepared a list of students in a csv file (users.csv). (Steps to perform this step are at the start of the document)   
- A sample file is available at <br> https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/scripts/big-data-ecosystem/bdescripts/users.csv   
- Transfer the users.csv file to the VM   
`scp users.csv root@<ip_address>:/root/bdescripts/users.csv`   

5. Execute the script   
`./bde_envPrepare.sh "<Ambari_Admin_password>"`   

where **\<Ambari_Admin_password\>** is the password of Ambari admin user   
<br>(the script is interactive and will ask you to press keys to proceed, so you need to keep an eye on it)   

---------------------------------------------------------------------------
5- Steps to run the customization scripts for BigSQL exercises
---------------------------------------------------------------------------
Follow the instructions in README in https://github.com/IBM-SkillsAcademy/big-data-eng-2020/blob/master/big-sql/   

---------------------------------------------------------------------------


