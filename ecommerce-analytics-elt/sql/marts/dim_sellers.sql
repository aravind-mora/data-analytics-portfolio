-- ============================================================
-- DIMENSION: SELLERS
-- Seller identity and location attributes
-- ============================================================

CREATE TABLE marts.dim_sellers AS
SELECT DISTINCT
    seller_id,
    seller_city,
    seller_state
FROM staging.stg_sellers;
