\set terminator = @;
\set 

CREATE OR REPLACE FUNCTION new_final_price
(
  quantity INTEGER,
  unit_sale_price DOUBLE,
  discount_in_percent DOUBLE,
  sales_tax_in_percent DOUBLE
)
RETURNS DOUBLE
LANGUAGE SQL
RETURN (quantity * unit_sale_price) * DOUBLE(1 - discount_in_percent / 100.0) * DOUBLE(1 + sales_tax_in_percent / 100.0) @

VALUES new_final_price (1, 10, 20, 8.75)@

SELECT sales_order_key, quantity, unit_sale_price, new_final_price(quantity, unit_sale_price, 20, 8.75) as final_price
FROM sls_sales_fact
ORDER BY sales_order_key
FETCH FIRST 10 ROWS ONLY@

--SELECT sales_order_key, quantity, unit_sale_price,
--new_final_price(quantity, unit_sale_price, 20, 8.75) as final_price
--FROM sls_sales_fact
--WHERE new_final_price(quantity, unit_sale_price, 20, 8.75) > 7000
--ORDER BY sales_order_key
--@

CREATE HADOOP TABLE IF NOT EXISTS big_sales_parquet 
( 
product_key    	INT NOT NULL, 
product_name		VARCHAR(150), 
quantity 		INT, 
order_method_en   VARCHAR(90)
)
STORED AS parquetfile@



INSERT into big_sales_parquet 
SELECT sales.product_key, pnumb.product_name, sales.quantity,
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
and sales.quantity > 5500@

--select * from big_sales_parquet@


