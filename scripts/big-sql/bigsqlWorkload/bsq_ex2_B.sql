--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.GO_REGION_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE GO_REGION_DIM overwrite;

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.SLS_ORDER_METHOD_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_ORDER_METHOD_DIM overwrite;

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.SLS_PRODUCT_BRAND_LOOKUP.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_BRAND_LOOKUP overwrite;

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.SLS_PRODUCT_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_DIM overwrite;

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.SLS_PRODUCT_LINE_LOOKUP.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_LINE_LOOKUP overwrite;

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.SLS_PRODUCT_LOOKUP.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_LOOKUP overwrite;

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.SLS_SALES_FACT.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_SALES_FACT overwrite; 

--load hadoop using file url '/user/username/sampledata/data/GOSALESDW.MRK_PROMOTION_FACT.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE MRK_PROMOTION_FACT overwrite;



select count(*) from GO_REGION_DIM;
select count(*) from sls_order_method_dim;
select count(*) from SLS_PRODUCT_BRAND_LOOKUP;
select count(*) from SLS_PRODUCT_DIM;
select count(*) from SLS_PRODUCT_LINE_LOOKUP;
select count(*) from SLS_SALES_FACT;
select count(*) from MRK_PROMOTION_FACT;
commit;

create view myview as 
	select product_name, sales.product_key, mkt.quantity, 
	sales.order_day_key, sales.sales_order_key, order_method_en
	from
	mrk_promotion_fact mkt, 
		sls_sales_fact sales, 
		sls_product_dim prod, 
		sls_product_lookup pnumb, 
		sls_order_method_dim meth
	where mkt.order_day_key=sales.order_day_key 
		and sales.product_key=prod.product_key 
		and prod.product_number=pnumb.product_number 
		and pnumb.product_language='EN' 
		and meth.order_method_key=sales.order_method_key;

select * from myview 	
	order by product_key asc, order_day_key asc
	fetch first 20 rows only;


CREATE HADOOP TABLE sales_report 
	( 
	product_key      INT NOT NULL, 
	product_name		VARCHAR(150), 
	quantity 		INT, 
	order_method_en	VARCHAR(90)
	)
	ROW FORMAT DELIMITED 
	FIELDS TERMINATED BY '\t' 
	LINES TERMINATED BY '\n'
	STORED AS TEXTFILE;


    INSERT INTO sales_report 
SELECT sales.product_key, pnumb.product_name, sales.quantity, meth.order_method_en
	FROM
	sls_sales_fact sales,
	sls_product_dim prod,
	sls_product_lookup pnumb,
	sls_order_method_dim meth
	WHERE
	pnumb.product_language='EN'
	AND sales.product_key=prod.product_key
	AND prod.product_number=pnumb.product_number
	AND meth.order_method_key=sales.order_method_key  
	and sales.quantity > 1000;

    select count(*) from sales_report;






