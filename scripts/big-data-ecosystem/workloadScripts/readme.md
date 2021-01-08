---------------------------------------------------------------
Readme for workload scripts for BDE exercises
--------------------------------------------------------------


-------------------------------------------------------------------------

Steps to run the workload scripts for Big Data Ecosystem exercises
--------------------------------------------------------------------------
1. Open PuTTy shell and login with **root**<br>
    `cd /`

3. Run the following command to download a set of scripts from IBM Skills Academy to / directory in the VM<br>
    `wget https://raw.githubusercontent.com/IBM-SkillsAcademy/big-data-eng-2020/master/scripts/big-data-ecosystem/workloadScripts.tar.gz`  

4. Extract the compressed bdescript folder and change permissions by using the following command:<br>
    `tar zxvf workloadScripts.tar.gz`  <br>
    `cd /workloadScripts`  <br>
    `chmod 777 *.sh`  

5. Execute the script   <br>
    `./bde_workload.sh **\<min\>** **\<max\>** **\<studentPasswordPrefix\>** r"`  <br>
   where **\<min\>** and **\<max\>** indicate the range of students that run the exercises and **\<studentPasswordPrefix\>** the prefix for students password.
   <br> The last parameter is optional for reseting account data. Add r in case you want to rerun the workload script and you want to reset the data for the exercises.
   <br>E.g.: `./bde_workload.sh 5 9 pswd` 
   <br> (this will simulate executing the exercises for the accounts: student0005 to student0009 and use the passwords pswd5 to pswd9)
   <br>E.g.: `./bde_workload.sh 5 9 pswd r`
   <br> (Adding r parameter will reset the data for accounts before running the exercises)

If you will run the workload scripts for a large number of users, I'd recommend starting the workload using this command:<br>
`nohup ./bde_workload.sh <min> <max> <studentPasswordPrefix> > nohup.out &`<br>
this will start the workload scripts in the backgroup and save the output to nohup.out file. You can disconnect your session without impacting the execution of the scripts.
