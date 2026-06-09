
                    -- Categories having more than 20 products

SELECT category_id,
COUNT(product_id) AS total_products
FROM products
GROUP BY category_id
HAVING COUNT(product_id) > 20;



                    -- Suppliers supplying more than 10 products

SELECT supplier_id,
COUNT(product_id) AS total_products
FROM products
GROUP BY supplier_id
HAVING COUNT(product_id) > 10;



                    -- Customers having more than 5 orders

SELECT customer_id,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;



                    -- Products having average rating above 4

SELECT product_id,
AVG(rating) AS average_rating
FROM reviews
GROUP BY product_id
HAVING AVG(rating) > 4;



                    -- Cities with more than 50 customers

SELECT city,
COUNT(customer_id) AS total_customers
FROM addresses
GROUP BY city
HAVING COUNT(customer_id) > 50;
