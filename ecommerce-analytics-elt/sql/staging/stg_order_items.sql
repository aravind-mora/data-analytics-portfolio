-- ============================================================
-- STAGING: ORDER ITEMS
-- Prepares order-item level data and derives revenue components
-- ============================================================

CREATE TABLE staging.stg_order_items AS
SELECT
    order_id,
    product_id,
    seller_id,
    price,
    freight_value,
    price + freight_value AS total_item_value
FROM raw.order_items
WHERE price > 0;
