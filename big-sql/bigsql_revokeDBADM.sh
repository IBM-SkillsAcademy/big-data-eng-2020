echo 'Revoking db2 DBADM priviledges from all students ...'
db2 connect to bigsql
db2 revoke DBADM on database from group db2users
db2 connect reset