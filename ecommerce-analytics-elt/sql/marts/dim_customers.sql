-- ============================================================
-- DIMENSION: CUSTOMERS
-- Customer location attributes for analytics
-- ============================================================

CREATE TABLE marts.dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_city,
    customer_state
FROM staging.stg_customers;
