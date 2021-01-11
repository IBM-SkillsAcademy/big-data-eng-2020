---------------------------------------------------------------------------
### Steps to customize the VM for the Big SQL labs 
---------------------------------------------------------------------------    
Do the following as <b>root</b> user: 
 1. Download the bigsql_customizations.sh script into /root in the VM:  
    `cd /root`   
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_customizations.sh`  
    
 2. Change permissions of the file to **744** eg.: 
    `chmod 744 bigsql_customizations.sh`    
 
 3. Download the following scripts into /home/bigsql in the VM:  
    `cd /home/bigsql`   
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_grants.sh`  
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_grantDBADM.sh`  
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_revokeDBADM.sh`  
    
 4. Change ownership and permissions of the files to **bigsql** user eg.:  
    `chown bigsql *.sh`  
    `chmod 744 *.sh`    
    
 5. Copy **users.csv** file from /root/bdescripts to /root by running the command below:  
    `cp /root/bdescripts/users.csv /root/users.csv`  
    
 6. Start the customization; run the first script:  
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
