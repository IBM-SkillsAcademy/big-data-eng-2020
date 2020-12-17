create hadoop table test1 (col1 int, col2 varchar(5));
insert into test1 values (1,'one');
select tabschema, colname, colno, typename, length from syscat.columns where tabname = 'TEST1';

drop table test1;

CREATE HADOOP TABLE IF NOT EXISTS go_region_dim
( country_key   INT NOT NULL
, country_code  INT NOT NULL
, flag_image            VARCHAR(45)
, iso_three_letter_code VARCHAR(9) NOT NULL
, iso_two_letter_code           VARCHAR(6) NOT NULL
, iso_three_digit_code  VARCHAR(9) NOT NULL
, region_key    INT NOT NULL
, region_code   INT NOT NULL
, region_en     VARCHAR(90) NOT NULL
, country_en    VARCHAR(90) NOT NULL
, region_de     VARCHAR(90), country_de VARCHAR(90), region_fr  VARCHAR(90)
, country_fr    VARCHAR(90), region_ja  VARCHAR(90), country_ja VARCHAR(90)
, region_cs     VARCHAR(90), country_cs VARCHAR(90), region_da  VARCHAR(90)
, country_da    VARCHAR(90), region_el  VARCHAR(90), country_el VARCHAR(90)
, region_es     VARCHAR(90), country_es VARCHAR(90), region_fi  VARCHAR(90)
, country_fi    VARCHAR(90), region_hu  VARCHAR(90), country_hu VARCHAR(90)
, region_id     VARCHAR(90), country_id VARCHAR(90), region_it  VARCHAR(90)
, country_it    VARCHAR(90), region_ko  VARCHAR(90), country_ko VARCHAR(90)
, region_ms     VARCHAR(90), country_ms VARCHAR(90), region_nl  VARCHAR(90)
, country_nl    VARCHAR(90), region_no  VARCHAR(90), country_no VARCHAR(90)
, region_pl     VARCHAR(90), country_pl VARCHAR(90), region_pt  VARCHAR(90)
, country_pt    VARCHAR(90), region_ru  VARCHAR(90), country_ru VARCHAR(90)
, region_sc     VARCHAR(90), country_sc VARCHAR(90), region_sv  VARCHAR(90)
, country_sv    VARCHAR(90), region_tc  VARCHAR(90), country_tc VARCHAR(90)
, region_th     VARCHAR(90), country_th VARCHAR(90)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
;
CREATE HADOOP TABLE IF NOT EXISTS sls_order_method_dim
( order_method_key      INT NOT NULL
, order_method_code     INT NOT NULL
, order_method_en       VARCHAR(90) NOT NULL
, order_method_de       VARCHAR(90), order_method_fr    VARCHAR(90)
, order_method_ja       VARCHAR(90), order_method_cs    VARCHAR(90)
, order_method_da       VARCHAR(90), order_method_el    VARCHAR(90)
, order_method_es       VARCHAR(90), order_method_fi    VARCHAR(90)
, order_method_hu       VARCHAR(90), order_method_id    VARCHAR(90)
, order_method_it       VARCHAR(90), order_method_ko    VARCHAR(90)
, order_method_ms       VARCHAR(90), order_method_nl    VARCHAR(90)
, order_method_no       VARCHAR(90), order_method_pl    VARCHAR(90)
, order_method_pt       VARCHAR(90), order_method_ru    VARCHAR(90)
, order_method_sc       VARCHAR(90), order_method_sv    VARCHAR(90)
, order_method_tc       VARCHAR(90), order_method_th    VARCHAR(90)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
;
CREATE HADOOP TABLE IF NOT EXISTS sls_product_brand_lookup
( product_brand_code    INT NOT NULL
, product_brand_en      VARCHAR(90) NOT NULL
, product_brand_de      VARCHAR(90), product_brand_fr   VARCHAR(90)
, product_brand_ja      VARCHAR(90), product_brand_cs   VARCHAR(90)
, product_brand_da      VARCHAR(90), product_brand_el   VARCHAR(90)
, product_brand_es      VARCHAR(90), product_brand_fi   VARCHAR(90)
, product_brand_hu      VARCHAR(90), product_brand_id   VARCHAR(90)
, product_brand_it      VARCHAR(90), product_brand_ko   VARCHAR(90)
, product_brand_ms      VARCHAR(90), product_brand_nl   VARCHAR(90)
, product_brand_no      VARCHAR(90), product_brand_pl   VARCHAR(90)
, product_brand_pt      VARCHAR(90), product_brand_ru   VARCHAR(90)
, product_brand_sc      VARCHAR(90), product_brand_sv   VARCHAR(90)
, product_brand_tc      VARCHAR(90), product_brand_th   VARCHAR(90)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
;
CREATE HADOOP TABLE IF NOT EXISTS sls_product_dim
( product_key           INT NOT NULL
, product_line_code     INT NOT NULL
, product_type_key      INT NOT NULL
, product_type_code     INT NOT NULL
, product_number        INT NOT NULL
, base_product_key      INT NOT NULL
, base_product_number   INT NOT NULL
, product_color_code    INT
, product_size_code     INT
, product_brand_key     INT NOT NULL
, product_brand_code    INT NOT NULL
, product_image         VARCHAR(60)
, introduction_date     TIMESTAMP
, discontinued_date     TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
;
CREATE HADOOP TABLE IF NOT EXISTS sls_product_line_lookup
( product_line_code     INT NOT NULL
, product_line_en       VARCHAR(90) NOT NULL
, product_line_de       VARCHAR(90), product_line_fr    VARCHAR(90)
, product_line_ja       VARCHAR(90), product_line_cs    VARCHAR(90)
, product_line_da       VARCHAR(90), product_line_el    VARCHAR(90)
, product_line_es       VARCHAR(90), product_line_fi    VARCHAR(90)
, product_line_hu       VARCHAR(90), product_line_id    VARCHAR(90)
, product_line_it       VARCHAR(90), product_line_ko    VARCHAR(90)
, product_line_ms       VARCHAR(90), product_line_nl    VARCHAR(90)
, product_line_no       VARCHAR(90), product_line_pl    VARCHAR(90)
, product_line_pt       VARCHAR(90), product_line_ru    VARCHAR(90)
, product_line_sc       VARCHAR(90), product_line_sv    VARCHAR(90)
, product_line_tc       VARCHAR(90), product_line_th    VARCHAR(90)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;
CREATE HADOOP TABLE IF NOT EXISTS sls_product_lookup
( product_number        INT NOT NULL
, product_language      VARCHAR(30) NOT NULL
, product_name          VARCHAR(150) NOT NULL
, product_description   VARCHAR(765)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

CREATE HADOOP TABLE IF NOT EXISTS sls_sales_fact
( order_day_key         INT NOT NULL
, organization_key      INT NOT NULL
, employee_key          INT NOT NULL
, retailer_key          INT NOT NULL
, retailer_site_key     INT NOT NULL
, product_key           INT NOT NULL
, promotion_key         INT NOT NULL
, order_method_key      INT NOT NULL
, sales_order_key       INT NOT NULL
, ship_day_key          INT NOT NULL
, close_day_key         INT NOT NULL
, quantity              INT
, unit_cost             DOUBLE
, unit_price            DOUBLE
, unit_sale_price       DOUBLE
, gross_margin          DOUBLE
, sale_total            DOUBLE
, gross_profit          DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
;

CREATE HADOOP TABLE IF NOT EXISTS mrk_promotion_fact
( organization_key      INT NOT NULL
, order_day_key         INT NOT NULL
, rtl_country_key       INT NOT NULL
, employee_key          INT NOT NULL
, retailer_key          INT NOT NULL
, product_key           INT NOT NULL
, promotion_key         INT NOT NULL
, sales_order_key       INT NOT NULL
, quantity              SMALLINT
, unit_cost             DOUBLE
, unit_price            DOUBLE
, unit_sale_price       DOUBLE
, gross_margin          DOUBLE
, sale_total            DOUBLE
, gross_profit          DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;
