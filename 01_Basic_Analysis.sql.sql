USE pizzahut;

-- Q1. Retrieve the total number of orders placed.

SELECT COUNT(*) AS total_orders
FROM orders;


-- Q2. Calculate the total revenue generated from pizza sales.

SELECT
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id;
    

-- Q3. Identify the highest-priced pizza.

SELECT
    pizza_id,
    price
FROM pizzas
ORDER BY price DESC
LIMIT 1;



-- Q4. Identify the most common pizza size ordered.

SELECT
    p.size,
    COUNT(od.order_details_id) AS total_orders
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_orders DESC
LIMIT 1;


-- Q5. Find the top 5 most ordered pizza types by quantity.

SELECT
    pt.name AS pizza_name,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;





