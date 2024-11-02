create database pizza_order_DB2;

USE pizza_order_DB2;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
	customer_id INT NOT NULL,     
    dish_id INT NOT NULL,
    order_date_time DATETIME, 						
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DROP TABLE IF EXISTS pizzas;

CREATE TABLE pizzas (
	dish_id INT PRIMARY KEY,
	dish_name VARCHAR(100) NOT NULL,
    dish_price DECIMAL(4, 2)
);

INSERT INTO customers (customer_id, customer_name, phone_number)
VALUES (1, 'Trevor Page', '226-555-4982'),
       (2, 'John Doe', '555-555-9498');

INSERT INTO orders (customer_id, dish_id, order_date_time)
VALUES (1, 11, '2023/9/10 9:47:00'),
       (1, 13, '2023/9/10 9:47:00'),
       (2, 12, '2023/9/10 13:20:00'),
       (2, 13, '2023/9/10 13:20:00'),
       (2, 13, '2023/9/10 13:20:00'),
       (1, 13, '2023/9/10 9:47:00'),
       (1, 14, '2023/9/10 9:47:00'),
       (2, 12, '2023/10/10 10:37:00'),
       (2, 12, '2023/10/10 10:37:00'),
       (2, 12, '2023/10/10 10:37:00'),
       (2, 14, '2023/10/10 10:37:00');

INSERT INTO pizzas (dish_id, dish_name, dish_price)
VALUES (11, 'Pepperoni & Cheese', 7.99),
       (12, 'Vegetarian', 9.99),
       (13, 'Meat Lovers', 14.99),
       (14, 'Hawaiian ', 12.99);


-- *** Q4 query ***

SELECT 
	customers.customer_name, 
    SUM(pizzas.dish_price) AS total_amount
FROM 
	customers 
JOIN 
	orders ON customers.customer_id = orders.customer_id
JOIN 
	pizzas ON orders.dish_id = pizzas.dish_id
GROUP BY 
	customers.customer_name;
    

-- *** Q5 query ***

SELECT 
	customers.customer_name, 
    (SELECT DATE(orders.order_date_time)) AS date_only, 
    SUM(pizzas.dish_price) AS total_amount
FROM 
	customers 
JOIN 
	orders ON customers.customer_id = orders.customer_id
JOIN 
	pizzas ON orders.dish_id = pizzas.dish_id
GROUP BY 
	customers.customer_name, orders.order_date_time;