-- ============================================================
-- STAGING: CUSTOMERS
-- Cleans and prepares customer dimension attributes
-- ============================================================

CREATE TABLE staging.stg_customers AS
SELECT
    customer_id,
    customer_city,
    customer_state
FROM raw.customers
WHERE customer_id IS NOT NULL;
