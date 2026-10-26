
-- Q11. Calculate the percentage contribution of each pizza type to total revenue.

SELECT
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue,
    ROUND(
        SUM(od.quantity * p.price) * 100.0 /
        (SELECT SUM(od2.quantity * p2.price)
         FROM order_details od2
         JOIN pizzas p2
             ON od2.pizza_id = p2.pizza_id),
        2
    ) AS revenue_percentage
FROM order_details od
JOIN pizzas p
    ON od.pizza_id = p.pizza_id
JOIN pizza_types pt
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;




-- Q12. Analyze the cumulative revenue generated over time.

WITH daily_revenue AS (
    SELECT
        o.order_date,
        SUM(od.quantity * p.price) AS revenue
    FROM orders o
    JOIN order_details od
        ON o.order_id = od.order_id
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    GROUP BY o.order_date
)
SELECT
    order_date,
    ROUND(revenue, 2) AS daily_revenue,
    ROUND(
        SUM(revenue) OVER (
            ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS cumulative_revenue
FROM daily_revenue
ORDER BY order_date;



-- Q13. Determine the top 3 revenue-generating pizza types in each category.

WITH pizza_revenue AS (
    SELECT
        pt.category,
        pt.name AS pizza_name,
        SUM(od.quantity * p.price) AS total_revenue
    FROM order_details od
    JOIN pizzas p
        ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt
        ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY
        pt.category,
        pt.name
),
ranked_pizzas AS (
    SELECT
        category,
        pizza_name,
        total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS revenue_rank
    FROM pizza_revenue
)
SELECT
    category,
    pizza_name,
    ROUND(total_revenue, 2) AS total_revenue,
    revenue_rank
FROM ranked_pizzas
WHERE revenue_rank <= 3
ORDER BY category, revenue_rank;

