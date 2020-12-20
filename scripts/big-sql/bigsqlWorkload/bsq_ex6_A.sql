if ( not exists ( Select 1 From SysCat.Servers where ServerName='DB2_ON_CLOUD' ) ) 
    then create server db2_on_cloud type DB2/UDB version 11
    authorization db2_username password "db2_password" 
    options (host 'db2_hostname', port 'db2_port', dbname 'db2_name', password 'Y');


create user mapping for username server db2_on_cloud options (REMOTE_AUTHID 'db2_username', REMOTE_PASSWORD 'db2_password');

