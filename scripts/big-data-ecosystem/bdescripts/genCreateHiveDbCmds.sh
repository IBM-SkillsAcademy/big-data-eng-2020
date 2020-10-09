awk -v RS='\r?\n' '
    BEGIN { FS = OFS = "," } 
    { 
      print "create database db_"$1 ";"
    }
' users.csv > createHiveDBs.sql