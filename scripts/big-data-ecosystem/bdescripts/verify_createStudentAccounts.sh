
export GROUPID=`grep students /etc/group | cut -f 3 -d :`
echo $GROUPID
if [ -z "$GROUPID" ]
then 
  read -s -n 1 -p "Press any key to exit"
  exit 1
else
  read -s -n 1 -p "Press any key to continue"
fi

awk -v RS='\r?\n' ' BEGIN { FS = OFS = "," } 
    { 0
      split($2, email, /@/);
      #system("useradd -m -g students "$1); 
      #system("echo \"" email[1] "\" | passwd --stdin "$1);
      system("test_login.sh $1 email[1]);
      #system("su hdfs -c '\''hdfs dfs -mkdir -p /user/"$1"'\''");
      #system("su hdfs -c '\''hdfs dfs -chown "$1":hdfs /user/"$1"'\''");
      #system("su hdfs -c '\''hdfs dfs -setfacl -R --set  user::rwx,group::r--,other::r-x /user/"$1"'\''");
	  #print $1 " account created and configured";
    }
' users.csv