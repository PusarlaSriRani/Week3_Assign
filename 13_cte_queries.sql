-- 81. Category-wise revenue using CTE

WITH category_revenue AS (
    SELECT p.category_id,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.category_id
)
SELECT * FROM category_revenue;


-- 82. Customer spending summary using CTE

WITH customer_spending AS (
    SELECT customer_id,
           SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT * FROM customer_spending;


-- 83. Top 10 customers using CTE

WITH customer_total AS (
    SELECT customer_id,
           SUM(total_amount) AS spending
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_total
ORDER BY spending DESC
LIMIT 10;


-- 84. Top products using CTE

WITH product_sales AS (
    SELECT product_id,
           SUM(quantity) AS total_sales
    FROM order_items
    GROUP BY product_id
)
SELECT *
FROM product_sales
ORDER BY total_sales DESC
LIMIT 10;


-- 85. Supplier performance report using CTE

WITH supplier_report AS (
    SELECT p.supplier_id,
           COUNT(p.product_id) AS total_products,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM products p
    JOIN order_items oi
    ON p.product_id = oi.product_id
    GROUP BY p.supplier_id
)
SELECT *
FROM supplier_report
ORDER BY revenue DESC;
