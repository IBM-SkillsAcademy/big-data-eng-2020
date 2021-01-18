rm -rf hbase_files.txt
rm -rf hbase_results.txt
rm -rf users_list.txt

awk -v RS='\r?\n' '
    BEGIN { FS = OFS = "," } 
    { 
      system("./test_hbase.sh "$1);
      #system("su hbase -c '\''echo \"user_permission '\''\\'\'''\''ns_"$1"'\''\\'\'''\''\" | hbase shell -n '\''");
      #system("su hbase -c '\''echo \"grant '\''\\'\'''\''"$1"'\''\\'\'''\'', '\''\\'\'''\''RWXC'\''\\'\'''\'', '\''\\'\'''\''@ns_"$1"'\''\\'\'''\''\" | hbase shell -n '\''");
      
    }
' users.csv  > hbase_results.txt
cat hbase_results.txt | grep Permission | grep READ,WRITE,EXEC,CREATE | sort | uniq |  cut -c 2-12 > hbase_files.txt

cut -f 1 -d "," users.csv | sort | uniq > users_list.txt

MD5_HBASE=(`md5sum hbase_files.txt`)
MD5_USERS=(`md5sum users_list.txt`) 


if [ "$MD5_HBASE" == "$MD5_USERS" ]; then
  echo -e "\nHBase namespaces created successfully"
else 
  echo -e "\nHBase namespaces failed to be created correctly\n"
  read -s -n 1 -p "Press any key to exit"
  exit 1
fi

#echo 'list created namespaces: '
#su hbase -c 'echo "list_namespace" | hbase shell -n'