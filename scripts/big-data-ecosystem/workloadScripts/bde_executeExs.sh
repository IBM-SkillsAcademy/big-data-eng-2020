#!/bin/bash

#start_all=$(date +%s.%N)

if  (( $1 >= $2 ) || [ -z "$1" ] || [ -z "$2" ]); then
    echo "wrong parameters"
    exit
fi

#clear log files
echo "" > /workloadScripts/ex3_time
echo "" > /workloadScripts/ex4p1_time
echo "" > /workloadScripts/ex4p3_time
echo "" > /workloadScripts/ex5_time
echo "" > /workloadScripts/ex6_time
echo "" > /workloadScripts/ex7p2_time
echo "" > /workloadScripts/ex7p3_time
echo "" > /workloadScripts/ex7p4_time

chmod 777 /workloadScripts/ex3_time
chmod 777 /workloadScripts/ex4p1_time
chmod 777 /workloadScripts/ex4p3_time
chmod 777 /workloadScripts/ex5_time
chmod 777 /workloadScripts/ex6_time
chmod 777 /workloadScripts/ex7p2_time
chmod 777 /workloadScripts/ex7p3_time
chmod 777 /workloadScripts/ex7p4_time

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/su -c "/workloadScripts/bde_ex3.sh $current_student" - $current_student &
done
wait
echo 'Execution for Exercise 3 ends for all students'

start_all=$(date +%s.%N)

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/su -c "/workloadScripts/bde_ex4.sh $current_student" - $current_student &
    #sleep 2
done
wait
echo 'Execution for Exercise 4 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/su -c "/workloadScripts/bde_ex5.sh $current_student" - $current_student &
    #sleep 2
done
wait
echo 'Execution for Exercise 5 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/su -c "/workloadScripts/bde_ex6.sh $current_student" - $current_student &
done
wait
echo 'Execution for Exercise 6 ends for all students'

for (( n=$1; n<=$2; n++ ))
do
    current_student=student`echo $n | awk '{ printf "%04i\n", $0 }'`
    /bin/bash /workloadScripts/bde_ex7.sh $current_student "$3$n" &
done
wait
echo 'Execution for Exercise 7 ends for all students'

duration_all=$(echo "$(date +%s.%N) - $start_all" | bc)
execution_time_all=`printf "%.2f seconds" $duration_all`

echo "All Execution Time: $execution_time_all"
