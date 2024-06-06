CREATE DATABASE IF NOT EXISTS db;
USE db;

CREATE TABLE Customers (
    user_id INT PRIMARY KEY,
    purchase_history TEXT,
    avg_order_value DECIMAL(10, 2),
    credentials TEXT
);

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    num_of_products INT
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    brand VARCHAR(50),
    price DECIMAL(10, 2),
    name VARCHAR(100),
    description TEXT,
    discounts DECIMAL(5, 2),
    customer_id INT,
    review_id INT,
    category_id INT,
    seller_id INT
);

CREATE TABLE Shipping (
    transaction_id INT PRIMARY KEY,
    mode_of_shipping VARCHAR(50),
    quantity INT,
    cart_id INT,
    payment_id INT
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    payment_date DATE,
    cart_id INT,
    shipping_id INT,
    online_payment_id INT,
    offline_payment_id INT,
    seller_id INT
);

CREATE TABLE OnlinePayment (
    transaction_id INT PRIMARY KEY,
    net_banking VARCHAR(50),
    credit_debit_card VARCHAR(50),
    upi VARCHAR(50),
    payment_id INT
);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(50),
    inventory_id INT,
    product_id INT,
    payment_id INT
);

CREATE TABLE Inventory (
    doc_number INT PRIMARY KEY,
    inventory_size VARCHAR(50),
    seller_id INT
);

CREATE TABLE CustomerSupport (
    ticket_number INT PRIMARY KEY,
    compensation DECIMAL(10, 2),
    complaints TEXT,
    user_id INT,
    review_id INT,
    logistics_id INT
);

CREATE TABLE Logistics (
    team_number INT PRIMARY KEY,
    development_metrics DECIMAL(10, 2),
    performance_metrics DECIMAL(10, 2)
);



CREATE TABLE Categories (
    parent_id INT,
    category_id INT,
    category_name VARCHAR(100),
    product_id INT,
    search_id INT
);

-- Inserting sample data into the Categories table
INSERT INTO Categories (parent_id, category_id, category_name, product_id, search_id)
VALUES
    (1, 101, 'Category A', 1, 201),
    (1, 102, 'Category B', 2, 202),
    (2, 201, 'Category C', 3, 203),
    (2, 202, 'Category D', 4, 204);

-- Insert data into Customers table
INSERT INTO Customers (user_id, purchase_history, avg_order_value, credentials)
VALUES
    (1, 'Purchased items A, B, C', 150.00, 'customer1@example.com, password1'),
    (2, 'Purchased items D, E', 200.00, 'customer2@example.com, password2'),
    (3, 'Purchased items F', 100.00, 'customer3@example.com, password3');

-- Insert data into Cart table
INSERT INTO Cart (cart_id, user_id, num_of_products)
VALUES
    (101, 1, 3),
    (102, 1, 2),
    (103, 2, 2),
    (104, 3, 1);INSERT INTO Product (product_id, brand, price, name, description, discounts, customer_id, review_id, category_id, seller_id)
VALUES
    (1, 'Brand A', 999.99, 'Laptop', 'High-performance laptop with advanced features.', 10.00, 1, 1, 1, 1),
    (2, 'Brand B', 499.99, 'Smartphone', 'Latest smartphone with a stunning display.', 5.00, 2, 2, 2, 2),
    (3, 'Brand C', 199.99, 'Headphones', 'Premium noise-canceling headphones for immersive sound experience.', 15.00, 3, 3, 3, 3),
    (4, 'Brand D', 299.99, 'Tablet', 'Lightweight tablet with long battery life.', 8.00, 4, 4, 4, 4);

-- Inserting sample data into the Product table


-- Inserting sample data into the Shipping table
INSERT INTO Shipping (transaction_id, mode_of_shipping, quantity, cart_id, payment_id)
VALUES
    (1, 'Express', 3, 101, 1),
    (2, 'Standard', 2, 102, 2),
    (3, 'Express', 5, 103, 3),
    (4, 'Standard', 1, 104, 4);

-- Inserting sample data into the Payment table
INSERT INTO Payment (payment_id, payment_date, cart_id, shipping_id, online_payment_id, offline_payment_id, seller_id)
VALUES
    (1, '2024-02-27', 101, 1, 1, 1, 1),
    (2, '2024-02-26', 102, 2, 2, 2, 2),
    (3, '2024-02-25', 103, 3, 3, 3, 3),
    (4, '2024-02-24', 104, 4, 4, 4, 4);

-- Inserting sample data into the OnlinePayment table
INSERT INTO OnlinePayment (transaction_id, net_banking, credit_debit_card, upi, payment_id)
VALUES
    (1, 'Yes', 'No', 'Yes', 1),
    (2, 'No', 'Yes', 'No', 2),
    (3, 'Yes', 'Yes', 'Yes', 3),
    (4, 'No', 'No', 'Yes', 4);

-- Inserting sample data into the Seller table
INSERT INTO Seller (seller_id, name, contact, inventory_id, product_id, payment_id)
VALUES
    (1, 'ABC Electronics', '123-456-7890', 101, 1, 1),
    (2, 'XYZ Store', '987-654-3210', 102, 2, 2),
    (3, 'GHI Tech', '456-789-0123', 103, 3, 3);

