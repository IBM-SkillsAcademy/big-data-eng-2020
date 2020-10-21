To customize the VM for the Big SQL labs:  
 1. Download the following scripts into the VM:  
    `bigsql_customizations.sh` (place the file in /root) eg.:  
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_customizations.sh`  

    `bigsql_grants.sh, bigsql_grantDBADM.sh, bigsql_revokeDBADM.sh` (place the files in /home/bigsql)  
  
    Change ownership of the files to **bigsql** user eg.:  
    `chown bigsql *.sh`  

 2. Copy **users.csv** file from /root/bdescripts to /root by running the command below:  
    `cp /root/bdescripts/users.csv /root/users.csv`  
 3. Make sure of the following:  
    `bigsql_grants.sh, bigsql_grantDBADM.sh, bigsql_revokeDBADM.sh` are owned by **bigsql** user.  
    
 4. Make sure the file permissions are **744** for all the above-mentioned scripts. eg.:  
     `chmod 744 *.sh`    
 5. As **root**, run the first script only:  
    `cd /root`  
    `./bigsql_customizations.sh`  

The first script will invoke the other scripts.  
The `bigsql_grants.sh` file will download the lab files from github and extract it in the proper location.  
So you don't need to manually download the labs.

---------------------------------------------------------------------------
### Steps to run before Big SQL Exercise-6.
---------------------------------------------------------------------------    
Before running **Big SQL Ex. 6** run `bigsql_grantDBADM.sh` as below:  
Login with **root** account  
    `cd /home/bigsql`  
    `su bigsql`  
    `./bigsql_grantDBADM.sh`  

After running **Big SQL Ex. 6** run `bigsql_revokeDBADM.sh` as below:  
Login with **root** account  
    `cd /home/bigsql`  
    `su bigsql`  
    `./bigsql_revokeDBADM.sh`  
