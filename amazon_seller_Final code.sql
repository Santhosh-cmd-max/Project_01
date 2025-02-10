CREATE DATABASE AmazonSellerPerformanceDashboard;
USE AmazonSellerPerformanceDashboard;

-- Sellers 
CREATE TABLE sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_name VARCHAR(100) NOT NULL,
    seller_city VARCHAR(50) NOT NULL,
    seller_state VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL
);

-- Products 
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    seller_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50) NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

-- Orders 
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    delivery_city VARCHAR(50) NOT NULL,
    delivery_state VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Reviews 
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments 
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO sellers (seller_name, seller_city, seller_state, registration_date) VALUES
('Arjun Reddy', 'Chennai', 'Tamil Nadu', '2022-01-15'),
('Kavya Srinivasan', 'Bengaluru', 'Karnataka', '2022-02-10'),
('Rajesh Pillai', 'Thiruvananthapuram', 'Kerala', '2022-03-05'),
('Priya Menon', 'Coimbatore', 'Tamil Nadu', '2022-04-20'),
('Suresh Kumar', 'Hyderabad', 'Telangana', '2022-05-12'),
('Ananya Rao', 'Vijayawada', 'Andhra Pradesh', '2022-06-18'),
('Vijayalakshmi', 'Mysuru', 'Karnataka', '2022-07-22'),
('Gopalakrishnan', 'Kochi', 'Kerala', '2022-08-30'),
('Meera Iyer', 'Madurai', 'Tamil Nadu', '2022-09-14'),
('Ramesh Nair', 'Visakhapatnam', 'Andhra Pradesh', '2022-10-25'),
('Lakshmi Devi', 'Tiruchirappalli', 'Tamil Nadu', '2022-11-11'),
('Siddharth Menon', 'Kozhikode', 'Kerala', '2022-12-03'),
('Deepa Rajan', 'Hubli', 'Karnataka', '2023-01-07'),
('Karthik Reddy', 'Warangal', 'Telangana', '2023-02-19'),
('Shalini Nair', 'Salem', 'Tamil Nadu', '2023-03-22'),
('Manoj Pillai', 'Thrissur', 'Kerala', '2023-04-15'),
('Swathi Rao', 'Guntur', 'Andhra Pradesh', '2023-05-10'),
('Harish Kumar', 'Mangaluru', 'Karnataka', '2023-06-05'),
('Divya Iyer', 'Tirunelveli', 'Tamil Nadu', '2023-07-18'),
('Anand Srinivasan', 'Kannur', 'Kerala', '2023-08-21');

INSERT INTO products (product_name, seller_id, price, category) VALUES
('Silk Saree', 1, 2500.00, 'Clothing'),
('Spice Box', 2, 500.00, 'Kitchen'),
('Handmade Soap', 3, 200.00, 'Personal Care'),
('Wooden Toys', 4, 800.00, 'Toys'),
('Jute Bags', 5, 300.00, 'Accessories'),
('Coconut Oil', 6, 150.00, 'Health'),
('Brass Lamps', 7, 1200.00, 'Home Decor'),
('Banana Chips', 8, 100.00, 'Snacks'),
('Terracotta Pots', 9, 400.00, 'Gardening'),
('Cotton Kurtas', 10, 700.00, 'Clothing'),
('Ayurvedic Tea', 11, 250.00, 'Health'),
('Bamboo Furniture', 12, 3000.00, 'Furniture'),
('Incense Sticks', 13, 50.00, 'Home Decor'),
('Rice Flour', 14, 80.00, 'Groceries'),
('Leather Wallets', 15, 600.00, 'Accessories'),
('Herbal Shampoo', 16, 180.00, 'Personal Care'),
('Papadams', 17, 120.00, 'Snacks'),
('Clay Idols', 18, 900.00, 'Home Decor'),
('Silk Scarves', 19, 350.00, 'Clothing'),
('Coffee Powder', 20, 200.00, 'Beverages');