-- Inserting sample data into the Inventory table
INSERT INTO Inventory (doc_number, inventory_size, seller_id)
VALUES
    (101, 'Large', 1),
    (102, 'Medium', 2),
    (103, 'Small', 3),
    (104, 'Extra Large', 1);

-- Inserting sample data into the CustomerSupport table
INSERT INTO CustomerSupport (ticket_number, compensation, complaints, user_id, review_id, logistics_id)
VALUES
    (1001, 50.00, 'Product arrived damaged', 1, 1, 101),
    (1002, 0.00, 'Delayed delivery', 2, 2, 102),
    (1003, 20.00, 'Wrong item shipped', 3, 3, 103),
    (1004, 10.00, 'Poor customer service experience', 1, 4, 104);

-- Inserting sample data into the Logistics table
INSERT INTO Logistics (team_number, development_metrics, performance_metrics)
VALUES
    (101, 85.5, 90.2),
    (102, 92.3, 88.7),
    (103, 78.9, 85.6),
    (104, 95.1, 93.8);

-- Inserting sample data into the Review table
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    satisfaction_rating DECIMAL(3, 2),
    feedback TEXT,
    product_id INT,
    customer_support_id INT
);

-- Inserting sample data into the Review table
INSERT INTO Review (review_id, satisfaction_rating, feedback, product_id, customer_support_id)
VALUES
    (1, 4.5, 'Great service, very satisfied with the product.', 1, 1001),
    (2, 3.8, 'Product quality could be better, delivery was prompt.', 2, 1002),
    (3, 4.0, 'Excellent customer support, resolved my issue quickly.', 3, 1003),
    (4, 5.0, 'Highly recommended! Everything was perfect.', 4, 1004);

-- Inserting sample data into the Categories table
-- Inserting additional values into the Customers table
INSERT INTO Customers (user_id, purchase_history, avg_order_value, credentials, phone_number)
VALUES
    (4, 'Purchased items G, H', 180.00, 'customer4@example.com, password4', '111-222-3333'),
    (5, 'Purchased items I', 90.00, 'customer5@example.com, password5', '222-333-4444'),
    (6, 'Purchased items J, K', 250.00, 'customer6@example.com, password6', '333-444-5555'),
    (7, 'Purchased items L, M, N', 350.00, 'customer7@example.com, password7', '444-555-6666'),
    (8, 'Purchased items O', 200.00, 'customer8@example.com, password8', '555-666-7777'),
    (9, 'Purchased items P, Q', 300.00, 'customer9@example.com, password9', '666-777-8888');

-- Inserting additional values into the Cart table
INSERT INTO Cart (cart_id, user_id, num_of_products)
VALUES
    (105, 4, 2),
    (106, 5, 3),
    (107, 6, 4),
    (108, 7, 1),
    (109, 8, 2),
    (110, 9, 3);

-- Inserting additional values into the Product table
INSERT INTO Product (product_id, brand, price, name, description, discounts, customer_id, review_id, category_id, seller_id)
VALUES
    (5, 'Brand E', 149.99, 'Smartwatch', 'Fitness tracker with heart rate monitoring.', 12.00, 5, 5, 501, 5),
    (6, 'Brand F', 299.99, 'Camera', 'High-resolution camera for professional photography.', 8.00, 6, 6, 602, 6),
    (7, 'Brand G', 89.99, 'Speaker', 'Portable Bluetooth speaker with long battery life.', 15.00, 7, 7, 701, 7),
    (8, 'Brand H', 199.99, 'Monitor', 'Ultra-wide monitor for immersive gaming experience.', 5.00, 8, 8, 801, 8),
    (9, 'Brand I', 399.99, 'Drone', 'Aerial drone with 4K camera and GPS tracking.', 10.00, 9, 9, 902, 9),
    (10, 'Brand J', 1499.99, 'Gaming Laptop', 'Powerful gaming laptop with dedicated graphics.', 20.00, 4, 10, 1001, 10);

-- Inserting additional values into the Shipping table
INSERT INTO Shipping (transaction_id, mode_of_shipping, quantity, cart_id, payment_id)
VALUES
    (5, 'Express', 2, 105, 5),
    (6, 'Standard', 3, 106, 6),
    (7, 'Express', 4, 107, 7),
    (8, 'Standard', 1, 108, 8),
    (9, 'Express', 2, 109, 9),
    (10, 'Standard', 3, 110, 10);

-- Inserting additional values into the Payment table
INSERT INTO Payment (payment_id, payment_date, cart_id, shipping_id, online_payment_id, offline_payment_id, seller_id)
VALUES
    (5, '2024-03-27', 105, 5, 5, 5, 5),
    (6, '2024-03-26', 106, 6, 6, 6, 6),
    (7, '2024-03-25', 107, 7, 7, 7, 7),
    (8, '2024-03-24', 108, 8, 8, 8, 8),
    (9, '2024-03-23', 109, 9, 9, 9, 9),
    (10, '2024-03-22', 110, 10, 10, 10, 10);

