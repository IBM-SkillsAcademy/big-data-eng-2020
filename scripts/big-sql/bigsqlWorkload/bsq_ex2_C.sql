load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.GO_REGION_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE GO_REGION_DIM overwrite;

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.SLS_ORDER_METHOD_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_ORDER_METHOD_DIM overwrite;

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.SLS_PRODUCT_BRAND_LOOKUP.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_BRAND_LOOKUP overwrite;

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.SLS_PRODUCT_DIM.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_DIM overwrite;

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.SLS_PRODUCT_LINE_LOOKUP.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_LINE_LOOKUP overwrite;

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.SLS_PRODUCT_LOOKUP.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_PRODUCT_LOOKUP overwrite;

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.SLS_SALES_FACT.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE SLS_SALES_FACT overwrite; 

load hadoop using file url '/user/$1/sampledata/data/GOSALESDW.MRK_PROMOTION_FACT.txt' with SOURCE PROPERTIES ('field.delimiter'='\t') INTO TABLE MRK_PROMOTION_FACT overwrite;



select count(*) from GO_REGION_DIM;
select count(*) from sls_order_method_dim;
select count(*) from SLS_PRODUCT_BRAND_LOOKUP;
select count(*) from SLS_PRODUCT_DIM;
select count(*) from SLS_PRODUCT_LINE_LOOKUP;
select count(*) from SLS_SALES_FACT;
select count(*) from MRK_PROMOTION_FACT;

