-- 91. Place order transaction

START TRANSACTION;

INSERT INTO orders(customer_id, order_date, order_status, total_amount)
VALUES (1, CURDATE(), 'Placed', 5000);

INSERT INTO payments(order_id, payment_date, payment_method, payment_status, amount)
VALUES (1, CURDATE(), 'UPI', 'Completed', 5000);

INSERT INTO shipments(order_id, shipment_date, shipment_status)
VALUES (1, CURDATE(), 'Processing');

COMMIT;


-- 92. Rollback failed payment

START TRANSACTION;

INSERT INTO payments(order_id, payment_date, payment_method, payment_status, amount)
VALUES (2, CURDATE(), 'Card', 'Failed', 2500);

ROLLBACK;


-- 93. SAVEPOINT example

START TRANSACTION;

SAVEPOINT before_payment;

INSERT INTO payments(order_id, payment_date, payment_method, payment_status, amount)
VALUES (3, CURDATE(), 'UPI', 'Pending', 3000);

ROLLBACK TO before_payment;

COMMIT;


-- 94. COMMIT after successful order

START TRANSACTION;

UPDATE orders
SET order_status='Completed'
WHERE order_id=1;

COMMIT;


-- 95. Stock deduction transaction

START TRANSACTION;

UPDATE products
SET stock_quantity=stock_quantity-2
WHERE product_id=1;

COMMIT;