-- Inserting additional values into the OnlinePayment table
INSERT INTO OnlinePayment (transaction_id, net_banking, credit_debit_card, upi, payment_id)
VALUES
    (5, 'No', 'Yes', 'Yes', 5),
    (6, 'Yes', 'No', 'No', 6),
    (7, 'Yes', 'Yes', 'Yes', 7),
    (8, 'No', 'Yes', 'No', 8),
    (9, 'Yes', 'No', 'Yes', 9),
    (10, 'No', 'No', 'Yes', 10);

-- Inserting additional values into the Seller table
INSERT INTO Seller (seller_id, name, contact, inventory_id, product_id, payment_id)
VALUES
    (5, 'LMN Electronics', '222-333-4444', 102, 2, 2),
    (6, 'PQR Store', '333-444-5555', 103, 3, 3),
    (7, 'STU Tech', '444-555-6666', 104, 4, 4),
    (8, 'VWX Electronics', '555-666-7777', 105, 5, 5),
    (9, 'YZ Store', '666-777-8888', 106, 6, 6),
    (10, '123 Tech', '777-888-9999', 107, 7, 7);

-- Inserting additional values into the Inventory table
INSERT INTO Inventory (doc_number, inventory_size, seller_id)
VALUES
    (105, 'Medium', 5),
    (106, 'Large', 6),
    (107, 'Small', 7),
    (108, 'Extra Large', 8),
    (109, 'Medium', 9),
    (110, 'Large', 10);

-- Inserting additional values into the CustomerSupport table
INSERT INTO CustomerSupport (ticket_number, compensation, complaints, user_id, review_id, logistics_id)
VALUES
    (1005, 30.00, 'Late delivery', 4, 5, 105),
    (1006, 15.00, 'Product issue', 5, 6, 106),
    (1007, 25.00, 'Missing accessories', 6, 7, 107),
    (1008, 40.00, 'Poor product quality', 7, 8, 108),
    (1009, 10.00, 'Incorrect item shipped', 8, 9, 109),
    (1010, 20.00, 'Billing discrepancy', 9, 10, 110);

-- Inserting additional values into the Logistics table
INSERT INTO Logistics (team_number, development_metrics, performance_metrics)
VALUES
    (105, 88.2, 92.5),
    (106, 91.3, 89.8),
    (107, 82.5, 87.9),
    (108, 94.7, 90.3),
    (109, 86.9, 88.4),
    (110, 93.2, 91.7);

-- Inserting additional values into the Categories table
INSERT INTO Categories (parent_id, category_id, category_name, product_id, search_id)
VALUES
    (3, 301, 'Category E', 5, 501),
    (3, 302, 'Category F', 6, 602),
    (4, 401, 'Category G', 7, 701),
    (4, 402, 'Category H', 8, 801),
    (1, 103, 'Category I', 9, 902),
    (1, 104, 'Category J', 10, 1001);

-- Inserting additional values into the Review table
INSERT INTO Review (review_id, satisfaction_rating, feedback, product_id, customer_support_id)
VALUES
    (5, 4.2, 'Good product, but could be better.', 5, 1005),
    (6, 3.5, 'Average quality, needs improvement.', 6, 1006),
    (7, 4.8, 'Excellent experience, highly recommended.', 7, 1007),
    (8, 3.9, 'Decent product for the price.', 8, 1008),
    (9, 4.6, 'Great purchase, very satisfied.', 9, 1009),
    (10, 4.0, 'Good features but delivery was delayed.', 10, 1010);


select * from Payment;

-- DDL (Data Definition Language) Queries --
-- Create Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(user_id)
);

-- Alter Table
ALTER TABLE Customers
ADD COLUMN phone_number VARCHAR(15);

-- Drop Table
DROP TABLE IF EXISTS Orders;

-- Create Index
CREATE INDEX idx_customer_id ON Orders(customer_id);

-- Drop Index
DROP INDEX idx_customer_id ON Orders;

-- Create View
CREATE VIEW HighValueOrders AS
SELECT * FROM Orders WHERE total_amount > 1000;

-- Drop View
DROP VIEW IF EXISTS HighValueOrders;

-- Create Trigger
CREATE TRIGGER UpdateOrderTotal AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET total_amount = total_amount + NEW.item_price
    WHERE order_id = NEW.order_id;
END;

-- Drop Trigger
DROP TRIGGER IF EXISTS UpdateOrderTotal;

-- Create User
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password';

-- DML (Data Manipulation Language) Queries --
-- Insert Record
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2024-03-30', 120.50);

-- Update Record
UPDATE Customers
SET phone_number = '123-456-7890'
WHERE user_id = 1;

-- Delete Record
DELETE FROM Orders
WHERE order_id = 1;

-- Truncate Table
TRUNCATE TABLE Orders;

-- Select Statement
SELECT * FROM Customers;

-- Bulk Insert
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
    (1, '2024-03-30', 120.50),
    (2, '2024-03-29', 150.25),
    (3, '2024-03-28', 200.00);

