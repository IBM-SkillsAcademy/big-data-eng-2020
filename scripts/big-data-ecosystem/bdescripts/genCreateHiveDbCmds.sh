export USERS_FILE=$1
awk -v RS='\r?\n' '
    BEGIN { FS = OFS = "," } 
    { 
      print "create database db_"$1 ";"
    }
' $USERS_FILE  > createHiveDBs.sql