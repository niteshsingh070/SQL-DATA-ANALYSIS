create database pizzahurt;
SELECT * FROM pizzahurt.pizzas;
SELECT * FROM pizzahurt.order_details;
SELECT * FROM pizzahurt.orders;
SELECT * FROM pizzahurt.pizza_types;

-- Retrieve the total number of orders placed.
select count(order_id) from pizzahurt.order_details;
select count(order_id) from pizzahurt.orders;

-- 2.Calculate the total revenue generated from pizza sales
SELECT 
    ROUND(SUM(pizzahurt.order_details.quantity * pizzahurt.pizzas.price),
            2) AS ts
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
-- 3.Identify the highest-priced pizza.
SELECT 
    pizzahurt.pizza_types.name, pizzahurt.pizzas.price
FROM
    pizzahurt.pizza_types
        JOIN
    pizzahurt.pizzas ON pizzahurt.pizza_types.pizza_type_id = pizzahurt.pizzas.pizza_id
ORDER BY pizzahurt.pizzas.price DESC
LIMIT 1;

-- 4.Identify the most common pizza size ordered.
SELECT 
    pizzas.size, COUNT(order_details.order_details_id)
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size;


-- 5. List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time);

select *from pizzahurt;
SHOW DATABASES;
USE your_database_name;
SHOW TABLES;

--  Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;

-- group the orders by date and calculate the average number of pizzas ordered per day.
 
 
SELECT 
    AVG(quantity)
FROM
    (SELECT 
        orders.date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.date) AS order_quantity;
    
 


