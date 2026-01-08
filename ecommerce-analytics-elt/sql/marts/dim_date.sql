-- ============================================================
-- DIMENSION: DATE
-- Derived date attributes from order purchase timestamp
-- ============================================================

CREATE TABLE marts.dim_date AS
SELECT DISTINCT
    order_purchase_ts AS date_value,
    YEAR(order_purchase_ts) AS year,
    MONTH(order_purchase_ts) AS month,
    DAY(order_purchase_ts) AS day,
    DAYNAME(order_purchase_ts) AS weekday
FROM staging.stg_orders
WHERE order_purchase_ts IS NOT NULL;
