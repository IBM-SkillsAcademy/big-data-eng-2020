export USERS_FILE=$1
awk -v RS='\r?\n' '
    BEGIN { FS = OFS = "," } 
    { 
      system("su hbase -c '\''echo \"create_namespace '\''\\'\'''\''ns_"$1"'\''\\'\'''\''\" | hbase shell -n '\''");
      system("su hbase -c '\''echo \"grant '\''\\'\'''\''"$1"'\''\\'\'''\'', '\''\\'\'''\''RWXC'\''\\'\'''\'', '\''\\'\'''\''@ns_"$1"'\''\\'\'''\''\" | hbase shell -n '\''");
      
    }
' $USERS_FILE

echo 'list created namespaces: '
su hbase -c 'echo "list_namespace" | hbase shell -n'