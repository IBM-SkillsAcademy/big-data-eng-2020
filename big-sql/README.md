## Steps to customize the VM for the Big SQL labs 

 1. Start Ambari Web UI (http://hostname:8080) and login with with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password\>**)
 
 2. Check the **IBM Db2 BigSQL** service and make sure it is started.
 
 3. Open PuTTy shell and login with root
 
 4. Download the bigsql_customizations.sh script into /root in the VM:  
    `cd /root`   
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_customizations.sh`  
    
 5. Change permissions of the file to **744** eg.: 
    `chmod 744 bigsql_customizations.sh`    
 
 6. Download the following scripts into /home/bigsql in the VM:  
    `cd /home/bigsql`   
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_grants.sh`  
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_grantDBADM.sh`  
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_revokeDBADM.sh`  
    
 7. Change ownership and permissions of the files to **bigsql** user eg.:  
    `chown bigsql *.sh`  
    `chmod 744 *.sh`    
    
 8. Copy **users.csv** file from /root/bdescripts to /root by running the command below:  
    `cp /root/bdescripts/users.csv /root/users.csv`  
    
 9. Start the customization; run the first script:  
    `cd /root`  
    `./bigsql_customizations.sh`
    <br>(the script is interactive and will ask you to press keys to proceed, so you need to keep an eye on it)

The first script will invoke the other scripts.  
The `bigsql_grants.sh` file will download the lab files from github and extract it in the proper location.  
So you don't need to manually download the labs.

 10. Stop <B>IBM Db2 Big SQL</B> service (after we complete the customization of the BigSQL, the service should be stopped to release the resources for the BDE course):  
   a. Click **\>** next to Services to expand  
   b. Click on <B>IBM Db2 Big SQL</B> service  
   d. In the <B>IBM Db2 Big SQL Summary</B> page, Click on the <B>ACTIONS</B> button and click <B>Stop</B>  
   c. In the confirmation dialog, check the <B>Turn On Maintenance Mode for IBM Db2 Big SQL</B>  
   d. Click <B>CONFIRM STOP</B>  
   
## <div class="text-red mb-2">At this step, the VM is customized for both BigData Ecosystem and BigSQL Courses but the VM is only ready to run the BigData Ecosystem exercises.</div>

Services that should be stopped and put in maintenance mode for BigData Ecosystem Course:    
* Accumulo   
* SmartSense   
* IBM Db2 Big SQL   
* Druid   
* Big SQL Console

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

## You need to follow the following steps only before the start of the BigSQL Course.
## Start services for BigSQL Course

The following steps assumes you have followed the steps to start the cluster for BigData Ecosystem Course (see above).
1. Start Ambari Web UI (http://hostname:8080) and login with with Ambari admin user (**\<Ambari_Admin\>**/**\<Ambari_Admin_password\>**)
2. Stop <B>Spark2</B> service:  
   a. Click **\>** next to Services to expand  
   b. Click on <B>Spark2</B> service  
   d. In the <B>Spartk2 Summary</B> page, Click on the <B>ACTIONS</B> button and click <B>Stop</B>  
   c. In the confirmation dialog, check the <B>Turn On Maintenance Mode for Spark2</B>  
   d. Click <B>CONFIRM STOP</B>  
3. Start <B>IBM Db2 Big SQL</B> service:  
   a. Click **\>** next to Services to expand  
   b. Click on <B>IBM Db2 Big SQL</B> service  
   d. In the <B>IBM Db2 Big SQL Summary</B> page, Click on the <B>ACTIONS</B> button and click <B>Start</B>  
   c. In the confirmation dialog, check the <B>Turn Off Maintenance Mode for IBM Db2 Big SQL</B>  
   d. Click <B>CONFIRM START</B>  
4. Start <B>Big SQL Console</B> service:  
   a. Click **\>** next to Services to expand  
   b. Click on <B>Big SQL Console</B> service  
   d. In the <B>Big SQL Console Summary</B> page, Click on the <B>ACTIONS</B> button and click <B>Start</B>  
   c. In the confirmation dialog, check the <B>Turn Off Maintenance Mode for Big SQL Console</B>  
   d. Click <B>CONFIRM START</B>  

Services that should be stopped and put in maintenance mode for BigSQL Course:
* Accumulo
* SmartSense
* Spark2
* Druid

## <div class="text-red mb-2">At this step, the VM is only ready to run the BigData Ecosystem exercises.</div>

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

### Some BigSQL authority will need to be applied to all student accounts just before the start of Exercise-6 to allow them complete the exercise. Follow the following steps to apply the authority.
## Steps to run before Big SQL Exercise-6.

Before running **Big SQL Ex. 6** run `bigsql_grantDBADM.sh` as below:  
Login with **root** account  
    `cd /home/bigsql`  
    `su bigsql`  
    `./bigsql_grantDBADM.sh`  

After all students run **Big SQL Ex. 6**, run `bigsql_revokeDBADM.sh` as below to revoke the authority:  
Login with **root** account  
    `cd /home/bigsql`  
    `su bigsql`  
    `./bigsql_revokeDBADM.sh`  

