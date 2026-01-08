-- ============================================================
-- BUSINESS QUESTIONS (EXPLORATORY ANALYSIS)
-- ============================================================
-- This file focuses on diagnostic and comparative questions
-- that help explain business performance and guide decisions.
-- These are NOT headline KPIs.
-- ============================================================


-- ============================================================
-- 1. WHICH SELLERS ARE HIGH VALUE VS HIGH VOLUME?
-- ============================================================
-- Distinguishes sellers with many orders from sellers
-- with fewer but higher-value orders
-- ============================================================

SELECT
    s.seller_id,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue,
    ROUND(SUM(f.revenue) / COUNT(DISTINCT f.order_id), 2) AS avg_revenue_per_order
FROM marts.fact_orders f
JOIN marts.dim_sellers s
    ON f.seller_id = s.seller_id
GROUP BY
    s.seller_id
ORDER BY
    avg_revenue_per_order DESC;


-- ============================================================
-- 2. WHICH STATES HAVE FAST DELIVERY BUT LOW ORDER VOLUME?
-- ============================================================
-- Helps identify underutilized but efficient regions
-- ============================================================

SELECT
    c.customer_state,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(AVG(DATEDIFF(f.delivery_date, f.order_date)), 2) AS avg_delivery_days
FROM marts.fact_orders f
JOIN marts.dim_customers c
    ON f.customer_id = c.customer_id
WHERE f.delivery_date IS NOT NULL
GROUP BY
    c.customer_state
ORDER BY
    avg_delivery_days ASC;


-- ============================================================
-- 3. WHICH PRODUCT CATEGORIES ARE NICHE BUT HIGH VALUE?
-- ============================================================
-- Categories with low order count but high revenue
-- ============================================================

SELECT
    p.product_category,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue,
    ROUND(SUM(f.revenue) / COUNT(DISTINCT f.order_id), 2) AS avg_order_value
FROM marts.fact_orders f
JOIN marts.dim_products p
    ON f.product_id = p.product_id
GROUP BY
    p.product_category
HAVING
    COUNT(DISTINCT f.order_id) < 100
ORDER BY
    avg_order_value DESC;


-- ============================================================
-- 4. HOW DOES PAYMENT METHOD CORRELATE WITH ORDER VALUE?
-- ============================================================
-- Goes beyond totals to compare average order size
-- ============================================================

SELECT
    p.payment_type,
    COUNT(DISTINCT f.order_id) AS total_orders,
    ROUND(SUM(f.revenue) / COUNT(DISTINCT f.order_id), 2) AS avg_order_value
FROM marts.fact_orders f
JOIN marts.dim_payments p
    ON f.order_id = p.order_id
GROUP BY
    p.payment_type
ORDER BY
    avg_order_value DESC;


-- ============================================================
-- 5. WHICH SELLER STATES GENERATE HIGH REVENUE PER ORDER?
-- ============================================================
-- Useful for regional seller strategy
-- ============================================================

SELECT
    s.seller_state,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue,
    ROUND(SUM(f.revenue) / COUNT(DISTINCT f.order_id), 2) AS avg_revenue_per_order
FROM marts.fact_orders f
JOIN marts.dim_sellers s
    ON f.seller_id = s.seller_id
GROUP BY
    s.seller_state
ORDER BY
    avg_revenue_per_order DESC;
