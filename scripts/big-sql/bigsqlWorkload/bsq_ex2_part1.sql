create hadoop table test1 (col1 int, col2 varchar(5));
\tables
insert into test1 values (1, 'one');
\describe test1
select tabschema, colname, colno, typename, length from syscat.columns where tabschema = USER and tabname= 'TEST1';
drop table test1;
\tables