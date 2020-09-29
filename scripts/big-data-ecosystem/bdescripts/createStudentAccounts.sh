awk -v RS='\r?\n' ' BEGIN { FS = OFS = "," } 
    { 
      split($2, email, /@/);
      system("useradd -m -g hdfs "$1);	  
      system("echo \"" email[1] "\" | passwd --stdin "$1);
      system("su hdfs -c '\''hadoop fs -mkdir -p /user/"$1"'\''");
      system("su hdfs -c '\''hadoop fs -chown "$1":hdfs /user/"$1"'\''");
      system("su hdfs -c '\''hadoop fs -chmod a-x /user/"$1"'\''");
      system("su hdfs -c '\''hadoop fs -chmod g-x /user/"$1"'\''");
	  print $1 " account created and configured";

    }
' users.csv