-- Alter Table (Add Column)
ALTER TABLE Orders
ADD COLUMN payment_status VARCHAR(20) DEFAULT 'Pending';

-- Drop Column
ALTER TABLE Orders
DROP COLUMN payment_status;

-- Create Index on Multiple Columns
CREATE INDEX idx_customer_order_date ON Orders(customer_id, order_date);

-- Drop User
DROP USER IF EXISTS 'new_user'@'localhost';

-- DCL (Data Control Language) Queries --
-- Grant SELECT Permission
GRANT SELECT ON Customers TO 'new_user'@'localhost';

-- Revoke UPDATE Permission
REVOKE UPDATE ON Products FROM 'user1'@'localhost';

-- Grant All Privileges
GRANT ALL PRIVILEGES ON Orders TO 'admin_user'@'localhost';

-- Revoke All Privileges
REVOKE ALL PRIVILEGES ON Orders FROM 'admin_user'@'localhost';

-- Grant Role
GRANT role_name TO 'user1'@'localhost';

-- Revoke Role
REVOKE role_name FROM 'user1'@'localhost';

-- Set Password for User
SET PASSWORD FOR 'new_user'@'localhost' = PASSWORD('new_password');

-- Create Role
CREATE ROLE app_user;

-- Drop Role
DROP ROLE IF EXISTS app_user;

-- Show Grants for User
SHOW GRANTS FOR 'new_user'@'localhost';

-- TCL (Transaction Control Language) Queries --
-- Start Transaction
START TRANSACTION;

-- Commit Transaction
COMMIT;

-- Rollback Transaction
ROLLBACK;

-- Savepoint
SAVEPOINT sp1;

-- Rollback to Savepoint
ROLLBACK TO SAVEPOINT sp1;

-- Set Transaction Isolation Level
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Lock Table
LOCK TABLE Orders WRITE;

-- Unlock Table
UNLOCK TABLES;

-- Set Autocommit On
SET AUTOCOMMIT = 1;

-- Set Autocommit Off
SET AUTOCOMMIT = 0;

-- Joins --
-- Retrieve customer details along with their total order amounts using an INNER JOIN.
SELECT c.user_id, c.purchase_history, SUM(o.total_amount) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.user_id = o.customer_id
GROUP BY c.user_id;

-- List products with their categories using a LEFT JOIN to include products without categories.
SELECT p.product_id, p.name AS product_name, c.category_name
FROM Product p
LEFT JOIN Categories c ON p.category_id = c.category_id;

-- Get shipping details along with payment information using a RIGHT JOIN.
SELECT sh.transaction_id, sh.mode_of_shipping, p.payment_date
FROM Shipping sh
RIGHT JOIN Payment p ON sh.payment_id = p.payment_id;

-- Views --
-- Create a view to display top-selling products based on purchase quantity.
CREATE VIEW TopSellingProducts AS
SELECT p.product_id, p.name AS product_name, COUNT(s.transaction_id) AS total_sales
FROM Product p
INNER JOIN Shipping s ON p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY total_sales DESC;

-- Create a view to show customer support tickets with compensation details.
CREATE VIEW CustomerSupportDetails AS
SELECT cs.ticket_number, cs.complaints, cs.compensation, u.username AS customer_name
FROM CustomerSupport cs
INNER JOIN Users u ON cs.user_id = u.user_id;

-- Triggers --
-- Create a trigger to update inventory quantity when a product is purchased.
DELIMITER //
CREATE TRIGGER UpdateInventoryQuantity AFTER INSERT ON Shipping
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET quantity = quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END;
//
DELIMITER ;

-- Create a trigger to log changes to order status in an audit table.
DELIMITER //
CREATE TRIGGER OrderStatusAudit AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO OrderStatusAudit (order_id, old_status, new_status, change_date)
    VALUES (OLD.order_id, OLD.status, NEW.status, NOW());
END;
//
DELIMITER ;

-- Cursors --
-- Use a cursor to calculate total compensation for customer support tickets.
DELIMITER //
CREATE PROCEDURE CalculateTotalCompensation()
BEGIN
    DECLARE total_compensation DECIMAL(10, 2);
    DECLARE ticket_number_var INT;
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT ticket_number, compensation FROM CustomerSupport;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    loop_cursor: LOOP
        FETCH cur INTO ticket_number_var, total_compensation;
        IF done THEN
            LEAVE loop_cursor;
        END IF;

        SELECT SUM(compensation)
        INTO total_compensation
        FROM CustomerSupport
        WHERE ticket_number = ticket_number_var;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

-- Use a cursor to fetch and display customer details along with their recent orders.
DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN user_id INT)
BEGIN
    DECLARE order_id_var INT;
    DECLARE order_date_var DATE;
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT order_id, order_date FROM Orders WHERE customer_id = user_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    loop_cursor: LOOP
        FETCH cur INTO order_id_var, order_date_var;
        IF done THEN
            LEAVE loop_cursor;
        END IF;

        SELECT * FROM Customers WHERE user_id = user_id;
        SELECT * FROM Orders WHERE order_id = order_id_var;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

