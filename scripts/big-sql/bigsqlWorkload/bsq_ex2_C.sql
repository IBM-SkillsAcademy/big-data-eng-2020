


	CREATE EXTERNAL HADOOP TABLE IF NOT EXISTS sls_product_dim_external
	 ( product_key INT NOT NULL
	 , product_line_code INT NOT NULL
	 , product_type_key INT NOT NULL
	 , product_type_code INT NOT NULL
	 , product_number INT NOT NULL
	 , base_product_key INT NOT NULL
	 , base_product_number INT NOT NULL
	 , product_color_code INT
	 , product_size_code INT
	 , product_brand_key INT NOT NULL
	 , product_brand_code INT NOT NULL
	 , product_image VARCHAR(60)
	 , introduction_date TIMESTAMP
	 , discontinued_date TIMESTAMP
	 )	
	 ROW FORMAT DELIMITED
	 FIELDS TERMINATED BY '\t'
	 LINES TERMINATED BY '\n'
	 location '/user/username/bigsql_lab/sls_product_dim';



	 select product_key, introduction_date from sls_product_dim_external
	where discontinued_date is not null 
	fetch first 20 rows only;






