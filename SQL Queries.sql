Find NULL Values
SELECT *
FROM superstore
WHERE sales IS NULL
   OR profit IS NULL;
Find Duplicate Records
SELECT order_id,
       COUNT(*) AS duplicate_count
FROM superstore
GROUP BY order_id
HAVING COUNT(*) > 1;
SQL Analysis Performed
Total Sales & Profit
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore;
Category Performance
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category;
Loss-Making Categories
SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
HAVING SUM(profit) < 0;
Top Loss-Making Products
SELECT
    product_name,
    profit,
    RANK() OVER(ORDER BY profit ASC) AS loss_rank
FROM superstore;
CTE Example
WITH category_profit AS
(
    SELECT
        category,
        SUM(profit) AS total_profit
    FROM superstore
    GROUP BY category
)
SELECT *
FROM category_profit
WHERE total_profit < 0;

