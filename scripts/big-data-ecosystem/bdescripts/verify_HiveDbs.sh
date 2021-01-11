 cd /root/bdescripts

rm -rf hive_databases.txt
rm -rf users_list.txt

cut -f 1 -d "," users.csv  | sort | uniq > users_list.txt
su hive -c "hive  -e 'show databases'" | grep student | cut -c 6-16 | sort | uniq > hive_databases.txt




#MD5_CREATED=(`md5sum created_users.txt`)
MD5_USERS=(`md5sum users_list.txt`)
#=(`md5sum users_list.txt`)
MD5_HIVEDBS=(`md5sum hive_databases.txt`) 

if [ "$MD5_HIVEDBS" == "$MD5_USERS" ]; then
  echo -e "\nHive Databases created succesfully"
else 
  echo -e "\nuHive Databases failed to be created correctly\n"
  read -s -n 1 -p "Press any key to exit"
  exit 1
fi


echo "hive databases created successfully"


awk -v RS='\r?\n' '
    BEGIN { FS = OFS = "," } 
    { 
    #  print "create database db_"$1 ";"
    #system("./test_login.sh " $1 " " email[1]);
    #system("su hdfs -c '\''hdfs dfs -chown "$1":hdfs /user/"$1"'\''");
    system("echo su hive -c \"hive -e \"describe database db_"$1\" ");

    }
' users.csv 




