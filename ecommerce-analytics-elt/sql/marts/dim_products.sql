-- ============================================================
-- DIMENSION: PRODUCTS
-- Product category and physical attributes
-- ============================================================

CREATE TABLE marts.dim_products AS
SELECT DISTINCT
    product_id,
    product_category,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM staging.stg_products;
