CREATE DATABASE IF NOT EXISTS db2;
USE db2;

CREATE TABLE Customers (
    user_id INT PRIMARY KEY,
    credentials TEXT
);

-- Inserting sample data into the Customers table
INSERT INTO Customers (user_id, credentials) VALUES
    (1, 'customer1@example.com, password1'),
    (2, 'customer2@example.com, password2'),
    (3, 'customer3@example.com, password3');

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    num_of_products INT,
    FOREIGN KEY (user_id) REFERENCES Customers(user_id)
);

-- Inserting sample data into the Cart table
INSERT INTO Cart (cart_id, user_id, num_of_products) VALUES
    (101, 1, 3),
    (102, 2, 2),
    (103, 3, 1);

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
    seller_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(user_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);


INSERT INTO Product (product_id, brand, price, name, description, discounts, customer_id, review_id, category_id, seller_id) VALUES
    (1, 'Brand A', 999.99, 'Laptop', 'High-performance laptop with advanced features.', 10.00, 1, 1, 1, 1),
    (2, 'Brand B', 499.99, 'Smartphone', 'Latest smartphone with a stunning display.', 5.00, 2, 2, 2, 2),
    (3, 'Brand C', 199.99, 'Headphones', 'Premium noise-canceling headphones for immersive sound experience.', 15.00, 3, 3, 3, 3),
    (4, 'Brand D', 299.99, 'Tablet', 'Lightweight tablet with long battery life.', 8.00, 1, 4, 4, 1); -- Changed customer_id and seller_id values to existing ones


CREATE TABLE Shipping (
    transaction_id INT PRIMARY KEY,
    mode_of_shipping VARCHAR(50),
    quantity INT,
    cart_id INT,
    payment_id INT,
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id)
);

-- Inserting sample data into the Shipping table
INSERT INTO Shipping (transaction_id, mode_of_shipping, quantity, cart_id, payment_id) VALUES
    (1, 'Express', 3, 101, 1),
    (2, 'Standard', 2, 102, 2),
    (3, 'Express', 1, 103, 3);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    payment_date DATE,
    cart_id INT,
    shipping_id INT,
    online_payment_id INT,
    offline_payment_id INT,
    seller_id INT,
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
    FOREIGN KEY (shipping_id) REFERENCES Shipping(transaction_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

-- Inserting sample data into the Payment table
INSERT INTO Payment (payment_id, payment_date, cart_id, shipping_id, seller_id) VALUES
    (1, '2024-02-27', 101, 1, 1),
    (2, '2024-02-26', 102, 2, 2),
    (3, '2024-02-25', 103, 3, 3);


CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(50),
    inventory_id INT,
    product_id INT,
    payment_id INT
);

-- Inserting sample data into the Seller table
INSERT INTO Seller (seller_id, name, contact, inventory_id, product_id, payment_id) VALUES
    (1, 'ABC Electronics', '123-456-7890', 101, 1, 1),
    (2, 'XYZ Store', '987-654-3210', 102, 2, 2),
    (3, 'GHI Tech', '456-789-0123', 103, 3, 3);

