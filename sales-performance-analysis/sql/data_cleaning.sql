-- =========================================
-- Data Cleaning & Preparation
-- =========================================

-- Check for NULL dates
SELECT
    COUNT(*) AS null_order_dates
FROM superstore
WHERE order_date IS NULL;

-- Replace NULL profits with 0 (safety)
UPDATE superstore
SET profit = COALESCE(profit, 0);

-- Replace NULL discounts with 0
UPDATE superstore
SET discount = COALESCE(discount, 0);

-- Verify date range
SELECT
    MIN(order_date) AS min_date,
    MAX(order_date) AS max_date
FROM superstore;

-- Basic sanity check
SELECT
    COUNT(*) AS total_rows
FROM superstore;
