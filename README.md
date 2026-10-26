  # 🍕 Pizza Hut Sales Analysis Using MySQL
  
  ## 📌 Project Overview
  
  This project analyzes Pizza Hut sales data using MySQL to explore sales performance, customer ordering patterns, product demand, and revenue trends.
  
  The project addresses 13 business questions using SQL queries ranging from basic aggregations to advanced analytical techniques.
  
  ## 🎯 Project Objectives
  
  * Analyze overall orders and sales revenue.
  * Identify popular pizza sizes and types.
  * Examine sales across pizza categories.
  * Understand hourly ordering patterns.
  * Calculate daily average pizza quantities.
  * Analyze revenue contribution and cumulative revenue.
  * Rank top-performing pizzas within each category.
  
  ## 🗄️ Database Structure
  
  The project uses four relational tables:
  
  | Table           | Description                              |
  | --------------- | ---------------------------------------- |
  | `orders`        | Order IDs, dates, and times              |
  | `order_details` | Order details, pizza IDs, and quantities |
  | `pizzas`        | Pizza IDs, types, sizes, and prices      |
  | `pizza_types`   | Pizza names, categories, and ingredients |
  
  ### Table Relationships
  
  * `orders.order_id` connects to `order_details.order_id`.
  * `order_details.pizza_id` connects to `pizzas.pizza_id`.
  * `pizzas.pizza_type_id` connects to `pizza_types.pizza_type_id`.
  
  ## 🛠️ Tools and Technologies
  
  * MySQL
  * MySQL Workbench
  * SQL
  
  ## 📊 Business Questions
  
  ### Basic Analysis
  
  1. Retrieve the total number of orders placed.
  2. Calculate total revenue generated from pizza sales.
  3. Identify the highest-priced pizza.
  4. Identify the most commonly ordered pizza size.
  5. Find the five most ordered pizza types by quantity.
  
  ### Intermediate Analysis
  
  6. Calculate the total quantity ordered for each pizza category.
  7. Analyze the distribution of orders by hour.
  8. Determine the number of pizza types in each category.
  9. Calculate the average number of pizzas ordered per day.
  10. Identify the top three pizza types by revenue.
  
  ### Advanced Analysis
  
  11. Calculate each pizza type's percentage contribution to total revenue.
  12. Analyze cumulative revenue over time.
  13. Identify the top three revenue-generating pizza types within each category.
  
  ## 🧠 SQL Concepts Used
  
  * Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
  * Filtering and sorting
  * `GROUP BY` and `ORDER BY`
  * INNER JOINs
  * Subqueries and derived tables
  * Common Table Expressions (CTEs)
  * Window functions: `SUM() OVER()` and `DENSE_RANK()`
  * Date and time functions
  
  ## 📁 Project Files
  
  | File                           | Description                                                 |
  | ------------------------------ | ----------------------------------------------------------- |
  | `01_Database_Setup.sql`        | Database setup, table definitions, and verification queries |
  | `02_Basic_Analysis.sql`        | Basic sales analysis queries                                |
  | `03_Intermediate_Analysis.sql` | Intermediate business analysis queries                      |
  | `04_Advanced_Analysis.sql`     | Advanced revenue and ranking queries                        |
  
  ## 🚀 How to Run the Project
  
  1. Install MySQL Server and MySQL Workbench.
  2. Download or clone this repository.
  3. Open the SQL scripts in MySQL Workbench.
  4. Execute the database setup script.
  5. Import the four source datasets into their respective tables.
  6. Run the analysis scripts in order.
  
  **Note:** Update the setup script if your local table structures differ. Import the datasets before running the analysis queries.
  
  ## 📈 Results and Insights
  
  The analysis investigates product performance, category demand, ordering patterns, and revenue trends.
  
  Verified numerical findings and business recommendations will be documented here after validating the query results against the dataset.
  
  ## 👨‍💻 Author
  
  **Viren Adgale**