-- Use a cursor to iterate through product categories and calculate total sales per category.
DELIMITER //
CREATE PROCEDURE CalculateCategorySales()
BEGIN
    DECLARE category_id_var INT;
    DECLARE total_sales DECIMAL(10, 2);
    DECLARE done INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT DISTINCT category_id FROM Product;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    loop_cursor: LOOP
        FETCH cur INTO category_id_var;
        IF done THEN
            LEAVE loop_cursor;
        END IF;

        SELECT SUM(price * quantity) AS total_sales
        INTO total_sales
        FROM Product p
        INNER JOIN Shipping s ON p.product_id = s.product_id
        WHERE p.category_id = category_id_var;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

-- Retrieve orders placed by customers who have spent more than $500.
SELECT o.order_id, o.order_date, c.user_id
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.user_id
WHERE c.avg_order_value > 500;

-- List products that have received reviews with ratings above 4.
SELECT p.product_id, p.name AS product_name, r.satisfaction_rating
FROM Product p
INNER JOIN Review r ON p.product_id = r.product_id
WHERE r.satisfaction_rating > 4;

-- Calculate total revenue generated from online payments.
SELECT SUM(op.net_banking + op.credit_debit_card + op.upi) AS total_revenue
FROM OnlinePayment op;

-- Identify customers who have made purchases in multiple categories.
SELECT DISTINCT c.user_id, c.purchase_history
FROM Customers c
INNER JOIN Orders o ON c.user_id = o.customer_id
INNER JOIN Product p ON o.product_id = p.product_id
GROUP BY c.user_id
HAVING COUNT(DISTINCT p.category_id) > 1;

-- Retrieve details of products with discounts greater than 10%.
SELECT product_id, name, price, discounts
FROM Product
WHERE discounts > 10;

-- Update product prices by applying a 5% discount.
UPDATE Product
SET price = price * 0.95;

-- Delete customer support tickets older than 6 months.
DELETE FROM CustomerSupport
WHERE DATEDIFF(NOW(), DATE(complaint_date)) > 180;

-- Generate a report of customer orders for the past month.
SELECT *
FROM Orders
WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);

-- Calculate average order value for each customer.
SELECT user_id, AVG(total_amount) AS avg_order_value
FROM Orders
GROUP BY user_id;

-- Identify products with low inventory levels (less than 10 units).
SELECT product_id, name, description, inventory_size
FROM Product
INNER JOIN Inventory ON Product.product_id = Inventory.product_id
WHERE quantity < 10;

-- Data Definition Language (DDL) Commands --

-- Create a new table to store product reviews.
CREATE TABLE ProductReviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating DECIMAL(3, 2),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Customers(user_id)
);

-- Add a CHECK constraint to ensure that prices are always positive.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (price > 0);

-- Create a new view to display products with their average ratings.
CREATE VIEW ProductRatings AS
SELECT p.product_id, p.name, AVG(r.rating) AS avg_rating
FROM Products p
LEFT JOIN ProductReviews r ON p.product_id = r.product_id
GROUP BY p.product_id;

-- Data Manipulation Language (DML) Commands --

-- Insert a new review for a product into the ProductReviews table.
INSERT INTO ProductReviews (review_id, product_id, user_id, rating, review_text, review_date)
VALUES (1, 1001, 1, 4.5, 'Great product, highly recommended!', '2024-03-01');

-- Update the stock quantity of a product after a purchase.
UPDATE Products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1001;

-- Delete a review from the ProductReviews table based on its review_id.
DELETE FROM ProductReviews
WHERE review_id = 1;

-- Transaction Control Language (TCL) Commands --

-- Start a new transaction.
START TRANSACTION;

-- Insert a new order into the Orders table.
INSERT INTO Orders (order_id, user_id, product_id, order_date, total_amount)
VALUES (1001, 1, 1001, '2024-03-15', 99.99);

-- Commit the transaction to save the changes.
COMMIT;

-- Rollback the transaction in case of an error or issue.
ROLLBACK;

-- Data Control Language (DCL) Commands --

-- Grant SELECT permission on the ProductReviews table to a specific user.
GRANT SELECT ON ProductReviews TO 'username'@'hostname';

-- Revoke INSERT permission on the Customers table from a user role.
REVOKE INSERT ON Customers FROM 'user_role';

-- Subqueries and Nested Queries --

-- Retrieve products with prices higher than the average price in their category.
SELECT *
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
    WHERE category_id = Products.category_id
);

-- List customers who have made orders exceeding $500 in total.
SELECT user_id, username
FROM Customers
WHERE user_id IN (
    SELECT user_id
    FROM Orders
    GROUP BY user_id
    HAVING SUM(total_amount) > 500
);

-- Calculate the total number of orders for products with a specific brand.
SELECT brand, (
    SELECT COUNT(*)
    FROM Orders o
    JOIN Products p ON o.product_id = p.product_id
    WHERE p.brand = products.brand
) AS total_orders
FROM Products products
GROUP BY brand;

-- Data Definition Language (DDL) Commands --

