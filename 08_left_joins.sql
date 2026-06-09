
                    -- Customers who never placed orders

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

                    -- Products never ordered

SELECT p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

                    -- Products with no reviews

SELECT p.product_name
FROM products p
LEFT JOIN reviews r
ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

                    -- Customers without addresses

SELECT c.customer_name
FROM customers c
LEFT JOIN addresses a
ON c.customer_id = a.customer_id
WHERE a.address_id IS NULL;

                    -- Orders without payments

SELECT o.order_id
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;
