-- 56. Highest selling product
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

-- 57. Second highest selling product
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1 OFFSET 1;

-- 58. Third highest selling product
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1 OFFSET 2;

-- 59. Customer with highest spending
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- 60. Customers spending above average
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) >
(
    SELECT AVG(total_amount)
    FROM orders
);

-- 61. Products priced above average
SELECT *
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);

-- 62. Supplier supplying highest number of products
SELECT supplier_id, COUNT(*) AS total_products
FROM products
GROUP BY supplier_id
ORDER BY total_products DESC
LIMIT 1;

-- 63. Category generating maximum revenue
SELECT p.category_id,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category_id
ORDER BY revenue DESC
LIMIT 1;

-- 64. Customers who ordered every product in a category
SELECT customer_id
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY customer_id;

-- 65. Products never purchased
SELECT *
FROM products
WHERE product_id NOT IN
(
    SELECT product_id
    FROM order_items
);
