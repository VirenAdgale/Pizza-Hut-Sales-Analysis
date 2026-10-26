
-- Q6. Find the total quantity of pizzas ordered in each category.

SELECT
    pt.category,
    SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;




-- Q7. Determine the distribution of orders by hour.

SELECT
    HOUR(order_time) AS order_hour,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY HOUR(order_time)
ORDER BY order_hour;



-- Q8. Join relevant tables to find the category-wise distribution of pizzas.

SELECT
    pt.category,
    COUNT(pt.pizza_type_id) AS total_pizza_types
FROM pizza_types pt
GROUP BY pt.category
ORDER BY total_pizza_types DESC;


-- Q9. Group orders by date and calculate the average number of pizzas ordered per day.

SELECT
    ROUND(AVG(daily_quantity), 2) AS avg_pizzas_per_day
FROM (
    SELECT
        o.order_date,
        SUM(od.quantity) AS daily_quantity
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    GROUP BY o.order_date
) AS daily_sales;

select * from orders;



-- Q10. Determine the top 3 most ordered pizza types based on revenue.

SELECT
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;




