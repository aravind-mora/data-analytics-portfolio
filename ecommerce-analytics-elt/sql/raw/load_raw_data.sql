-- ============================================================
-- RAW DATA LOAD SCRIPT
-- ============================================================
-- This script loads source CSV files into RAW schema tables.
-- Data is loaded AS-IS without cleaning or transformations.
-- Transformations are handled later in the STAGING layer
-- following the ELT approach.
--
-- NOTE:
--  - Requires LOCAL INFILE to be enabled in MySQL
--  - File paths are local to the developer machine
-- ============================================================


-- ============================================================
-- LOAD CUSTOMERS
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/olist_customers_dataset.csv'
INTO TABLE raw.customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- LOAD ORDERS
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/olist_orders_dataset.csv'
INTO TABLE raw.orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- LOAD ORDER ITEMS
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/olist_order_items_dataset.csv'
INTO TABLE raw.order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- LOAD PAYMENTS
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/olist_order_payments_dataset.csv'
INTO TABLE raw.payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- LOAD PRODUCTS
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/olist_products_dataset.csv'
INTO TABLE raw.products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- LOAD SELLERS
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/olist_sellers_dataset.csv'
INTO TABLE raw.sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- LOAD PRODUCT CATEGORY TRANSLATION
-- Maps Portuguese category names to English
-- ============================================================
LOAD DATA LOCAL INFILE
'C:/Users/91868/Downloads/archive/product_category_name_translation.csv'
INTO TABLE raw.product_category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
