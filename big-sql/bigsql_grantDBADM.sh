echo 'Granting db2 DBADM priviledges to all students ...'
db2 connect to bigsql
db2 grant DBADM on database to group db2users
db2 connect reset