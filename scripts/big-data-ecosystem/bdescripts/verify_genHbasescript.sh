awk -v RS='\r?\n' '
    BEGIN { FS = OFS = "," } 
    { 
      system("echo "$1);
      system("su hbase -c '\''echo \"user_permission '\''\\'\'''\''ns_"$1"'\''\\'\'''\''\" | hbase shell -n '\''");
      #system("su hbase -c '\''echo \"grant '\''\\'\'''\''"$1"'\''\\'\'''\'', '\''\\'\'''\''RWXC'\''\\'\'''\'', '\''\\'\'''\''@ns_"$1"'\''\\'\'''\''\" | hbase shell -n '\''");
      
    }
' users.csv

echo 'list created namespaces: '
su hbase -c 'echo "list_namespace" | hbase shell -n'