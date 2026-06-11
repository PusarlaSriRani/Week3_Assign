-- 101. Amazon-style Sales Dashboard

SELECT
COUNT(order_id) total_orders,
SUM(total_amount) total_sales,
AVG(total_amount) average_order_value
FROM orders;


-- 102. Top 10 Products Report

SELECT product_id,
SUM(quantity) total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;


-- 103. Customer Lifetime Value Report

SELECT customer_id,
SUM(total_amount) lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC;


-- 104. Product Recommendation Query

SELECT product_id,
AVG(rating) avg_rating
FROM reviews
GROUP BY product_id
ORDER BY avg_rating DESC
LIMIT 5;


-- 105. Repeat Customer Analysis

SELECT customer_id,
COUNT(order_id) total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id)>1;


-- 106. Inventory Aging Report

SELECT product_id,
product_name,
stock_quantity
FROM products
ORDER BY stock_quantity DESC;


-- 107. Supplier Performance Dashboard

SELECT supplier_id,
COUNT(product_id) total_products
FROM products
GROUP BY supplier_id;


-- 108. Monthly Growth Report

SELECT
MONTH(order_date) month,
SUM(total_amount) monthly_sales
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;


-- 109. Revenue Forecast Dataset

SELECT
MONTH(order_date) month,
SUM(total_amount) revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;


-- 110. Complete Business KPI Dashboard

WITH sales AS (
    SELECT SUM(total_amount) total_sales
    FROM orders
),
customers AS (
    SELECT COUNT(*) total_customers
    FROM customers
),
products AS (
    SELECT COUNT(*) total_products
    FROM products
)
SELECT *
FROM sales,
customers,
products;
