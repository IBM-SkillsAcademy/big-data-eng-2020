groupadd students

awk -v RS='\r?\n' ' BEGIN { FS = OFS = "," } 
    { 
      #split($2, email, /@/);
      system("useradd -m -g students "$1); 
      system("echo \"" $2 "\" | passwd --stdin "$1);
      system("su hdfs -c '\''hdfs dfs -mkdir -p /user/"$1"'\''");
      system("su hdfs -c '\''hdfs dfs -chown "$1":hdfs /user/"$1"'\''");
      system("su hdfs -c '\''hdfs dfs -setfacl -R --set  user::rwx,group::r--,other::r-x /user/"$1"'\''");
	  print $1 " account created and configured";
    }
' users.csv