-- Create a new table to store order details with foreign key constraints.
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Add a UNIQUE constraint on the username column in the Customers table.
ALTER TABLE Customers
ADD CONSTRAINT UQ_Username UNIQUE (username);

-- Create a new trigger to update total_price in OrderDetails when quantity changes.
DELIMITER //
CREATE TRIGGER UpdateTotalPrice
AFTER UPDATE ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE OrderDetails
    SET total_price = NEW.quantity * (SELECT price FROM Products WHERE product_id = NEW.product_id)
    WHERE order_detail_id = NEW.order_detail_id;
END;
//
DELIMITER ;

-- Data Manipulation Language (DML) Commands --

-- Insert multiple records into the OrderDetails table in a single query.
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, total_price)
VALUES
    (1, 1001, 1001, 2, (SELECT price FROM Products WHERE product_id = 1001) * 2),
    (2, 1001, 1002, 1, (SELECT price FROM Products WHERE product_id = 1002) * 1),
    (3, 1002, 1003, 3, (SELECT price FROM Products WHERE product_id = 1003) * 3);

-- Update the stock quantity of a product using a subquery to calculate the new value.
UPDATE Products
SET stock_quantity = (
    SELECT SUM(quantity)
    FROM OrderDetails
    WHERE product_id = Products.product_id
)
WHERE product_id = 1001;

-- Delete all reviews for products that are no longer available in stock.
DELETE FROM ProductReviews
WHERE product_id NOT IN (SELECT product_id FROM Products WHERE stock_quantity > 0);

-- Transaction Control Language (TCL) Commands --

-- Savepoint creation to rollback partially committed transaction.
SAVEPOINT sp1;

-- Rollback to the savepoint if an error occurs.
ROLLBACK TO SAVEPOINT sp1;

-- Release the savepoint.
RELEASE SAVEPOINT sp1;

-- Data Control Language (DCL) Commands --

-- Grant INSERT, UPDATE, DELETE permissions on the Orders table to a user role.
GRANT INSERT, UPDATE, DELETE ON Orders TO 'user_role';

-- Revoke SELECT permission on the ProductReviews table from a specific user.
REVOKE SELECT ON ProductReviews FROM 'username'@'hostname';

-- Subqueries and Nested Queries --

-- Retrieve the top 5 customers with the highest total order amounts.
SELECT user_id, username, (
    SELECT SUM(total_amount)
    FROM Orders o
    WHERE o.user_id = c.user_id
) AS total_orders_amount
FROM Customers c
ORDER BY total_orders_amount DESC
LIMIT 5;

-- List products with prices lower than the average price across all categories.
SELECT *
FROM Products
WHERE price < (
    SELECT AVG(price)
    FROM Products
);

-- Calculate the total revenue generated from orders for each product category.
SELECT c.category_name, SUM(p.price * od.quantity) AS total_revenue
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY c.category_name;

-- Retrieve customer details sorted by user_id in ascending order
SELECT * FROM Customers ORDER BY user_id ASC;

-- Retrieve products sorted by price in descending order
SELECT * FROM Product ORDER BY price DESC;

-- Retrieve shipping details sorted by mode_of_shipping in alphabetical order
SELECT * FROM Shipping ORDER BY mode_of_shipping ASC;

-- Calculate total sales for each product category
SELECT category_id, SUM(price) AS total_sales
FROM Product
GROUP BY category_id;

-- Count the number of orders for each customer
SELECT user_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY user_id;

-- Calculate average satisfaction rating for each product
SELECT product_id, AVG(satisfaction_rating) AS avg_rating
FROM Review
GROUP BY product_id;

-- Retrieve top-selling products in each category based on total sales
SELECT category_id, product_id, SUM(price) AS total_sales
FROM Product
GROUP BY category_id, product_id
ORDER BY total_sales DESC;

-- List customers along with the total amount spent, ordered by total amount in descending order
SELECT user_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY user_id
ORDER BY total_spent DESC;

-- Calculate the average order value for each customer and display them in ascending order
SELECT user_id, AVG(total_amount) AS avg_order_value
FROM Orders
GROUP BY user_id
ORDER BY avg_order_value ASC;

-- Retrieve products with prices higher than the average price in their category
SELECT *
FROM Product
WHERE price > (
    SELECT AVG(price)
    FROM Product
    WHERE category_id = Products.category_id
)
ORDER BY price DESC;

-- List customers who have made orders exceeding $500 in total
SELECT user_id, username
FROM Customers
WHERE user_id IN (
    SELECT user_id
    FROM Orders
    GROUP BY user_id
    HAVING SUM(total_amount) > 500
)
ORDER BY user_id ASC;

-- Calculate the total number of orders for products with a specific brand
SELECT brand, (
    SELECT COUNT(*)
    FROM Orders o
    JOIN Product p ON o.product_id = p.product_id
    WHERE p.brand = products.brand
) AS total_orders
FROM Product products
GROUP BY brand
ORDER BY total_orders DESC;

-- Count the number of customers in the Customers table
SELECT COUNT(*) AS total_customers FROM Customers;

