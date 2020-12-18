create hadoop table if not exists sls_product_line_lookup_array
(product_line_code      INT NOT NULL,
description             ARRAY<VARCHAR(50)>);

LOAD HADOOP USING FILE URL '/user/username/sampledata/data/product_line_array.csv' WITH SOURCE PROPERTIES ('field.delimiter'='|', 'collection.items.delimiter'=',') INTO TABLE sls_product_line_lookup_array OVERWRITE;

select product_line_code, description[1] as English, description[2] as German from sls_product_line_lookup_array where description[1] like 'Personal%';
