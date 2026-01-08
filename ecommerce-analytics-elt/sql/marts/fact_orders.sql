-- ============================================================
-- FACT: ORDERS
-- Grain: one row per order item
-- Contains revenue and fulfillment metrics
-- ============================================================

CREATE TABLE marts.fact_orders AS
SELECT
    o.order_id,
    o.customer_id,
    i.product_id,
    i.seller_id,

    DATE(o.order_purchase_ts) AS order_date,
    DATE(o.delivered_customer_ts) AS delivery_date,

    i.price,
    i.freight_value,
    i.total_item_value AS revenue,

    p.total_payment_value,
    o.order_status
FROM staging.stg_orders o
JOIN staging.stg_order_items i
    ON o.order_id = i.order_id
LEFT JOIN staging.stg_payments p
    ON o.order_id = p.order_id;
