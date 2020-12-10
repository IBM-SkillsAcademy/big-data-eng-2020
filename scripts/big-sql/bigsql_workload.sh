#!/bin/bash

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

echo "Preparing files for Ex 7 execution"

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    current_student_bigsql_passwd=email`echo $n`
    echo $current_student
    echo $current_student_bigsql_passwd
    #/bin/bash /workloadScripts/bde_ex7_prepare.sh $current_student &
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
