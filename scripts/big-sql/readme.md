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

Example env_variables.sh file:<br>
  `export DB2_HOSTNAME=dashdb-txn-sbox-yp-dal09-12.services.dal.bluemix.net`<br>
  `export DB2_USERNAME=txc22951`<br>
  `export DB2_PASSWORD=tbnvsjl37-ljwd0f`<br>
  `export DB2_PORT=50000`<br>
  `export DB2_DB=BLUDB`<br>
  `export BIGSQL_PASSWD=bigdata2020`<br>
  `export SCRIPTS_PATH=/bigsqlWorkload`<br>
  `export GIT_REPO_DIR=/root/big-data-eng-2020`<br>

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


