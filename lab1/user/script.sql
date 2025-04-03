# Create a database if it doesn’t exist
CREATE DATABASE IF NOT EXISTS user;
# Drop the database if it exists
DROP DATABASE IF EXISTS user;
# Create a database if it doesn’t exist
CREATE DATABASE IF NOT EXISTS user;
# Use the newly created database
USE user;
# Create a user table
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
# Create table role
CREATE TABLE role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role_name VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO user (username, email, password)
    VALUES ('john_doe', 'john@example.com', 'password123');

INSERT INTO user (username, email, password)
    VALUES ('jane_smith', 'jane@example.com', 'password456');

INSERT INTO user (username, email, password)
    VALUES ('daniel_maia', 'daniel@example.com', 'password789');

INSERT INTO role (user_id, role_name)
    VALUES (1, 'admin');

INSERT INTO role (user_id, role_name)
    VALUES (2, 'user');

INSERT INTO role (user_id, role_name)
    VALUES (3, 'guest');

# Show all users
SELECT * FROM user;

# Show all role;
SELECT * FROM role;

# Show user with specified email
SELECT * FROM user WHERE email = 'jane@example.com';
