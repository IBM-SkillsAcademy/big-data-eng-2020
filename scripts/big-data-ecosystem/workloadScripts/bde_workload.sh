#!/bin/bash

#echo $1
min=$1
max=$2
resetoption=$3

#ip = $1
#ambari_user = $3
#ambari_pass = $4

function pause(){
    read -s -n 1 -p "Press any key to start executing exercises by all students simultaneously . . ."
    echo ""
}

if  (($1 >= $2) || [ -z "$1" ] || [ -z "$2" ]);
then echo "wrong parameters"; exit;
fi

echo "Preparing files for Ex 7 execution"

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/bash /workloadScripts/bde_ex7_prepare.sh $current_student
done

if [ "$resetoption" = "r" ]; then
echo "Reseting data for Ex 7 execution"

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/bash /workloadScripts/bde_reset.sh $current_student
done
fi

echo "Preparation done"

pause

echo "Start executing exercises"
/bin/bash /workloadScripts/bde_executeExs.sh $1 $2
echo "All exercises done"

