-- 96. Create index on product_name

CREATE INDEX idx_product_name
ON products(product_name);


-- 97. Create index on customer_email

CREATE INDEX idx_customer_email
ON customers(email);


-- 98. Compare performance

EXPLAIN
SELECT *
FROM products
WHERE product_name='Laptop';


-- 99. EXPLAIN ANALYZE revenue report

EXPLAIN ANALYZE
SELECT p.category_id,
SUM(oi.quantity*oi.unit_price)
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.category_id;


-- 100. Optimize highest-selling-product query

EXPLAIN
SELECT product_id,
SUM(quantity)
FROM order_items
GROUP BY product_id
ORDER BY SUM(quantity) DESC
LIMIT 1;
