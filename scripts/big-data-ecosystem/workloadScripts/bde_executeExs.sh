#!/bin/bash


# if  (($1>=$2) || [ -z "$1" ] || [ -z "$2" ]);
# then echo "wrong parameters"; exit;
# fi


for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	echo $current_student
    /bin/su -c "/workloadScripts/bde_ex3.sh $current_student" - $current_student &
done
wait
echo 'Execution for Exercise 3 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	echo $current_student
    /bin/su -c "/workloadScripts/bde_ex4.sh $current_student" - $current_student &
done
wait
echo 'Execution for Exercise 4 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	echo $current_student
    /bin/su -c "/workloadScripts/bde_ex5.sh $current_student" - $current_student &
done
wait
echo 'Execution for Exercise 5 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	echo $current_student
    /bin/su -c "/workloadScripts/bde_ex6.sh $current_student" - $current_student &
done
wait
echo 'Execution for Exercise 6 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
	echo $current_student
    /bin/bash /workloadScripts/bde_ex7.sh $current_student "email$n" &
done
wait
echo 'Execution for Exercise 7 ends for all students'

