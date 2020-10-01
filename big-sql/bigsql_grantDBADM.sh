echo 'Granting db2 priviledges to all students ...'
db2 connect to bigsql
db2 grant DBADM on database to group db2users
db2 connect reset