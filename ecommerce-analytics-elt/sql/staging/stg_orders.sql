-- ============================================================
-- STAGING: ORDERS
-- Cleans order lifecycle timestamps and filters invalid orders
-- ============================================================

CREATE TABLE staging.stg_orders AS
SELECT
    order_id,
    customer_id,
    order_status,

    CASE 
        WHEN YEAR(order_purchase_timestamp) < 1900 THEN NULL
        ELSE order_purchase_timestamp
    END AS order_purchase_ts,

    CASE 
        WHEN YEAR(order_delivered_customer_date) < 1900 THEN NULL
        ELSE order_delivered_customer_date
    END AS delivered_customer_ts,

    CASE 
        WHEN YEAR(order_estimated_delivery_date) < 1900 THEN NULL
        ELSE order_estimated_delivery_date
    END AS estimated_delivery_ts

FROM raw.orders
WHERE order_status NOT IN ('canceled', 'unavailable');
