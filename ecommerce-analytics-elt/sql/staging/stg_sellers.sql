-- ============================================================
-- STAGING: SELLERS
-- Prepares seller dimension attributes
-- ============================================================

CREATE TABLE staging.stg_sellers AS
SELECT
    seller_id,
    seller_city,
    seller_state
FROM raw.sellers;
