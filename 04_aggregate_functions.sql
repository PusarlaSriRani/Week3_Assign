
                    -- Total customers

SELECT COUNT(*) AS total_customers
FROM customers;



                    -- Total products

SELECT COUNT(*) AS total_products
FROM products;



                    -- Average product price

SELECT AVG(price) AS average_price
FROM products;



                    -- Highest priced product

SELECT MAX(price) AS highest_price
FROM products;



                    -- Lowest priced product

SELECT MIN(price) AS lowest_price
FROM products;



                    -- Total revenue generated

SELECT SUM(total_amount) AS total_revenue
FROM orders;



                    -- Total orders placed

SELECT COUNT(order_id) AS total_orders
FROM orders;



                    -- Total stock available

SELECT SUM(stock_quantity) AS total_stock
FROM products;



                    -- Average order value

SELECT AVG(total_amount) AS average_order_value
FROM orders;



                    -- Total payment received

SELECT SUM(amount) AS total_payment
FROM payments;
