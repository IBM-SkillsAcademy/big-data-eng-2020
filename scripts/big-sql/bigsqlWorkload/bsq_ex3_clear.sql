--Fetch the product name, quantity, and order method of products sold. 
	--
	--Query 1
	SELECT pnumb.product_name, sales.quantity,
	meth.order_method_en
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
	fetch first 20 rows only;  


    --Fetch the product name, quantity, and order method
	--of products sold through sales visits.  
	--Query 2
	SELECT pnumb.product_name, sales.quantity,
	meth.order_method_en
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
	AND order_method_en='Sales visit'
	FETCH FIRST 20 ROWS ONLY;

    --Query 3
	SELECT pll.product_line_en AS Product,
	md.order_method_en AS Order_method,
	sum(sf.QUANTITY) AS total
	FROM  
	sls_order_method_dim AS md,
	sls_product_dim AS pd,
	sls_product_line_lookup AS pll,
	sls_product_brand_lookup AS pbl,
	sls_sales_fact AS sf
	WHERE
	pd.product_key = sf.product_key
	AND md.order_method_key = sf.order_method_key
	AND pll.product_line_code = pd.product_line_code
	AND pbl.product_brand_code = pd.product_brand_code
	GROUP BY pll.product_line_en, md.order_method_en;




