create server db2_on_cloud type DB2/UDB version 11 
authorization 'db2_username' password "db2_password" 
options (host 'db2_hostname', port 'db2_port', dbname 'db2_name', password 'Y');


create user mapping for username server db2_on_cloud options (REMOTE_AUTHID 'db2_username', REMOTE_PASSWORD 'db2_password');


create nickname db2_on_cloud_gosalesdw_mrk_promotion_fact 
for db2_on_cloud.db2_username.mrk_promotion_fact;

select * from db2_on_cloud_gosalesdw_mrk_promotion_fact;

select * from db2_on_cloud.db2_username.mrk_promotion_fact;

