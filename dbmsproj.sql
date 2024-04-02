use gadaelectronics;
-- Creation of tables

-- Products table
	CREATE TABLE Products (
		product_id INT PRIMARY KEY AUTO_INCREMENT,
		name VARCHAR(255),
		category VARCHAR(255),
		price DECIMAL(10, 2),
		description TEXT,
		stock_quantity INT
	);
ALTER TABLE Products
ADD COLUMN image VARCHAR(255);
-- Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(255)
);
ALTER TABLE Users
ADD COLUMN confirmPassword VARCHAR(255),
ADD COLUMN birthdate DATE,
ADD COLUMN gender ENUM('male', 'female', 'other');

-- Cart table
CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    created_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2),
    order_date TIMESTAMP,
    status VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Reviews table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    user_id INT,
    review_text TEXT,
    review_date TIMESTAMP,
    rating INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Images table
CREATE TABLE Images (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



-- Insert data into tables

-- Inserting values into Products table
INSERT INTO products (name, category, price, description)
VALUES
('Samsung Galaxy M31', 'Mobile Phones', 15999.00, '6GB RAM, 128GB Storage, Quad Camera'),
('Mi Smart Band 6', 'Wearable Devices', 3499.00, 'Full touch, AMOLED Display'),
('boAt BassHeads 100', 'Headphones', 399.00, 'In-Ear Wired Earphones'),
('Sony Bravia 43 inches 4K Ultra HD Smart LED TV', 'Televisions', 42999.00, '4K HDR, Google Assistant, Netflix, Amazon Prime Video'),
('HP Pavilion Gaming Ryzen 5 Hexa Core 4600H - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce GTX 1650)', 'Laptops', 62990.00, '15.6 inches, Shadow Black'),
('Canon EOS 200D II DSLR Camera', 'Cameras', 55995.00, 'EF-S 18-55mm f/4-5.6 IS STM Lens, 24.1 MP, 3 inch LCD'),
('Bajaj 20 L Grill Microwave Oven', 'Kitchen Appliances', 6090.00, '20L Capacity, Mechanical Knob Control, Timer, Defrost'),
('Whirlpool 265 L 3 Star Inverter Frost-Free Double Door Refrigerator', 'Home Appliances', 25490.00, 'Convertible Freezer, 3 Star, Intellisense Inverter Technology'),
('LG 1.5 Ton 5 Star Inverter Split AC', 'Air Conditioners', 42990.00, 'Dual Inverter Compressor, Ocean Black Fin, Low Gas Detection'),
('LG Fully Automatic Front Load 8 Kg Washing Machine', 'Washing Machines', 34990.00, 'In-built Heater, Silver');

-- Inserting values into Users table
INSERT INTO users (username, password, email, address, phone)
VALUES
('Rahul Sharma', 'password1', 'rahul@example.com', '123, ABC Street, Mumbai', '9876543210'),
('Priya Patel', 'password2', 'priya@example.com', '456, XYZ Road, Delhi', '9876543211'),
('Amit Kumar', 'password3', 'amit@example.com', '789, LMN Avenue, Bangalore', '9876543212'),
('Anjali Singh', 'password4', 'anjali@example.com', '567, PQR Lane, Kolkata', '9876543213'),
('Vikram Singhania', 'password5', 'vikram@example.com', '890, UVW Nagar, Chennai', '9876543214'),
('Neha Gupta', 'password6', 'neha@example.com', '234, GHI Colony, Hyderabad', '9876543215'),
('Rajesh Khanna', 'password7', 'rajesh@example.com', '678, STU Road, Pune', '9876543216'),
('Pooja Mehta', 'password8', 'pooja@example.com', '901, WXY Street, Ahmedabad', '9876543217'),
('Sachin Sharma', 'password9', 'sachin@example.com', '345, DEF Avenue, Jaipur', '9876543218'),
('Geeta Verma', 'password10', 'geeta@example.com', '123, JKL Lane, Lucknow', '9876543219')
;


-- Inserting values into Cart table
INSERT INTO cart (user_id, product_id, quantity, created_at)
VALUES
(1, 1, 1, NOW()),
(2, 3, 2, NOW()),
(3, 5, 1, NOW()),
(4, 7, 3, NOW()),
(5, 9, 1, NOW()),
(6, 2, 1, NOW()),
(7, 4, 2, NOW()),
(8, 6, 1, NOW()),
(9, 8, 2, NOW()),
(10, 10, 1, NOW())
;

-- Inserting values into Orders table
INSERT INTO orders (user_id, product_id, quantity, total_amount, order_date, status)
VALUES
(1, 1, 1, 15999.00, NOW(), 'shipped'),
(2, 3, 2, 798.00, NOW(), 'delivered'),
(3, 5, 1, 62990.00, NOW(), 'pending'),
(4, 7, 3, 12270.00, NOW(), 'shipped'),
(5, 9, 1, 42990.00, NOW(), 'delivered'),
(6, 2, 1, 3499.00, NOW(), 'delivered'),
(7, 4, 2, 85998.00, NOW(), 'shipped'),
(8, 6, 1, 55995.00, NOW(), 'pending'),
(9, 8, 2, 50980.00, NOW(), 'delivered'),
(10, 10, 1, 34990.00, NOW(), 'shipped')
;

-- Inserting values into Reviews table
INSERT INTO reviews (product_id, user_id, review_text, review_date, rating)
VALUES
(1, 1, 'Great phone, love the camera quality!', NOW(), 5),
(3, 2, 'Good sound quality, comfortable to wear.', NOW(), 4),
(5, 3, 'Fast performance, great for gaming.', NOW(), 5),
(7, 4, 'Easy to use, good value for money.', NOW(), 4),
(9, 5, 'Cooling is effective, saves energy.', NOW(), 5),
(2, 6, 'Useful features, good battery life.', NOW(), 4),
(4, 7, 'Amazing picture quality, great smart features.', NOW(), 5),
(6, 8, 'Easy to use, captures great photos.', NOW(), 5),
(8, 9, 'Spacious, keeps food fresh for long.', NOW(), 4),
(10, 10, 'Cleans clothes effectively, easy to operate.', NOW(), 5)
;

-- Inserting values into Images table
INSERT INTO images (product_id, image_url)
VALUES
(1, 'image1.jpg'),
(2, 'image2.jpg'),
(3, 'image3.jpg'),
(4, 'image4.jpg'),
(5, 'image5.jpg'),
(6, 'image6.jpg'),
(7, 'image7.jpg'),
(8, 'image8.jpg'),
(9, 'image9.jpg'),
(10, 'image10.jpg');


-- 1. Retrieve all product names and prices.
SELECT name, price FROM Products;

-- 2. Update the price of a product.
UPDATE Products SET price = 16999.00 WHERE product_id = 1;
SELECT * FROM Products WHERE product_id = 1;

-- 3. Delete a product from the Products table.

SELECT cart_id FROM Cart WHERE product_id = 2;
DELETE FROM Cart WHERE product_id = 2;
DELETE FROM Images WHERE product_id = 2;
DELETE FROM Orders WHERE product_id = 2;
DELETE FROM Reviews WHERE product_id = 2;
DELETE FROM Products WHERE product_id = 2;
SELECT * FROM Products;

-- 4. Add a new user to the Users table.
INSERT INTO Users (username, password, email, address, phone)
VALUES ('Rajesh Kumar', 'password123', 'rajesh.kumar@example.com', '456 Park Avenue, City', '9876543210');
SELECT * from Users;

-- 5. Retrieve all products with a price greater than 5000.
SELECT * FROM Products WHERE price > 5000;

-- 6. Update the quantity of a product in the Cart table.
UPDATE Cart SET quantity = 2 WHERE cart_id = 1;
SELECT * from Cart;

-- 7. Delete a user from the Users table.
DELETE FROM Cart WHERE user_id = 3;
DELETE FROM Orders WHERE user_id = 3;
DELETE FROM Reviews WHERE user_id = 3;
DELETE FROM Users WHERE user_id = 3;
SELECT * from Users;

-- 8. Retrieve the total amount of a specific order.
SELECT * from products;
SELECT Products.name AS product_name, 
       SUM(Orders.quantity * Products.price) AS total_amount
FROM Products
JOIN Orders ON Products.product_id = Orders.product_id
WHERE Orders.order_id = 4;


-- 9. Retrieve the total number of users.
SELECT COUNT(*) AS total_users FROM Users;

-- 10. Retrieve all products in a specific category.
SELECT * FROM Products WHERE category = 'Mobile Phones';

-- 11. Update the status of an order.
UPDATE Orders SET status = 'shipped' WHERE order_id = 1;
SELECT * from orders where order_id = 1;

-- 12. Retrieve the total number of orders placed by user 4 .
INSERT INTO Orders (user_id, product_id, quantity, total_amount, order_date, status)
VALUES (4, 1, 2, 400.00, NOW(), 'pending');
SELECT u.user_id, u.username, u.email, u.address, u.phone, COUNT(o.order_id) AS total_orders
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
WHERE u.user_id = 4
GROUP BY u.user_id;


-- 13. Retrieve the average price of products in a specific category.
SELECT category, AVG(price) AS avg_price
FROM Products
WHERE category = 'Laptops';


-- 14. Retrieve the username and email of users who have placed orders.
SELECT Users.username, Users.email FROM Users
JOIN Orders ON Users.user_id = Orders.user_id;

-- 15. Retrieve the total quantity of a specific product in the Cart table.
SELECT p.name AS product_name, SUM(c.quantity) AS total_quantity
FROM Cart c
JOIN Products p ON c.product_id = p.product_id
WHERE c.product_id = 1;

-- 16. Retrieve all products ordered by a user.
SELECT u.user_id, u.username, p.name AS product_name
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Products p ON o.product_id = p.product_id
WHERE o.user_id = 1;


-- 17. Retrieve the username and total amount of orders placed by each user.
SELECT Users.username, SUM(Products.price * Orders.quantity) AS total_amount FROM Users
JOIN Orders ON Users.user_id = Orders.user_id
JOIN Products ON Orders.product_id = Products.product_id
GROUP BY Users.username;

-- 18. Retrieve the username and phone number of users whose email contains 'gmail'.
UPDATE Users SET email = 'rahul.sharma@gmail.com' WHERE user_id = 1;
UPDATE Users SET email = 'priya.patel@gmail.com' WHERE user_id = 2;
UPDATE Users SET email = 'anjali.singh@gmail.com' WHERE user_id = 4;
UPDATE Users SET email = 'vikram@nmims.in' WHERE user_id = 5;
UPDATE Users SET email = 'neha.gupta@gmail.com' WHERE user_id = 6;
UPDATE Users SET email = 'rajesh.khanna@nmims.in' WHERE user_id = 7;
UPDATE Users SET email = 'pooja.mehta@gmail.com' WHERE user_id = 8;
UPDATE Users SET email = 'sachin.sharma@gmail.com' WHERE user_id = 9;
UPDATE Users SET email = 'geeta.verma@gmail.com' WHERE user_id = 10;
UPDATE Users SET email = 'rajesh.kumar@nmims.in' WHERE user_id = 11;

SELECT username, phone FROM Users WHERE email LIKE '%nmims%';


INSERT INTO Products (name, category, price, description, stock_quantity)
VALUES 
('Sony WH-1000XM4 Wireless Noise Cancelling Headphones', 'Headphones', 349.99, 'Industry-leading noise canceling with Dual Noise Sensor technology', 50),
('Apple Watch Series 7', 'Wearable Devices', 399.00, 'Always-on Retina display, full-screen keyboard, and new workout types', 30),
('Samsung Odyssey G9 49" Curved Gaming Monitor', 'Monitors', 1499.99, 'Dual QHD display, 240Hz refresh rate, 1ms response time', 20),
('Dell XPS 13 9310 Laptop', 'Laptops', 1399.99, '11th Gen Intel Core i7, 16GB RAM, 512GB SSD, 13.4" 4K UHD+ Touch Display', 15),
('Sony A7 III Mirrorless Camera', 'Cameras', 1798.00, '24.2MP full-frame sensor, 4K video, 693-point autofocus', 25),
('Bose SoundLink Color Bluetooth Speaker II', 'Speakers', 129.00, 'Water-resistant design, up to 8 hours of play time', 40),
('Apple MacBook Pro 16" (M1 Pro)', 'Laptops', 2399.00, 'Apple M1 Pro chip, 16-core GPU, 16GB RAM, 512GB SSD', 10),
('LG C1 65" OLED 4K Smart TV', 'Televisions', 2296.99, 'Self-lit OLED, a9 Gen4 AI Processor 4K, Dolby Vision IQ and Dolby Atmos', 5),
('Canon EOS R5 Mirrorless Camera', 'Cameras', 3899.00, '45MP full-frame sensor, 8K RAW video recording, Dual Pixel CMOS AF II', 8),
('Samsung Galaxy Tab S8 Ultra', 'Tablets', 1199.99, '14.6" 120Hz AMOLED display, Snapdragon 8 Gen 1, S Pen included', 12);
-- 19. Retrieve the total number of products in each category.
SELECT category, COUNT(*) AS total_products FROM Products GROUP BY category;

-- 20. Retrieve the average price, total quantity ordered, and total revenue for each product.
SELECT Products.name, AVG(Products.price) AS avg_price, SUM(Orders.quantity) AS total_quantity,
       SUM(Products.price * Orders.quantity) AS total_revenue
FROM Products
JOIN Orders ON Products.product_id = Orders.product_id
GROUP BY Products.name;