-- Calculate the average order value in the Orders table
SELECT AVG(total_amount) AS average_order_value FROM Orders;

-- Find the minimum price among all products in the Product table
SELECT MIN(price) AS min_price FROM Product;

-- Find the maximum satisfaction rating among all reviews in the Review table
SELECT MAX(satisfaction_rating) AS max_rating FROM Review;

-- Count the number of products in each category
SELECT category_id, COUNT(*) AS total_products
FROM Product
GROUP BY category_id;

-- Calculate the average quantity of products sold in each order
SELECT order_id, AVG(quantity) AS average_quantity
FROM OrderDetails
GROUP BY order_id;

-- Find the minimum total amount spent by a customer in the Orders table
SELECT user_id, MIN(total_amount) AS min_total_amount
FROM Orders
GROUP BY user_id;

-- Find the maximum discounts applied to products in the Product table
SELECT MAX(discounts) AS max_discount FROM Product;

-- Count the number of distinct brands in the Product table
SELECT COUNT(DISTINCT brand) AS distinct_brands FROM Product;

-- Calculate the average compensation amount in the CustomerSupport table
SELECT AVG(compensation) AS avg_compensation FROM CustomerSupport;

-- Find the minimum order date in the Orders table
SELECT MIN(order_date) AS min_order_date FROM Orders;

-- Find the maximum order date in the Orders table
SELECT MAX(order_date) AS max_order_date FROM Orders;

-- Count the number of transactions in the Payment table
SELECT COUNT(*) AS total_transactions FROM Payment;

-- Calculate the average development metrics in the Logistics table
SELECT AVG(development_metrics) AS avg_development_metrics FROM Logistics;

-- Find the minimum quantity of products available in the Inventory table
SELECT MIN(quantity) AS min_quantity FROM Inventory;

-- Find the maximum quantity of products available in the Inventory table
SELECT MAX(quantity) AS max_quantity FROM Inventory;

-- Count the number of tickets in the CustomerSupport table
SELECT COUNT(*) AS total_tickets FROM CustomerSupport;

-- Calculate the average satisfaction rating for each product in the Review table
SELECT product_id, AVG(satisfaction_rating) AS avg_rating
FROM Review
GROUP BY product_id;

-- Find the top 3 categories with the highest average product prices
SELECT c.category_name, AVG(p.price) AS avg_price
FROM Categories c
JOIN Product p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY avg_price DESC
LIMIT 3;

-- Calculate the total revenue generated from online payments for each seller
SELECT s.name AS seller_name, SUM(op.net_banking + op.credit_debit_card + op.upi) AS total_revenue
FROM Seller s
JOIN Payment pm ON s.seller_id = pm.seller_id
JOIN OnlinePayment op ON pm.online_payment_id = op.transaction_id
GROUP BY s.seller_id;

-- Find the top 5 customers who have spent the most across all orders
SELECT c.user_id, c.username, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
GROUP BY c.user_id
ORDER BY total_spent DESC
LIMIT 5;

-- Identify customers who have made purchases in multiple categories
SELECT c.user_id, c.username
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
JOIN Product p ON o.product_id = p.product_id
JOIN Categories ct ON p.category_id = ct.category_id
GROUP BY c.user_id
HAVING COUNT(DISTINCT ct.category_id) > 1;

-- Find the average satisfaction rating for each seller based on customer reviews
SELECT s.name AS seller_name, AVG(r.satisfaction_rating) AS avg_rating
FROM Seller s
JOIN Product p ON s.seller_id = p.seller_id
JOIN Review r ON p.product_id = r.product_id
GROUP BY s.seller_id;

-- Calculate the total compensation paid for customer support tickets in each month
SELECT DATE_FORMAT(cs.complaint_date, '%Y-%m') AS month_year, SUM(cs.compensation) AS total_compensation
FROM CustomerSupport cs
GROUP BY month_year
ORDER BY month_year;

-- Retrieve orders along with the corresponding product details and customer information
SELECT o.order_id, o.order_date, p.product_id, p.name AS product_name, c.username AS customer_name
FROM Orders o
JOIN Product p ON o.product_id = p.product_id
JOIN Customers c ON o.user_id = c.user_id;

-- Find the top-selling products in each category based on purchase quantity
SELECT c.category_name, p.product_id, p.name AS product_name, COUNT(*) AS total_sales
FROM Product p
JOIN Categories c ON p.category_id = c.category_id
JOIN Shipping s ON p.product_id = s.product_id
GROUP BY c.category_id, p.product_id
ORDER BY total_sales DESC;

-- Identify customers who have made purchases with an average order value exceeding $200
SELECT c.user_id, c.username, AVG(o.total_amount) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
GROUP BY c.user_id
HAVING AVG(o.total_amount) > 200;

-- Calculate the total revenue generated from orders for each product category
SELECT c.category_name, SUM(p.price * od.quantity) AS total_revenue
FROM Categories c
JOIN Product p ON c.category_id = p.category_id
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY c.category_name;

-- Find the top 5 customers with the highest total order amounts
SELECT c.user_id, c.username, SUM(o.total_amount) AS total_order_amount
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
GROUP BY c.user_id
ORDER BY total_order_amount DESC
LIMIT 5;

