-- ============================================================
-- STAGING: PRODUCTS
-- Standardizes product categories using translation mapping
-- ============================================================

CREATE TABLE staging.stg_products AS
SELECT
    p.product_id,
    COALESCE(t.product_category_name_english, p.product_category_name)
        AS product_category,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM raw.products p
LEFT JOIN raw.product_category_translation t
    ON p.product_category_name = t.product_category_name;
