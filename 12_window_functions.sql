-- 71. Rank products by revenue
SELECT product_id,
SUM(quantity * unit_price) revenue,
RANK() OVER(ORDER BY SUM(quantity * unit_price) DESC) product_rank
FROM order_items
GROUP BY product_id;

-- 72. Rank customers by spending
SELECT customer_id,
SUM(total_amount) spending,
RANK() OVER(ORDER BY SUM(total_amount) DESC) customer_rank
FROM orders
GROUP BY customer_id;

-- 73. Rank suppliers by sales
SELECT supplier_id,
SUM(quantity * unit_price) sales,
RANK() OVER(ORDER BY SUM(quantity * unit_price) DESC) supplier_rank
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY supplier_id;

-- 74. Top 3 products per category
SELECT * FROM
(
SELECT product_name,
category_id,
price,
ROW_NUMBER() OVER(PARTITION BY category_id ORDER BY price DESC) rn
FROM products
)t
WHERE rn<=3;

-- 75. Top 5 customers per city
SELECT *
FROM
(
SELECT c.customer_name,
a.city,
SUM(o.total_amount) spending,
ROW_NUMBER() OVER(PARTITION BY a.city ORDER BY SUM(o.total_amount) DESC) rn
FROM customers c
JOIN addresses a
ON c.customer_id=a.customer_id
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name,a.city
)t
WHERE rn<=5;

-- 76. Running total revenue
SELECT order_date,
SUM(total_amount) revenue,
SUM(total_amount) OVER(ORDER BY order_date) running_total
FROM orders;

-- 77. Cumulative monthly sales
SELECT MONTH(order_date) month,
SUM(total_amount),
SUM(SUM(total_amount))
OVER(ORDER BY MONTH(order_date))
FROM orders
GROUP BY MONTH(order_date);

-- 78. Highest order per customer
SELECT * FROM
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY total_amount DESC) rn
FROM orders
)t
WHERE rn=1;

-- 79. Latest order per customer
SELECT * FROM
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) rn
FROM orders
)t
WHERE rn=1;

-- 80. Top-rated product in each category
SELECT * FROM
(
SELECT p.product_name,
p.category_id,
AVG(r.rating) rating,
ROW_NUMBER() OVER(PARTITION BY p.category_id ORDER BY AVG(r.rating) DESC) rn
FROM products p
JOIN reviews r
ON p.product_id=r.product_id
GROUP BY p.product_name,p.category_id
)t
WHERE rn=1;
