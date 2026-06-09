
                    -- Number of products category-wise

SELECT category_id,
COUNT(product_id) AS total_products
FROM products
GROUP BY category_id

                    -- Total sales category-wise

SELECT p.category_id,
SUM(o.total_amount) AS total_sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category_id;

                    -- Total revenue supplier-wise

SELECT supplier_id,
SUM(price * stock_quantity) AS revenue
FROM products
GROUP BY supplier_id;

                    -- Customer count city-wise

SELECT city,
COUNT(customer_id) AS total_customers
FROM addresses
GROUP BY city;

                    -- Order count status-wise

SELECT order_status,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status;

                    -- Average rating product-wise

SELECT product_id,
AVG(rating) AS average_rating
FROM reviews
GROUP BY product_id;

                    -- Total products supplier-wise

SELECT supplier_id,
COUNT(product_id) AS total_products
FROM products
GROUP BY supplier_id;

                    -- Shipment count status-wise

SELECT shipment_status,
COUNT(shipment_id) AS total_shipments
FROM shipments
GROUP BY shipment_status;

                    -- Total payments method-wise

SELECT payment_method,
SUM(amount) AS total_payment
FROM payments
GROUP BY payment_method;

                    -- Monthly sales report

SELECT EXTRACT(MONTH FROM order_date) AS month,
SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month;
