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

# Create the table category
CREATE TABLE category (
	category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

# Create the table product
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_desc TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
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
