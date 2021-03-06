## Remove temp files 
cd /root/bdescripts
rm -rf success_create_student_A.txt
rm -rf fail_create_student_A.txt 
rm -rf students_dir.txt
rm -rf test_create_student_C.txt 
rm -rf created_users.txt

export GROUPID=`grep students /etc/group | cut -f 3 -d :`
#echo $GROUPID
if [ -z "$GROUPID" ]
then 
  echo "group students creation failed"
  read -s -n 1 -p "Press any key to exit"
  
  exit 1
else
  echo -e "group students creation succeeded\n"

  read -s -n 1 -p "Press any key to continue"
fi

awk -v RS='\r?\n' ' BEGIN { FS = OFS = "," } 
    { 
      #split($2, email, /@/);
      #system("useradd -m -g students "$1); 
      #system("echo \"" email[1] "\" | passwd --stdin "$1);
      #system("echo " $1);
      #system("echo " email[1]);
      system("./test_login.sh " $1 " " $2);
      #system("su hdfs -c '\''hdfs dfs -mkdir -p /user/"$1"'\''");
      #system("su hdfs -c '\''hdfs dfs -chown "$1":hdfs /user/"$1"'\''");
      #system("su hdfs -c '\''hdfs dfs -setfacl -R --set  user::rwx,group::r--,other::r-x /user/"$1"'\''");
      #system("su hdfs  '\''hdfs dfs -ls -h --set  user::rwx,group::r--,other::r-x /user/"$1"'\''");
	  #print $1 " account created and configured";
    }
' users.csv



grep $GROUPID /etc/passwd | grep student | cut -f 1 -d ":" | sort | uniq > created_users.txt
cut -f 1 -d "," users.csv | sort | uniq > users_list.txt

hadoop fs -ls -h /user/ | grep student > test_create_student_C.txt 
cat test_create_student_C.txt  | grep hdfs | grep drwxr--r-x | cut -f 5 -d " " | sort | uniq > students_dir.txt 
MD5_CREATED=(`md5sum created_users.txt`)
MD5_DIR=(`md5sum students_dir.txt`)
MD5_USERS=(`md5sum users_list.txt`) 

if [ "$MD5_DIR" == "$MD5_USERS" ]; then
  echo -e "\nuser accounts created successfully"
else 
  echo -e "\nuser accounts failed to be created correctly\n"
  read -s -n 1 -p "Press any key to exit"
  exit 1
fi



if [ "$MD5_DIR" == "$MD5_USERS" ]; then
  echo -e "\nuser directories created successfully\n"
else 
  echo "user directories creation has problems, review list of directories and check their owners, groups and permissions for more details"
  cat test_create_student_C.txt | grep -v hdfs
  cat test_create_student_C.txt | grep -v drwxr--r-x
  exit 1
fi
echo 'createStudentAccounts.sh ran successfully'

