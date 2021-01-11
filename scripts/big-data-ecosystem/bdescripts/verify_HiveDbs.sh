 cd /root/bdescripts
rm -rf success_create_student_A.txt
rm -rf fail_create_student_A.txt 
rm -rf students_dir.txt
rm -rf test_create_student_C.txt 
rm -rf created_users.txt
rm -rf hive_databases.txt

cut -f 1 -d "," users.csv | sort | uniq > users_list.txt
su hive -c "hive  -e 'show databases'" | cut -c 6-17 | sort | uniq > hive_databases.txt




#MD5_CREATED=(`md5sum created_users.txt`)
MD5_USERS=(`md5sum users_list.txt`)
#=(`md5sum users_list.txt`)
MD5_HIVEDBS=(`md5sum hive_databases.txt`) 

if [ "$MD5_HIVEDBS" == "$MD5_USERS" ]; then
  echo -e "\nuser accounts created successfully"
else 
  echo -e "\nuser accounts failed to be created correctly\n"
  read -s -n 1 -p "Press any key to exit"
  exit 1
fi


