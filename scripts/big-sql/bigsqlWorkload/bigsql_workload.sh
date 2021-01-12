#!/bin/bash
#SCRIPTS_PATH=/workloadScripts
#GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020

#cd $GIT_REPO_DIR #toberemoved
#git pull  #toberemoved
#
#/bin/cp $GIT_REPO_DIR/scripts/big-sql/*.sh $SCRIPTS_PATH/
#/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sh $SCRIPTS_PATH/
#/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sql $SCRIPTS_PATH/
#chmod a+x $SCRIPTS_PATH/*.sh

source  ./env_variables.sh

JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh

#echo $1
min=$1
max=$2
password=$3
resetoption=$4

function pause(){
    echo $1
    read -s -n 1
    echo ""
}

#if ((1 >= $max) || [ -z "$min" ] || [ -z "$max" ] || [ -z "$password" ]); then
#    echo "wrong parameters"
#    exit
#fi

# create folder for this run
foldername=$(date +%d-%m-%Y_%H%M%S)
mkdir -p $SCRIPTS_PATH/$foldername
echo "Created folder " $SCRIPTS_PATH/$foldername " for this test."

# create log files
touch $SCRIPTS_PATH/$foldername/bsq_ex2_time
touch $SCRIPTS_PATH/$foldername/bsq_ex3_time
touch $SCRIPTS_PATH/$foldername/bsq_ex6_time

###############
#Cleanup script
###############

if [ "$resetoption" = "r" ]; then
  echo  
  echo "-------------------------------------------------->> STARTING CLEANUP SCRIPTS <<--------------------------------------------------"
  echo

  for (( n=$min; n<=$max; n++ ))
  do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/cp -r $JSQSH_CONF  /home/$current_student
    chown -R $current_student /home/$current_student/.jsqsh
    chgrp -R hadoop /home/$current_student/.jsqsh
  done

  for (( n=$min; n<=$max; n++ ))
  do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd="$password$n"
    /bin/bash $SCRIPTS_PATH/bsq_ex6_clear.sh $current_student $current_student_bigsql_passwd $foldername; /bin/bash $SCRIPTS_PATH/bsq_ex3_clear.sh $current_student $current_student_bigsql_passwd $foldername; /bin/bash $SCRIPTS_PATH/bsq_ex2_clear.sh $current_student $current_student_bigsql_passwd $foldername &
  done
  wait

  for (( n=$min; n<=$max; n++ ))
  do
    rm -Rf /home/$current_student/.jsqsh &
  done
  wait
fi

echo "Copying config dir"
for (( n=$min; n<=$max; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/cp -r $JSQSH_CONF  /home/$current_student
    chown -R $current_student /home/$current_student/.jsqsh
    chgrp -R hadoop /home/$current_student/.jsqsh
done

/bin/cp -r $JSQSH_CONF  /home/bigsql
chown -R bigsql /home/bigsql/.jsqsh
chgrp -R hadoop /home/bigsql/.jsqsh

wait
echo "Preparation done"
echo
echo
echo

pause "Press any key to start executing the exercises . . ."
echo
#################################
echo "Start executing exercises"
#################################

######################################
echo "Executing Exercise 2 for BigSQL"
######################################

echo
echo "-------------------------------------------------->> STARTING EXERCISE 2 <<--------------------------------------------------"
echo

for (( n=$min; n<=$max; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd="$password$n"
    /bin/bash $SCRIPTS_PATH/bsq_ex2.sh  $current_student $current_student_bigsql_passwd $foldername &
done
wait
echo
echo
echo

######################################
echo "Executing Exercise 3 for BigSQL"
######################################

echo
echo "-------------------------------------------------->> STARTING EXERCISE 3 <<--------------------------------------------------"
echo

for (( n=$min; n<=$max; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd="$password$n"
    /bin/bash $SCRIPTS_PATH/bsq_ex3.sh  $current_student $current_student_bigsql_passwd $foldername &
done
wait
echo
echo
echo

#echo "Granting access for students "
#su bigsql -c "/home/bigsql/bigsql_grantDBADM.sh"

######################################
echo "Executing Exercise 6 for BigSQL"
######################################

echo
echo "-------------------------------------------------->> STARTING EXERCISE 6 <<--------------------------------------------------"
echo

for (( n=$min; n<=$max; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd="$password$n"
    /bin/bash $SCRIPTS_PATH/bsq_ex6.sh  $current_student $current_student_bigsql_passwd $foldername &
done
wait
#echo "Revoking access for students "
#su bigsql -c "/home/bigsql/bigsql_revokeDBADM.sh"
echo
echo
echo
echo "All exercises done - Files saved at '" $SCRIPTS_PATH/$foldername "'"
echo

