# Create database shop
CREATE DATABASE IF NOT EXISTS shop;

# Use the database;
USE shop;

# Create the table user;
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password VARCHAR(128) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(50) NOT NULL
);

# Create the table product
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_desc TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category TEXT NOT NULL,
    stock_quantity INT NOT NULL
);

# Create the table order
CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATE NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

# Create the table order_item
CREATE TABLE order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

# Create the table payment
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    method TEXT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);

# Create a test user
INSERT INTO user (name, email, password, address, phone)
    VALUES ('Daniel', 'daniel@ciber.cu', 'User_!23', 'Palhota city', 123456789);

# Create another test script
INSERT INTO user (name, email, password, address, phone)
    VALUES ('Garbiel', 'garbiel@ciber.cu', 'User_!23', 'Sesimbra city', 123456789);

# Create test product
INSERT INTO product (product_name, product_desc, price, category, stock_quantity)
    VALUES ('Batata', 'O que diz no nome', 0.12, 'Leguminosa', 32);

# Create test order
INSERT INTO `order` (user_id, order_date, order_status)
    VALUES (1, '2025-03-04', 'In transit');

# Create test order_item
INSERT INTO order_item (order_id, product_id, quantity, unit_price, total_price)
    VALUES (1, 1, 6, 0.12, 0.72);

# Create test payment
INSERT INTO payment (order_id, method, amount, date)
    VALUES (1, 'Transferencia Bancaria', '0.72', '2025-03-04');