-- Calculate the average price of products in each brand
SELECT brand, AVG(price) AS avg_price
FROM Product
GROUP BY brand;

-- Identify products with prices above the average price in their category
SELECT product_id, name, price
FROM Product
WHERE price > (SELECT AVG(price) FROM Product WHERE category_id = Product.category_id);

-- Find the number of orders placed by each customer on weekends
SELECT c.user_id, c.username, COUNT(o.order_id) AS weekend_orders
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
WHERE DAYOFWEEK(o.order_date) IN (1, 7)
GROUP BY c.user_id;

-- Calculate the total revenue generated from online payments and offline payments separately
SELECT 
    (SELECT SUM(net_banking + credit_debit_card + upi) FROM OnlinePayment) AS total_online_revenue,
    (SELECT SUM(amount) FROM OfflinePayment) AS total_offline_revenue;

-- Retrieve orders with the highest and lowest total amounts
SELECT * FROM Orders WHERE total_amount = (SELECT MAX(total_amount) FROM Orders)
UNION
SELECT * FROM Orders WHERE total_amount = (SELECT MIN(total_amount) FROM Orders);

-- List customers who have made orders in multiple categories
SELECT c.user_id, c.username
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
JOIN Product p ON o.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY c.user_id
HAVING COUNT(DISTINCT cat.category_name) > 1;

-- Identify products with no reviews yet
SELECT p.product_id, p.name AS product_name
FROM Product p
LEFT JOIN Review r ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Calculate the total compensation paid to customers for various complaints
SELECT cs.complaints, SUM(cs.compensation) AS total_compensation
FROM CustomerSupport cs
GROUP BY cs.complaints;

-- Retrieve customers who have placed orders for products with discounts greater than 10%
SELECT c.user_id, c.username
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
JOIN Product p ON o.product_id = p.product_id
WHERE p.discounts > 10;

-- Calculate the average order value for each month in the last year
SELECT 
    YEAR(order_date) AS year, 
    MONTH(order_date) AS month, 
    AVG(total_amount) AS avg_order_value
FROM Orders
WHERE order_date >= DATE_SUB(NOW(), INTERVAL 1 YEAR)
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Identify products that have not been sold yet
SELECT p.product_id, p.name AS product_name
FROM Product p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

-- Calculate the total number of orders placed by each customer in the last 6 months
SELECT c.user_id, c.username, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
WHERE order_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY c.user_id;

-- Retrieve customers who have made purchases in multiple categories and have an average order value greater than $200
SELECT c.user_id, c.username
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
JOIN Product p ON o.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY c.user_id
HAVING COUNT(DISTINCT cat.category_name) > 1 AND AVG(o.total_amount) > 200;

-- Calculate the total number of products sold in each category
SELECT cat.category_name, COUNT(p.product_id) AS total_products_sold
FROM Product p
JOIN Categories cat ON p.category_id = cat.category_id
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY cat.category_name;

-- Find the top-selling product in terms of total quantity sold
SELECT p.product_id, p.name AS product_name, SUM(od.quantity) AS total_quantity_sold
FROM Product p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- Identify customers who have placed orders for products from a specific brand
SELECT c.user_id, c.username
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
JOIN Product p ON o.product_id = p.product_id
WHERE p.brand = 'Brand A';

-- Calculate the average rating for each product category
SELECT cat.category_name, AVG(r.satisfaction_rating) AS avg_rating
FROM Categories cat
JOIN Product p ON cat.category_id = p.category_id
JOIN Review r ON p.product_id = r.product_id
GROUP BY cat.category_name;

-- Retrieve the latest order placed by each customer
SELECT c.user_id, c.username, MAX(o.order_date) AS latest_order_date
FROM Customers c
JOIN Orders o ON c.user_id = o.user_id
GROUP BY c.user_id;

-- Find customers who have not made any purchases in the last 3 months
SELECT user_id, username
FROM Customers
WHERE user_id NOT IN (
    SELECT DISTINCT user_id
    FROM Orders
    WHERE order_date >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
);

-- Calculate the total revenue generated from each mode of shipping
SELECT mode_of_shipping, SUM(o.total_amount) AS total_revenue
FROM Shipping s
JOIN Orders o ON s.transaction_id = o.transaction_id
GROUP BY mode_of_shipping;

-- Identify products with discounts greater than 20% and have received reviews with ratings above 4
SELECT p.product_id, p.name AS product_name, p.discounts, r.satisfaction_rating
FROM Product p
JOIN Review r ON p.product_id = r.product_id
WHERE p.discounts > 20 AND r.satisfaction_rating > 4;

-- Calculate additional statistics like median, variance, and standard deviation
SELECT 
  cat.category_name, 
  COUNT(p.product_id) AS total_products, 
  AVG(p.price) AS avg_price, 
  MEDIAN(p.price) AS median_price,
  VAR_POP(p.price) AS variance_price,
  STDDEV_POP(p.price) AS stddev_price
FROM Product p
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name;

