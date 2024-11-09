DROP TABLE IF EXISTS `pizza_restaurant`.`order_pizza`;
DROP TABLE IF EXISTS `pizza_restaurant`.`customer_order`;
DROP TABLE IF EXISTS `pizza_restaurant`.`pizza`;
DROP TABLE IF EXISTS `pizza_restaurant`.`order`;
DROP TABLE IF EXISTS `pizza_restaurant`.`customer`;

Use pizza_restaurant;
-- create database pizza_restaurant;
-- drop database pizza_restaurant;

CREATE TABLE `pizza_restaurant`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(100) NULL,
  `customer_phone` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`));
  
  CREATE TABLE `pizza_restaurant`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NULL,
  PRIMARY KEY (`order_id`));
  
CREATE TABLE `pizza_restaurant`.`pizza` (
  `pizza_id` INT NOT NULL,
  `pizza_type` VARCHAR(45) NULL,
  `pizza_price` DECIMAL(7,2) NULL,
  PRIMARY KEY (`pizza_id`));
  
  CREATE TABLE `pizza_restaurant`.`customer_order` (
  `customer_id` INT NOT NULL,
  `order_id` INT NOT NULL);
  
  CREATE TABLE `pizza_restaurant`.`order_pizza` (
  `order_id` INT NOT NULL,
  `pizza_id` INT NOT NULL);
  
  -- customer
  
insert into customer(customer_name, customer_phone)
values ('Trevor Page','226-555-4982');
  
insert into customer(customer_name, customer_phone)
values ('John Doe','555-555-9498');
  
-- order
  
insert into `order`(order_date)
values ('2023-9-10 09:47:00');
  
insert into `order`(order_date)
  values ('2023-9-10 13:20:00');
  
insert into `order`(order_date)
values ('2023-9-10 09:47:00');
  
insert into `order`(order_date)
values ('2023-10-10 10:37:00');
  
-- Pizzas
  
insert into `pizza`(pizza_id, pizza_type, pizza_price)
values (1, 'Pepperoni & Cheese', 7.99);
 
insert into `pizza`(pizza_id, pizza_type, pizza_price)
values (2, 'Vegetarian', 9.99);
  
insert into `pizza`(pizza_id, pizza_type, pizza_price)
values (3, 'Meat Lovers', 14.99);
  
insert into `pizza`(pizza_id, pizza_type, pizza_price)
values (4, 'Hawaiian', 12.99);
  
-- customer orders
  
insert into `customer_order`(customer_id, order_id)
values (1, 1);
  
insert into `customer_order`(customer_id, order_id)
values (2, 2);
  
insert into `customer_order`(customer_id, order_id)
values (1, 3);
 
insert into `customer_order`(customer_id, order_id)
values (2, 4);
  
-- order pizza

	insert into `order_pizza`(order_id, pizza_id)
	values (1, 1);
	insert into `order_pizza`(order_id, pizza_id)
	values (1, 3);

    insert into `order_pizza`(order_id, pizza_id)
    values (2, 2);
    insert into `order_pizza`(order_id, pizza_id)
	values (2, 3);
    insert into `order_pizza`(order_id, pizza_id)
	values (2, 3);
	
	insert into `order_pizza`(order_id, pizza_id)
	values (3, 3);
    insert into `order_pizza`(order_id, pizza_id)
	values (3, 4);
	
	insert into `order_pizza`(order_id, pizza_id)
	values (4, 2);
    insert into `order_pizza`(order_id, pizza_id)
	values (4, 2);
    insert into `order_pizza`(order_id, pizza_id)
	values (4, 2);
    insert into `order_pizza`(order_id, pizza_id)
	values (4, 4);
  
	select customer_name,sum(pizza_price) from customer c
	join customer_order co on c.customer_id = co.customer_id
	join `order` o on co.order_id = o.order_id
	join order_pizza op on o.order_id = op.order_id
	join pizza p on p.pizza_id = op.pizza_id
	group by c.customer_id;
	  
	select c.customer_name, date(o.order_date) as order_date, sum(p.pizza_price) as total_spent from customer c
	join customer_order co on c.customer_id = co.customer_id
	join `order` o on co.order_id = o.order_id
	join order_pizza op on o.order_id = op.order_id
	join pizza p on p.pizza_id = op.pizza_id
	group by c.customer_id, date(o.order_date)
	order by c.customer_name, order_date;
  