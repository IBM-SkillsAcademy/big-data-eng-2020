DELETE from GO_REGION_DIM;
DELETE from sls_order_method_dim;
DELETE from SLS_PRODUCT_BRAND_LOOKUP;
DELETE from SLS_PRODUCT_DIM;
DELETE from SLS_PRODUCT_LINE_LOOKUP;
DELETE from SLS_PRODUCT_LOOKUP;
DELETE from SLS_SALES_FACT;
DELETE from MRK_PROMOTION_FACT;

drop table if EXISTS test1 ;

drop table if EXISTS go_region_dim;
drop table if EXISTS sls_order_method_dim;
drop table if EXISTS sls_product_brand_lookup;
drop table if EXISTS sls_product_dim;
drop table if EXISTS sls_product_line_lookup;
drop table if EXISTS  sls_product_lookup;
drop table if EXISTS  sls_sales_fact;
drop table if EXISTS  mrk_promotion_fact;

DROP VIEW if exists myview;

DELETE FROM SALES_REPORT;
drop table if exists sales_report;

DELETE FROM sls_product_dim_external;
drop table if exists sls_product_dim_external;