INSERT INTO orders (product_id, customer_name, order_date, delivery_city, delivery_state, quantity) VALUES
(1, 'Ravi Kumar', '2023-01-10', 'Chennai', 'Tamil Nadu', 2),
(2, 'Priya Nair', '2023-02-15', 'Bengaluru', 'Karnataka', 1),
(3, 'Suresh Menon', '2023-03-20', 'Thiruvananthapuram', 'Kerala', 3),
(4, 'Anjali Rao', '2023-04-25', 'Coimbatore', 'Tamil Nadu', 1),
(5, 'Vijay Reddy', '2023-05-30', 'Hyderabad', 'Telangana', 2),
(6, 'Deepa Iyer', '2023-06-05', 'Vijayawada', 'Andhra Pradesh', 4),
(7, 'Karthik Pillai', '2023-07-10', 'Mysuru', 'Karnataka', 1),
(8, 'Lakshmi Devi', '2023-08-15', 'Kochi', 'Kerala', 2),
(9, 'Rajesh Nair', '2023-09-20', 'Madurai', 'Tamil Nadu', 3),
(10, 'Swathi Menon', '2023-10-25', 'Visakhapatnam', 'Andhra Pradesh', 1),
(11, 'Arjun Rao', '2023-11-30', 'Tiruchirappalli', 'Tamil Nadu', 2),
(12, 'Kavya Reddy', '2023-12-05', 'Kozhikode', 'Kerala', 1),
(13, 'Siddharth Kumar', '2024-01-10', 'Hubli', 'Karnataka', 3),
(14, 'Meera Pillai', '2024-02-15', 'Warangal', 'Telangana', 2),
(15, 'Harish Nair', '2024-03-20', 'Salem', 'Tamil Nadu', 1),
(16, 'Divya Menon', '2024-04-25', 'Thrissur', 'Kerala', 4),
(17, 'Anand Rao', '2024-05-30', 'Guntur', 'Andhra Pradesh', 2),
(18, 'Shalini Reddy', '2024-06-05', 'Mangaluru', 'Karnataka', 1),
(19, 'Manoj Iyer', '2024-07-10', 'Tirunelveli', 'Tamil Nadu', 3),
(20, 'Gopalakrishnan', '2024-08-15', 'Kannur', 'Kerala', 2);

INSERT INTO reviews (product_id, customer_name, rating, review_text, review_date) VALUES
(1, 'Ravi Kumar', 5, 'Excellent quality saree!', '2023-01-12'),
(2, 'Priya Nair', 4, 'Good spice box, but delivery was late.', '2023-02-17'),
(3, 'Suresh Menon', 3, 'Average product.', '2023-03-22'),
(4, 'Anjali Rao', 5, 'Beautiful wooden toys!', '2023-04-27'),
(5, 'Vijay Reddy', 4, 'Nice jute bags.', '2023-05-31'),
(6, 'Deepa Iyer', 5, 'Pure coconut oil.', '2023-06-07'),
(7, 'Karthik Pillai', 2, 'Lamps were damaged.', '2023-07-12'),
(8, 'Lakshmi Devi', 5, 'Tasty banana chips.', '2023-08-17'),
(9, 'Rajesh Nair', 4, 'Good pots for gardening.', '2023-09-22'),
(10, 'Swathi Menon', 3, 'Average kurtas.', '2023-10-27'),
(11, 'Arjun Rao', 5, 'Loved the tea!', '2023-12-01'),
(12, 'Kavya Reddy', 4, 'Good furniture.', '2023-12-07'),
(13, 'Siddharth Kumar', 5, 'Nice incense sticks.', '2024-01-12'),
(14, 'Meera Pillai', 3, 'Rice flour was okay.', '2024-02-17'),
(15, 'Harish Nair', 5, 'Great wallets!', '2024-03-22'),
(16, 'Divya Menon', 4, 'Good shampoo.', '2024-04-27'),
(17, 'Anand Rao', 5, 'Crispy papadams.', '2024-05-31'),
(18, 'Shalini Reddy', 2, 'Idols were broken.', '2024-06-07'),
(19, 'Manoj Iyer', 5, 'Beautiful scarves.', '2024-07-12'),
(20, 'Gopalakrishnan', 4, 'Good coffee powder.', '2024-08-17');

