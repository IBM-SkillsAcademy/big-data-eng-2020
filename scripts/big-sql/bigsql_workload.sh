#!/bin/bash
export SCRIPTS_PATH=/workloadScripts
export GIT_REPO_DIR=/root/bigsql/scriptsbigsql/big-data-eng-2020

cd $GIT_REPO_DIR
git pull
#
/bin/cp $GIT_REPO_DIR/scripts/big-sql/*.sh $SCRIPTS_PATH/
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sh $SCRIPTS_PATH/
/bin/cp $GIT_REPO_DIR/scripts/big-sql/bigsqlWorkload/*.sql $SCRIPTS_PATH/
chmod a+x $SCRIPTS_PATH/*.sh
export JSQSH_CONF=$GIT_REPO_DIR/scripts/big-sql/conf/.jsqsh
#export JSQSH_bin=/usr/ibmpacks/common-utils/current/jsqsh/bin/jsqsh
#
#echo $1
min=$1
max=$2
resetoption=$4

function pause(){
    read -s -n 1 -p "Press any key to start executing exercises by all students simultaneously . . ."
    echo ""
}

if ((1 >= $2) || [ -z "$1" ] || [ -z "$2" ]); then
    echo "wrong parameters"
    exit
fi

echo "Copying config dir"
for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd=email`echo $n`
    echo $current_student
    echo $current_student_bigsql_passwd
    /bin/cp -r $JSQSH_CONF  /home/$current_student
	chown -R $current_student /home/$current_student/.jsqsh
	chgrp -R hadoop /home/$current_student/.jsqsh 
done
wait


for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd=email`echo $n`
    echo $current_student
    echo $current_student_bigsql_passwd
    /bin/bash $SCRIPTS_PATH/bsq_ex2.sh  $current_student $current_student_bigsql_passwd &
done
wait

echo "Executing Exercise 3 for BigSQL"

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd=email`echo $n`
    echo $current_student
    echo $current_student_bigsql_passwd
    /bin/bash $SCRIPTS_PATH/bsq_ex3.sh  $current_student $current_student_bigsql_passwd &
done
wait




echo "Executing Exercise 6 for BigSQL"

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd=email`echo $n`
    echo $current_student
    echo $current_student_bigsql_passwd
    /bin/bash $SCRIPTS_PATH/bsq_ex6.sh  $current_student $current_student_bigsql_passwd &
done
wait

if [ "$resetoption" = "r" ]; then
echo "Reseting data for Ex 7 execution"

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    #/bin/bash /workloadScripts/Adel/bde_reset.sh $current_student &
done
wait
fi

echo "Preparation done"

pause

echo "Start executing exercises"
#/workloadScripts/Adel/bde_executeExs.sh $1 $2 $3
echo "All exercises done"