CREATE TABLE Inventory (
    doc_number INT PRIMARY KEY,
    inventory_size VARCHAR(50),
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

-- Inserting sample data into the Inventory table
INSERT INTO Inventory (doc_number, inventory_size, seller_id) VALUES
    (101, 'Large', 1),
    (102, 'Medium', 2),
    (103, 'Small', 3);

CREATE TABLE CustomerSupport (
    ticket_number INT PRIMARY KEY,
    compensation DECIMAL(10, 2),
    complaints TEXT,
    user_id INT,
    review_id INT,
    logistics_id INT,
    FOREIGN KEY (user_id) REFERENCES Customers(user_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    satisfaction_rating DECIMAL(3, 2),
    feedback TEXT,
    product_id INT,
    customer_support_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_support_id) REFERENCES CustomerSupport(ticket_number)
);

CREATE TABLE Logistics (
    team_number INT PRIMARY KEY,
    ticket_number INT,
    development_metrics DECIMAL(10, 2),
    performance_metrics DECIMAL(10, 2),
    FOREIGN KEY (ticket_number) REFERENCES CustomerSupport(ticket_number)
);


-- Inserting sample data into the CustomerSupport table
INSERT INTO CustomerSupport (ticket_number, compensation, complaints, user_id) VALUES
    (1001, 50.00, 'Product arrived damaged', 1),
    (1002, 0.00, 'Delayed delivery', 2),
    (1003, 20.00, 'Wrong item shipped', 3);


-- Inserting sample data into the Logistics table
INSERT INTO Logistics (team_number,ticket_number,development_metrics, performance_metrics) VALUES
    (101,1001, 85.5, 90.2),
    (102,1002, 92.3, 88.7),
    (103,1003, 78.9, 85.6);



-- Inserting sample data into the Review table
INSERT INTO Review (review_id, satisfaction_rating, feedback, product_id, customer_support_id) VALUES
    (1, 4.5, 'Great service, very satisfied with the product.', 1, 1001),
    (2, 3.8, 'Product quality could be better, delivery was prompt.', 2, 1002),
    (3, 4.0, 'Excellent customer support, resolved my issue quickly.', 3, 1003);

CREATE TABLE Categories (
    parent_id INT,
    category_id INT,
    category_name VARCHAR(100),
    product_id INT,
    search_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Inserting sample data into the Categories table
INSERT INTO Categories (parent_id, category_id, category_name, product_id, search_id)
VALUES
    (1, 101, 'Category A', 1, 201),
    (1, 102, 'Category B', 2, 202),
    (2, 201, 'Category C', 3, 203),
    (2, 202, 'Category D', 4, 204);
    
-- NORMALISATIONS TECHNIQUES 

-- 1nF
-- Seperating the values in the 2 columns that is that password and emmail were stored together first so seperated them now 

ALTER TABLE Customers
ADD COLUMN email VARCHAR(255),
ADD COLUMN password VARCHAR(255);

-- Update the new columns with data from the Credentials column
UPDATE Customers
SET email = SUBSTRING_INDEX(credentials, ',', 1),
    password = SUBSTRING_INDEX(credentials, ',', -1);

-- Remove the original Credentials column
ALTER TABLE Customers
DROP COLUMN credentials;

select*from customers;

-- New table to show 1nf

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    job_title VARCHAR(255),
    address VARCHAR(255),
    phone_numbers JSON
);

CREATE TABLE AdminPhone (
    admin_phone_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_id INT,
    phone_number VARCHAR(20),
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

INSERT INTO Admin (name, job_title, address, phone_numbers) VALUES
    ('John Doe', 'Administrator', '123 Main Street, Cityville', '["123-456-7890", "987-654-3210"]'),
    ('Alice Smith', 'Manager', '456 Elm Street, Townsville', '["555-555-5555"]'),
    ('Bob Johnson', 'Supervisor', '789 Oak Street, Villageton', '["111-222-3333"]'),
    ('Emily Brown', 'Assistant Manager', '101 Pine Street, Hamletville', '["444-444-4444"]'),
    ('Michael Lee', 'Coordinator', '202 Maple Street, Boroughtown', '["999-999-9999"]'),
    ('Sarah Wilson', 'Director', '303 Cedar Street, Municipality', '["777-777-7777"]'),
    ('David Martinez', 'Team Leader', '404 Birch Street, Township', '["888-888-8888"]'),
    ('Jessica Taylor', 'Administrator', '505 Spruce Street, Settlement', '["666-666-6666"]'),
    ('William Rodriguez', 'Manager', '606 Walnut Street, Community', '["333-333-3333"]');
    
    INSERT INTO AdminPhone (admin_id, phone_number) VALUES
    (1, '123-456-7890'),
    (1, '987-654-3210'),
    (2, '555-555-5555'),
    (3, '111-222-3333'),
    (4, '444-444-4444'),
    (5, '999-999-9999'),
    (6, '777-777-7777'),
    (7, '888-888-8888'),
    (8, '666-666-6666'),
    (9, '333-333-3333');

select * from admin; -- Old table without 1nf
select * from adminphone; -- New Table that is with 1nf

-- 2nf

-- 1st example
-- we'll alter the table product as it contains dependencies to several attributes
-- we'll add these new attributes to the table ProductDetails which will contain them and hence be normalised in 2nf form

CREATE TABLE ProductDetails (
    product_id INT PRIMARY KEY,
    brand VARCHAR(50),
    price DECIMAL(10, 2),
    name VARCHAR(100),
    description TEXT,
    discounts DECIMAL(5, 2),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO ProductDetails (product_id, brand, price, name, description, discounts)
SELECT product_id, brand, price, name, description, discounts
FROM Product;

ALTER TABLE Product
DROP COLUMN brand,
DROP COLUMN price,
DROP COLUMN name,
DROP COLUMN description,
DROP COLUMN discounts;

select*from product; -- old table in which we removed the attributes
select* from ProductDetails; -- new table in which the attributes are added

-- 2nd example

CREATE TABLE EmployeeTasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    employee_name VARCHAR(100),
    task_description TEXT,
    project_id INT,
    project_name VARCHAR(100)
);

INSERT INTO EmployeeTasks (employee_id, employee_name, task_description, project_id, project_name) VALUES
    (1, 'John Doe', 'Coding tasks', 1, 'Project A'),
    (2, 'Alice Smith', 'Testing tasks', 2, 'Project B'),
    (3, 'Bob Johnson', 'Documentation tasks', 1, 'Project A'),
    (4, 'Emily Brown', 'Design tasks', 3, 'Project C'),
    (5, 'Michael Lee', 'Management tasks', 2, 'Project B');
    
-- employee_name is partially dependent on employee_id.
-- project_name is partially dependent on project_id.

CREATE TABLE emp_test_2nf (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100)
);

INSERT INTO emp_test_2nf (employee_name) VALUES
    ('John Doe'),
    ('Alice Smith'),
    ('Bob Johnson'),
    ('Emily Brown'),
    ('Michael Lee');

INSERT INTO Projects (project_name) VALUES
    ('Project A'),
    ('Project B'),
    ('Project C');
    
    ALTER TABLE EmployeeTasks
ADD COLUMN employee_id INT,
ADD COLUMN project_id INT;

-- Populate employee_id and project_id using the new tables
UPDATE EmployeeTasks et
JOIN emp_test_2nf e ON et.employee_name = e.employee_name
SET et.employee_id = e.employee_id;

UPDATE EmployeeTasks et
JOIN Projects p ON et.project_name = p.project_name
SET et.project_id = p.project_id;

-- Remove the old columns
ALTER TABLE EmployeeTasks
DROP COLUMN employee_name,
DROP COLUMN project_name;

select*from EmployeeTasks ; 
select*from Projects  ;
select*from emp_test_2nf;

-- 3nf 

-- 1st example :
-- normalising the table Payment
-- transitive dependencies in the Payment table
-- seller_id is functionally dependent on cart_id, shipping_id
-- online_payment_id and offline_payment_id might have dependencies
-- creating separate tables for different payment methods and eliminate the transitive dependencies.

CREATE TABLE OnlinePayment (
    online_payment_id INT PRIMARY KEY,
    payment_method VARCHAR(50),
    payment_amount DECIMAL(10, 2)
);

CREATE TABLE OfflinePayment (
    offline_payment_id INT PRIMARY KEY,
    payment_method VARCHAR(50),
    payment_amount DECIMAL(10, 2)
);


ALTER TABLE Payment
DROP COLUMN online_payment_id,
DROP COLUMN offline_payment_id;
ALTER TABLE Payment
ADD COLUMN online_payment_id INT,
ADD COLUMN offline_payment_id INT,
ADD FOREIGN KEY (online_payment_id) REFERENCES OnlinePayment(online_payment_id),
ADD FOREIGN KEY (offline_payment_id) REFERENCES OfflinePayment(offline_payment_id);

-- Each attribute in the Payment table is now functionally dependent on the primary key (payment_id) without any transitive relationships.

INSERT INTO OnlinePayment (online_payment_id, payment_method, payment_amount) VALUES
    (1, 'Credit Card', 100.00),
    (2, 'PayPal', 75.50),
    (3, 'Stripe', 120.75);
INSERT INTO OfflinePayment (offline_payment_id, payment_method, payment_amount) VALUES
    (1, 'Cash', 50.25),
    (2, 'Check', 85.00),
    (3, 'Bank Transfer', 200.50);
UPDATE Payment
SET online_payment_id = 1, offline_payment_id = 1
WHERE payment_id = 1;
UPDATE Payment
SET online_payment_id = 2, offline_payment_id = 2
WHERE payment_id = 2;
UPDATE Payment
SET online_payment_id = 3, offline_payment_id = 3
WHERE payment_id = 3;

SELECT*FROM OfflinePayment ;
SELECT*FROM OnlinePayment ;
SELECT*FROM Payment;

-- 2nd example 

select * from review ;
-- Review table is both in Third Normal Form (3NF) and Boyce-Codd Normal Form (BCNF)
-- as it meets the criteria for both levels of normalization without any violations.
-- bcnf as all are candidate key and no transistive dependencies are there 
-- same with 3nf as again no transisitive dependencies are there and all are functionaly dependent on primary key only.alter

-- 4nf

-- 1st example 

CREATE TABLE OrderDetails (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO OrderDetails (product_id, quantity, price, discount) VALUES
    (1, 2, 999.99, 10.00),
    (2, 1, 499.99, 5.00),
    (3, 3, 199.99, 15.00),
    (4, 1, 299.99, 8.00);

-- The OrderDetails table is already in 4NF. 
-- Each attribute in the table is functionally dependent on the primary key (order_id) without any multi-valued dependencies. 

select*from OrderDetails;

-- 2nd example

CREATE TABLE SupplierProducts (
    supplier_id INT,
    product_id INT,
    supplier_name VARCHAR(100),
    product_name VARCHAR(100),
    supplier_contact VARCHAR(50),
    supplier_address VARCHAR(255),
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY (supplier_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO SupplierProducts (supplier_id, product_id, supplier_name, product_name, supplier_contact, supplier_address) VALUES
    (1, 1, 'ABC Electronics', 'Laptop', '123-456-7890', '123 Main Street'),
    (2, 2, 'XYZ Store', 'Smartphone', '987-654-3210', '456 Elm Street'),
    (3, 3, 'GHI Tech', 'Headphones', '456-789-0123', '789 Oak Street'),
    (1, 4, 'ABC Electronics', 'Tablet', '123-456-7890', '123 Main Street');

-- same with it is i.e no multivalue dependency.

-- 5nf

-- 1st example

CREATE TABLE SupplierPayments (
    supplier_payment_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    product_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO SupplierPayments (supplier_id, product_id, payment_date, amount) VALUES
    (1, 1, '2024-04-15', 500.00),
    (2, 2, '2024-04-16', 750.00),
    (3, 3, '2024-04-17', 1000.00),
    (1, 4, '2024-04-18', 600.00);

select*from SupplierPayments;

-- SupplierPayments table is already in 5NF.
-- Each attribute is functionally dependent on the primary key (supplier_payment_id)
-- without any join dependencies other than the candidate keys (supplier_id, product_id).

-- 2nd example

CREATE TABLE ProductSuppliers (
    product_supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    supplier_id INT,
    supplier_name VARCHAR(100),
    product_name VARCHAR(100),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id),
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES Seller(seller_id)
);

INSERT INTO ProductSuppliers (product_id, supplier_id, supplier_name, product_name) VALUES
    (1, 1, 'ABC Electronics', 'Laptop'),
    (2, 2, 'XYZ Store', 'Smartphone'),
    (3, 3, 'GHI Tech', 'Headphones'),
    (4, 1, 'ABC Electronics', 'Tablet');

select * from ProductSuppliers;

-- The product_name attribute is functionally dependent on the product_id, and 
-- the supplier_name attribute is functionally dependent on the supplier_id.
-- Therefore, there are no partial dependencies in this table.
-- There are no multi-valued dependencies in this table.
-- There are no transitive dependencies in this table.
-- The ProductSuppliers table is already in 5NF 
-- since each attribute is functionally dependent on the primary key (product_supplier_id)
-- without any join dependencies other than the candidate keys (product_id, supplier_id).