INSERT INTO payments (order_id, payment_amount, payment_date, payment_method) VALUES
(1, 5000.00, '2023-01-10', 'Credit Card'),
(2, 500.00, '2023-02-15', 'UPI'),
(3, 600.00, '2023-03-20', 'Debit Card'),
(4, 800.00, '2023-04-25', 'Net Banking'),
(5, 600.00, '2023-05-30', 'UPI'),
(6, 600.00, '2023-06-05', 'Credit Card'),
(7, 1200.00, '2023-07-10', 'Debit Card'),
(8, 200.00, '2023-08-15', 'UPI'),
(9, 1200.00, '2023-09-20', 'Net Banking'),
(10, 700.00, '2023-10-25', 'Credit Card'),
(11, 500.00, '2023-11-30', 'UPI'),
(12, 3000.00, '2023-12-05', 'Debit Card'),
(13, 150.00, '2024-01-10', 'Net Banking'),
(14, 160.00, '2024-02-15', 'Credit Card'),
(15, 600.00, '2024-03-20', 'UPI'),
(16, 720.00, '2024-04-25', 'Debit Card'),
(17, 240.00, '2024-05-30', 'Net Banking'),
(18, 900.00, '2024-06-05', 'Credit Card'),
(19, 1050.00, '2024-07-10', 'UPI'),
(20, 400.00, '2024-08-15', 'Debit Card');

select * from sellers;
select * from products;
select * from orders;
select * from reviews;
select * from payments;

-- total revenue checking
SELECT s.seller_name, pr.product_name, SUM(p.payment_amount) AS total_revenue
FROM sellers s
JOIN products pr ON s.seller_id = pr.seller_id
JOIN orders o ON pr.product_id = o.product_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY s.seller_name, pr.product_name;


-- seller details by ID In Function
DELIMITER //
CREATE PROCEDURE GetSellerDetails(IN sell_id INT)
BEGIN
    SELECT * FROM sellers WHERE seller_id = sell_id;
END //
DELIMITER ;

CALL GetSellerDetails(4);

-- Trigger for payments. status after payment
DELIMITER //
CREATE TRIGGER after_payment_insert
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    UPDATE orders SET payment_status = 'Paid' WHERE order_id = NEW.order_id;
END //
DELIMITER ;

INSERT INTO orders (product_id, customer_name, order_date, delivery_city, delivery_state, quantity) 
VALUES (1, 'John Doe', '2024-02-10', 'New York', 'NY', 2);
update orders
set customer_name = "John cena"
where order_id = 22;
SELECT * FROM orders ORDER BY order_id DESC;

select * from orders;
select * from payments;



-- Dynamic SQL to fetch orders by product category
SET @category = 'Clothing';
SET @query = CONCAT('SELECT * FROM products WHERE category = "', @category, '"');
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- updateing orders and payments info
START TRANSACTION;
UPDATE orders SET quantity = quantity - 1 WHERE order_id = 1;
INSERT INTO payments (order_id, payment_amount, payment_date, payment_method)
VALUES (1, 2500.00, NOW(), 'Credit Card');
COMMIT;

CREATE INDEX idx_product_name ON products(product_name);


-- Pivot table for total sales by category
SELECT category,
       SUM(CASE WHEN seller_state = 'Tamil Nadu' THEN payment_amount ELSE 0 END) AS Tamil_Nadu,
       SUM(CASE WHEN seller_state = 'Karnataka' THEN payment_amount ELSE 0 END) AS Karnataka
FROM products pr
JOIN sellers s ON pr.seller_id = s.seller_id
JOIN orders o ON pr.product_id = o.product_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY category;

-- view for top-selling products
CREATE VIEW top_selling_products AS
SELECT pr.product_name, SUM(p.payment_amount) AS total_sales
FROM products pr
JOIN orders o ON pr.product_id = o.product_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY pr.product_name
ORDER BY total_sales DESC;

select * from top_selling_products;
