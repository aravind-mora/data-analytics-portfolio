/* =========================================================
   SALES PERFORMANCE ANALYSIS
   Dataset: Global Superstore
   Purpose: Business-driven SQL analysis
   ========================================================= */


/* ---------------------------------------------------------
   1. Overall Business Metrics
   --------------------------------------------------------- */
-- Overall sales, profit, and total orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore;


/* ---------------------------------------------------------
   2. Regional Sales Performance
   --------------------------------------------------------- */
-- Total sales by region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


/* ---------------------------------------------------------
   3. Category-wise Sales Analysis
   --------------------------------------------------------- */
-- Total sales by product category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


/* ---------------------------------------------------------
   4. Profit Analysis by Sub-Category
   --------------------------------------------------------- */
-- Identifying most and least profitable sub-categories
SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC;


/* ---------------------------------------------------------
   5. Monthly Sales Trend
   --------------------------------------------------------- */
-- Month-wise sales trend to identify seasonality
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM superstore
GROUP BY year, month
ORDER BY year, month;


/* ---------------------------------------------------------
   6. Top Revenue-Contributing Sub-Categories
   --------------------------------------------------------- */
-- Top 5 sub-categories by total sales
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 5;


/* ---------------------------------------------------------
   7. Sales vs Profit Comparison (Margin Risk)
   --------------------------------------------------------- */
-- Categories with high sales but low profit
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category;


/* ---------------------------------------------------------
   8. Discount Impact Analysis
   --------------------------------------------------------- */
-- Impact of discount levels on total profit
SELECT
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY discount
ORDER BY discount;


/* ---------------------------------------------------------
   9. Profit Margin Analysis
   --------------------------------------------------------- */
-- Profit margin percentage by category
SELECT
    category,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM superstore
GROUP BY category
ORDER BY profit_margin_percent DESC;


/* ---------------------------------------------------------
   10. Operational Efficiency by Region
   --------------------------------------------------------- */
-- Average profit per order by region
SELECT
    region,
    ROUND(SUM(profit) / COUNT(DISTINCT order_id), 2) AS avg_profit_per_order
FROM superstore
GROUP BY region
ORDER BY avg_profit_per_order DESC;


/* ---------------------------------------------------------
   11. Discount Bucket Analysis (Business Segmentation)
   --------------------------------------------------------- */
-- Grouping discounts to analyze profit behavior
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount BETWEEN 0.01 AND 0.20 THEN 'Low Discount'
        WHEN discount BETWEEN 0.21 AND 0.40 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_bucket,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY discount_bucket
ORDER BY total_profit DESC;


/* ---------------------------------------------------------
   12. Loss-Making Sub-Categories
   --------------------------------------------------------- */
-- Identifying sub-categories contributing to losses
SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING total_profit < 0
ORDER BY total_profit;


/* ---------------------------------------------------------
   13. Customer Segment Performance
   --------------------------------------------------------- */
-- Sales and profit contribution by customer segment
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(profit), 2) AS avg_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;


/* ---------------------------------------------------------
   14. Year-over-Year Sales Growth (Advanced)
   --------------------------------------------------------- */
-- Year-over-year sales growth using window functions
SELECT
    year,
    yearly_sales,
    COALESCE(
        ROUND(
            (yearly_sales - prev_year_sales) / prev_year_sales * 100,
            2
        ),
        0
    ) AS yoy_growth_percent
FROM (
    SELECT
        YEAR(order_date) AS year,
        ROUND(SUM(sales), 2) AS yearly_sales,
        LAG(ROUND(SUM(sales), 2)) OVER (ORDER BY YEAR(order_date)) AS prev_year_sales
    FROM superstore
    GROUP BY YEAR(order_date)
) t;
