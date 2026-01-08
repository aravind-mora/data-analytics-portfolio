-- ============================================================
-- KPI QUERIES
-- ============================================================
-- This file contains core business KPIs derived from the
-- star schema (marts layer). These queries are intended for
-- executive reporting and high-level business analysis.
-- ============================================================


-- ============================================================
-- 1. OVERALL BUSINESS PERFORMANCE
-- ============================================================
-- Total orders, total revenue, and average order value (AOV)
-- ============================================================

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM marts.fact_orders;


-- ============================================================
-- 2. MONTHLY REVENUE TREND
-- ============================================================
-- Revenue aggregated at year-month level
-- ============================================================

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM marts.fact_orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;


-- ============================================================
-- 3. REVENUE BY PRODUCT CATEGORY
-- ============================================================
-- Identifies top-performing product categories
-- ============================================================

SELECT
    p.product_category,
    SUM(f.revenue) AS total_revenue
FROM marts.fact_orders f
JOIN marts.dim_products p
    ON f.product_id = p.product_id
GROUP BY
    p.product_category
ORDER BY
    total_revenue DESC;


-- ============================================================
-- 4. AVERAGE DELIVERY TIME
-- ============================================================
-- Measures fulfillment efficiency (in days)
-- ============================================================

SELECT
    ROUND(AVG(DATEDIFF(delivery_date, order_date)), 2) AS avg_delivery_days
FROM marts.fact_orders
WHERE delivery_date IS NOT NULL;


-- ============================================================
-- 5. PAYMENT METHOD CONTRIBUTION
-- ============================================================
-- Revenue and order volume by payment type
-- ============================================================

SELECT
    p.payment_type,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue
FROM marts.fact_orders f
JOIN marts.dim_payments p
    ON f.order_id = p.order_id
GROUP BY
    p.payment_type
ORDER BY
    total_revenue DESC;


-- ============================================================
-- 6. TOP SELLERS BY REVENUE
-- ============================================================
-- Identifies sellers driving the most revenue
-- ============================================================

SELECT
    s.seller_id,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue
FROM marts.fact_orders f
JOIN marts.dim_sellers s
    ON f.seller_id = s.seller_id
GROUP BY
    s.seller_id
ORDER BY
    total_revenue DESC
LIMIT 10;
