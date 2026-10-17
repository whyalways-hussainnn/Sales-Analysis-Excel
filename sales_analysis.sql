-- Sales Analysis Portfolio Project
-- Dialect: PostgreSQL
-- Import data/sales_data.csv into a table named sales_data.

-- 1. KPI overview
SELECT
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(revenue)::numeric, 2) AS total_revenue,
  ROUND(SUM(profit)::numeric, 2) AS total_profit,
  ROUND((SUM(profit) / NULLIF(SUM(revenue), 0) * 100)::numeric, 2) AS profit_margin_pct,
  ROUND((SUM(revenue) / NULLIF(COUNT(DISTINCT order_id), 0))::numeric, 2) AS avg_revenue_per_order
FROM sales_data;

-- 2. Revenue by category
SELECT category, SUM(revenue) AS revenue, SUM(profit) AS profit
FROM sales_data
GROUP BY category
ORDER BY revenue DESC;

-- 3. Monthly trend
SELECT DATE_TRUNC('month', order_date)::date AS month,
       SUM(revenue) AS revenue,
       SUM(profit) AS profit,
       COUNT(DISTINCT order_id) AS orders
FROM sales_data
GROUP BY 1
ORDER BY 1;

-- 4. Region performance
SELECT region, SUM(revenue) AS revenue, SUM(profit) AS profit
FROM sales_data
GROUP BY region
ORDER BY revenue DESC;

-- 5. Top products
SELECT product, category, SUM(quantity) AS units_sold,
       SUM(revenue) AS revenue, SUM(profit) AS profit
FROM sales_data
GROUP BY product, category
ORDER BY revenue DESC
LIMIT 10;

-- 6. Cumulative monthly revenue using a window function
WITH monthly AS (
  SELECT DATE_TRUNC('month', order_date)::date AS month,
         SUM(revenue) AS revenue
  FROM sales_data
  GROUP BY 1
)
SELECT month, revenue,
       SUM(revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM monthly
ORDER BY month;
