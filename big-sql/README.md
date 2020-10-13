To customize the VM for the Big SQL labs:
 1. Download the following scripts into the VM:
    bigsql_customizations.sh (place the file in /root)
<br>    eg.: wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/big-sql/bigsql_customizations.sh

    bigsql_grants.sh, bigsql_grantDBADM.sh, bigsql_revokeDBADM.sh (place the files in /home/bigsql)
    Change ownership of the files to bigsql user
    eg.: chown bigsql *.sh 

 2. Copy users.csv file from /root/bdescripts to /root by running the command below:
<br>   ** cp /root/bdescripts/user.csv /root/user.csv **
 2. Make sure of the following:
    bigsql_customizations.sh is owned by root user.
    bigsql_grants.sh, bigsql_grantDBADM.sh, bigsql_revokeDBADM.sh are owned by bigsql user.
    bigsql_hdfs_folders.sh is owned by hdfs.
 3. Make sure the file permissions are 744 for the three scripts.
 4. As root, run the first script only:
    cd /root
    ./bigsql_customizations.sh
	

The first script will invoke the other scripts.
The bigsql_grants.sh file will download the lab files from github and extract it in the proper location. So you don't need to manually download the labs.
    
Before running Bigsql Ex. 6 run bigsql_grantDBADM.sh as below:
1. login with root account
2. cd /home/bigsql
3. su bigsql
4. ./bigsql_grantDBADM.sh

After running Bigsql Ex. 6 run bigsql_revokeDBADM.sh as below:
1. login with root account
2. cd /home/bigsql
3. su bigsql
4. ./bigsql_revokeDBADM.sh
