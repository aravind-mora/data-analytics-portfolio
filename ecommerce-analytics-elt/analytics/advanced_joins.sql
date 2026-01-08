-- ============================================================
-- ADVANCED JOINS & ANALYTICAL SQL
-- ============================================================
-- This file demonstrates complex SQL patterns using the
-- star schema. These queries focus on multi-dimensional
-- joins, edge cases, and analytical reasoning.
-- ============================================================


-- ============================================================
-- 1. CUSTOMER → ORDER → PRODUCT → SELLER REVENUE FLOW
-- ============================================================
-- Traces how revenue flows across multiple business entities
-- ============================================================

SELECT
    c.customer_state,
    p.product_category,
    s.seller_state,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue
FROM marts.fact_orders f
JOIN marts.dim_customers c
    ON f.customer_id = c.customer_id
JOIN marts.dim_products p
    ON f.product_id = p.product_id
JOIN marts.dim_sellers s
    ON f.seller_id = s.seller_id
GROUP BY
    c.customer_state,
    p.product_category,
    s.seller_state
ORDER BY
    total_revenue DESC;


-- ============================================================
-- 2. TOP PRODUCT CATEGORY PER SELLER (WINDOW FUNCTION)
-- ============================================================
-- Identifies each seller's highest revenue category
-- ============================================================

WITH seller_category_revenue AS (
    SELECT
        s.seller_id,
        p.product_category,
        SUM(f.revenue) AS category_revenue,
        RANK() OVER (
            PARTITION BY s.seller_id
            ORDER BY SUM(f.revenue) DESC
        ) AS revenue_rank
    FROM marts.fact_orders f
    JOIN marts.dim_sellers s
        ON f.seller_id = s.seller_id
    JOIN marts.dim_products p
        ON f.product_id = p.product_id
    GROUP BY
        s.seller_id,
        p.product_category
)
SELECT
    seller_id,
    product_category,
    category_revenue
FROM seller_category_revenue
WHERE revenue_rank = 1
ORDER BY
    category_revenue DESC;


-- ============================================================
-- 3. DELIVERY PERFORMANCE VS REVENUE (CORRELATION ANALYSIS)
-- ============================================================
-- Examines whether faster delivery correlates with revenue
-- ============================================================

SELECT
    p.product_category,
    ROUND(AVG(DATEDIFF(f.delivery_date, f.order_date)), 2) AS avg_delivery_days,
    SUM(f.revenue) AS total_revenue
FROM marts.fact_orders f
JOIN marts.dim_products p
    ON f.product_id = p.product_id
WHERE f.delivery_date IS NOT NULL
GROUP BY
    p.product_category
ORDER BY
    avg_delivery_days ASC;


-- ============================================================
-- 4. PAYMENT METHOD DISTRIBUTION ACROSS PRODUCT CATEGORIES
-- ============================================================
-- Multi-dimensional join: payment × product category
-- ============================================================

SELECT
    COALESCE(NULLIF(p.product_category, ''), 'unknown') AS product_category,
    pay.payment_type,
    COUNT(DISTINCT f.order_id) AS total_orders,
    SUM(f.revenue) AS total_revenue
FROM marts.fact_orders f
JOIN marts.dim_products p
    ON f.product_id = p.product_id
JOIN marts.dim_payments pay
    ON f.order_id = pay.order_id
GROUP BY
    COALESCE(NULLIF(p.product_category, ''), 'unknown'),
    pay.payment_type
ORDER BY
    product_category,
    total_revenue DESC;



-- ============================================================
-- 5. CUSTOMER STATES WITH HIGH REVENUE BUT SLOW DELIVERY
-- ============================================================
-- Identifies high-value regions with logistics issues
-- ============================================================

SELECT
    c.customer_state,
    SUM(f.revenue) AS total_revenue,
    ROUND(AVG(DATEDIFF(f.delivery_date, f.order_date)), 2) AS avg_delivery_days
FROM marts.fact_orders f
JOIN marts.dim_customers c
    ON f.customer_id = c.customer_id
WHERE f.delivery_date IS NOT NULL
GROUP BY
    c.customer_state
HAVING
    AVG(DATEDIFF(f.delivery_date, f.order_date)) > 10
ORDER BY
    total_revenue DESC;


-- ============================================================
-- 6. SELLER CONTRIBUTION TO TOTAL REVENUE (PERCENTAGE SHARE)
-- ============================================================
-- Shows how much each seller contributes to total revenue
-- ============================================================

WITH total_revenue_cte AS (
    SELECT SUM(revenue) AS total_revenue
    FROM marts.fact_orders
)
SELECT
    s.seller_id,
    SUM(f.revenue) AS seller_revenue,
    ROUND(
        (SUM(f.revenue) / tr.total_revenue) * 100,
        2
    ) AS revenue_percentage
FROM marts.fact_orders f
JOIN marts.dim_sellers s
    ON f.seller_id = s.seller_id
CROSS JOIN total_revenue_cte tr
GROUP BY
    s.seller_id,
    tr.total_revenue
ORDER BY
    revenue_percentage DESC;
