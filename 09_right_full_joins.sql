
                    -- All products and corresponding reviews

SELECT p.product_name,
       r.rating
FROM reviews r
RIGHT JOIN products p
ON r.product_id = p.product_id;


                    -- All customers and their orders

SELECT c.customer_name,
       o.order_id
FROM orders o
RIGHT JOIN customers c
ON o.customer_id = c.customer_id;


                    -- All suppliers and products

SELECT s.supplier_name,
       p.product_name
FROM products p
RIGHT JOIN suppliers s
ON p.supplier_id = s.supplier_id;


                    -- All categories and products

SELECT c.category_name,
       p.product_name
FROM products p
RIGHT JOIN categories c
ON p.category_id = c.category_id;


                    -- All orders and shipments

SELECT o.order_id,
       s.shipment_status
FROM orders o
FULL OUTER JOIN shipments s
ON o.order_id = s.order_id;
