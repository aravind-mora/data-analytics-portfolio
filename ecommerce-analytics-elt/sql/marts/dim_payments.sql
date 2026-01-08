-- ============================================================
-- DIMENSION: PAYMENTS
-- Payment methods used per order
-- ============================================================

CREATE TABLE marts.dim_payments AS
SELECT DISTINCT
    order_id,
    payment_type
FROM staging.stg_payments;
