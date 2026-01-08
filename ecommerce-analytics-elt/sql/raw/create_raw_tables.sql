-- ============================================================
-- DATABASE & SCHEMA SETUP
-- ============================================================

-- Create main database for the analytics project
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

-- Create schemas for ELT layers
CREATE SCHEMA raw;
CREATE SCHEMA staging;
CREATE SCHEMA marts;


-- ============================================================
-- RAW TABLES
-- These tables store source data exactly as received from CSVs.
-- No transformations, constraints, or business logic applied.
-- ============================================================


-- ------------------------------------------------------------
-- CUSTOMERS
-- Stores customer demographic and location details
-- ------------------------------------------------------------
CREATE TABLE raw.customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);


-- ------------------------------------------------------------
-- ORDERS
-- Stores order lifecycle timestamps and status
-- ------------------------------------------------------------
CREATE TABLE raw.orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);


-- ------------------------------------------------------------
-- ORDER ITEMS
-- One row per product per order
-- ------------------------------------------------------------
CREATE TABLE raw.order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);


-- ------------------------------------------------------------
-- PAYMENTS
-- One order may have multiple payment records
-- ------------------------------------------------------------
CREATE TABLE raw.payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);


-- ------------------------------------------------------------
-- PRODUCTS
-- Product attributes and physical dimensions
-- ------------------------------------------------------------
CREATE TABLE raw.products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);


-- ------------------------------------------------------------
-- SELLERS
-- Seller location and identity details
-- ------------------------------------------------------------
CREATE TABLE raw.sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);


-- ------------------------------------------------------------
-- PRODUCT CATEGORY TRANSLATION
-- Maps Portuguese category names to English
-- ------------------------------------------------------------
CREATE TABLE raw.product_category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);
