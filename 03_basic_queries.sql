                    -- Display all customers

SELECT *
FROM customers;



                    -- Display products costing above ₹5000

SELECT *
FROM products
WHERE price > 5000;



                    -- Display products with stock less than 10

SELECT *
FROM products
WHERE stock_quantity < 10;



                    -- Display all suppliers

SELECT *
FROM suppliers;



                    -- Display all completed orders

SELECT *
FROM orders
WHERE order_status = 'Completed';



                    -- Display orders placed this month

SELECT *
FROM orders
WHERE EXTRACT(MONTH FROM order_date) =
EXTRACT(MONTH FROM CURRENT_DATE);



                    -- Display customers registered in last 30 days

SELECT *
FROM customers
WHERE registration_date >= CURRENT_DATE - INTERVAL '30 days';



                    -- Display products sorted by price descending

SELECT *
FROM products
ORDER BY price DESC;



                    -- Display top 10 expensive products

SELECT *
FROM products
ORDER BY price DESC
LIMIT 10;



                    -- Display all active shipments

SELECT *
FROM shipments
WHERE shipment_status = 'Delivered';
