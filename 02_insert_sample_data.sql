INSERT INTO customers
(customer_name, email, phone, registration_date)
VALUES
('Arjun Kumar', 'arjun@gmail.com', '9876543210', '2025-01-10'),
('Priya Sharma', 'priya@gmail.com', '9876543211', '2025-02-15'),
('Rahul Verma', 'rahul@gmail.com', '9876543212', '2025-03-20'),
('Sneha Reddy', 'sneha@gmail.com', '9876543213', '2025-04-05'),
('Kiran Rao', 'kiran@gmail.com', '9876543214', '2025-05-01');

                    -- =========================

INSERT INTO addresses
(customer_id, address_type, city, state, pincode)
VALUES
(1, 'Home', 'Hyderabad', 'Telangana', '500001'),
(2, 'Office', 'Bangalore', 'Karnataka', '560001'),
(3, 'Home', 'Chennai', 'Tamil Nadu', '600001'),
(4, 'Office', 'Vijayawada', 'Andhra Pradesh', '520001'),
(5, 'Home', 'Mumbai', 'Maharashtra', '400001');
                    -- =========================

INSERT INTO categories
(category_name, parent_category_id)
VALUES
('Electronics', NULL),
('Mobiles', 1),
('Laptops', 1),
('Fashion', NULL),
('Shoes', 4);
                    -- =========================

INSERT INTO suppliers
(supplier_name, email, phone)
VALUES
('ABC Suppliers', 'abc@gmail.com', '9000000001'),
('Tech World', 'tech@gmail.com', '9000000002'),
('Fashion Hub', 'fashion@gmail.com', '9000000003');

                    -- =========================

INSERT INTO products
(product_name, description, price, stock_quantity, category_id, supplier_id)
VALUES
('iPhone 15', 'Apple Mobile', 75000, 15, 2, 1),
('Samsung S24', 'Android Mobile', 68000, 20, 2, 2),
('Dell Laptop', 'Gaming Laptop', 85000, 8, 3, 2),
('Nike Shoes', 'Sports Shoes', 4500, 30, 5, 3),
('Puma Shoes', 'Running Shoes', 3500, 25, 5, 3);
                    -- =========================

INSERT INTO orders
(customer_id, order_date, order_status, total_amount)
VALUES
(1, '2025-06-01', 'Completed', 75000),
(2, '2025-06-02', 'Pending', 68000),
(3, '2025-06-03', 'Completed', 85000),
(4, '2025-06-04', 'Shipped', 4500),
(5, '2025-06-05', 'Completed', 3500);

                    -- =========================

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 75000),
(2, 2, 1, 68000),
(3, 3, 1, 85000),
(4, 4, 1, 4500),
(5, 5, 1, 3500);
                    -- =========================

INSERT INTO payments
(order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1, '2025-06-01', 'UPI', 'Success', 75000),
(2, '2025-06-02', 'Card', 'Pending', 68000),
(3, '2025-06-03', 'Net Banking', 'Success', 85000),
(4, '2025-06-04', 'Cash', 'Success', 4500),
(5, '2025-06-05', 'UPI', 'Success', 3500);

                    -- =========================

INSERT INTO shipments
(order_id, shipment_date, delivery_date, shipment_status)
VALUES
(1, '2025-06-02', '2025-06-05', 'Delivered'),
(2, '2025-06-03', NULL, 'Processing'),
(3, '2025-06-04', '2025-06-07', 'Delivered'),
(4, '2025-06-05', '2025-06-08', 'Shipped'),
(5, '2025-06-06', '2025-06-09', 'Delivered');

                    -- =========================

INSERT INTO reviews
(customer_id, product_id, rating, review_text)
VALUES
(1, 1, 5, 'Excellent Product'),
(2, 2, 4, 'Very Good'),
(3, 3, 5, 'Amazing Laptop'),
(4, 4, 4, 'Comfortable Shoes'),
(5, 5, 5, 'Worth Buying');

                    -- =========================

INSERT INTO wishlist
(customer_id, product_id)
VALUES
(1, 3),
(2, 1),
(3, 4),
(4, 2),
(5, 5);
                    -- =========================

INSERT INTO cart
(customer_id)
VALUES
(1),
(2),
(3),
(4),
(5);
                    -- =========================

INSERT INTO cart_items
(cart_id, product_id, quantity)
VALUES
(1, 2, 1),
(2, 1, 2),
(3, 5, 1),
(4, 4, 2),
(5, 3, 1);
                    -- =======================

INSERT INTO employees
(employee_name, manager_id, salary, designation)
VALUES
('Rajesh', NULL, 90000, 'Manager'),
('Anil', 1, 60000, 'Team Lead'),
('Kavya', 2, 45000, 'Developer'),
('Rohit', 2, 42000, 'Developer'),
('Pooja', 1, 50000, 'HR');
