-- 66. Products costing above category average
SELECT *
FROM products p1
WHERE price >
(
    SELECT AVG(price)
    FROM products p2
    WHERE p1.category_id = p2.category_id
);

-- 67. Customers spending above city average
SELECT c.customer_id, c.customer_name
FROM customers c
JOIN addresses a
ON c.customer_id = a.customer_id
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, a.city
HAVING SUM(o.total_amount) >
(
    SELECT AVG(total_amount)
    FROM orders
);

-- 68. Suppliers with revenue above supplier average
SELECT supplier_id
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY supplier_id
HAVING SUM(quantity * unit_price) >
(
    SELECT AVG(total_sales)
    FROM
    (
        SELECT SUM(quantity * unit_price) AS total_sales
        FROM products p2
        JOIN order_items oi2
        ON p2.product_id = oi2.product_id
        GROUP BY supplier_id
    ) x
);

-- 69. Orders larger than customer average
SELECT *
FROM orders o1
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM orders o2
    WHERE o1.customer_id = o2.customer_id
);

-- 70. Products with reviews above product average
SELECT *
FROM reviews r1
WHERE rating >
(
    SELECT AVG(rating)
    FROM reviews r2
    WHERE r1.product_id = r2.product_id
);
