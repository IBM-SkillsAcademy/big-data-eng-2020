 #cd /root/bdescripts

rm -rf hive_databases.txt
rm -rf users_list.txt

cut -f 1 -d "," users.csv  | sort | uniq > users_list.txt
su hive -c "hive  -e 'show databases'" | grep student | cut -c 6-16 | sort | uniq > hive_databases.txt




#MD5_CREATED=(`md5sum created_users.txt`)
MD5_USERS=(`md5sum users_list.txt`)
#=(`md5sum users_list.txt`)
MD5_HIVEDBS=(`md5sum hive_databases.txt`) 
#echo $MD5_USERS
#echo $MD5_HIVEDBS
if [ "$MD5_HIVEDBS" == "$MD5_USERS" ]; then
  echo -e "\nHive Databases created succesfully"
else 
  echo -e "\nuHive Databases failed to be created correctly\n"
  read -s -n 1 -p "Press any key to exit"
  exit 1
fi


echo "hive databases created successfully"



