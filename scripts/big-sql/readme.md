# Readme for workload scripts for BSQ exercises
## Prerequisites
Provision a Db2 warehouse on Cloud instance from cloud.ibm.com. <br>Follow the instructions in the exercises word document.
## Steps to run the workload scripts for Big Data Ecosystem exercises
1. As root, install git using the command:<br>
`yum install git -y`
  
2. Change current folder to /root:<br>
`cd /root`

3. Clone the github repository:<br>
`git clone https://github.com/IBM-SkillsAcademy/big-data-eng-2020`

4. Copy the workload scripts to separate folder:<br>
`cp -R /root/big-data-eng-2020/scripts/big-sql/bigsqlWorkload /`

5. Change current folder to /bigsqlWorkload:<br>
`cd /bigsqlWorkload`

6. Edit the file env_variables.sh and add a value to each variable:<br>
`vi env_variables.sh`

 - Set `export SCRIPTS_PATH=/bigsqlWorkload`<br>
 - Set `export GIT_REPO_DIR=/root/big-data-eng-2020`<br>
 - Set the bigsql password at `export BIGSQL_PASSWD=`<br>

Then set values for the DB2 on Cloud instance:<br>
 - Set the hostname of the DB2 on Cloud at `export DB2_HOSTNAME=`<br>
 - Set the username of the DB2 on Cloud at `export DB2_USERNAME=`<br>
 - Set the password of the DB2 on Cloud at `export DB2_PASSWORD=`<br>
 - Set the Db2 port of the DB2 on Cloud at `export DB2_PORT=` usually it should be 50000<br>
 - Set the database name of the DB2 on Cloud at `export DB2_DB=` usually it should be BLUDB<br>

Save and close the file.<br>

7. Change permissions of all .sh files:<br>
`chmod 777 *.sh`

8. Start the workload test:<br>
`./bigsql_workload.sh <min> <max> <studentPasswordPrefix> r`

   where **\<min\>** and **\<max\>** indicate the range of students that run the exercises and **\<studentPasswordPrefix\>** the prefix for students password.
   <br> The last parameter is optional for reseting account data. Add r in case you want to rerun the workload script and you want to reset the data for the exercises.
   <br>E.g.: `./bigsql_workload.sh 0 69 email` 
   <br> (this will simulate executing the exercises for the accounts: student0000 to student0069 and use the passwords email0 to email69)
   <br>E.g.: `./bigsql_workload.sh 0 69 email r`
   <br> (Adding r parameter will reset the data for accounts before running the exercises)

If you will run the workload scripts for a large number of users, I'd recommend starting the workload using this command:<br>
`nohup ./bigsql_workload.sh <min> <max> <studentPasswordPrefix> r > nohup.out &`<br>
this will start the workload scripts in the backgroup and save the output to nohup.out file. You can disconnect your session without impacting the execution of the scripts.<br><br>




