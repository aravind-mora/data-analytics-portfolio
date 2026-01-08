-- ============================================================
-- STAGING: PAYMENTS
-- Aggregates payment values at order and payment-type level
-- ============================================================

CREATE TABLE staging.stg_payments AS
SELECT
    order_id,
    payment_type,
    SUM(payment_value) AS total_payment_value
FROM raw.payments
GROUP BY order_id, payment_type;
