-- =====================================================
-- Project: Pizza Hut Sales Analysis
-- Database: MySQL
-- Purpose: Database and table setup
-- =====================================================

CREATE DATABASE IF NOT EXISTS pizzahut;
USE pizzahut;


-- =====================================================
-- 1. Create Orders Table
-- =====================================================

CREATE TABLE IF NOT EXISTS orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    PRIMARY KEY (order_id)
);


-- =====================================================
-- 2. Create Order Details Table
-- =====================================================

CREATE TABLE IF NOT EXISTS order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id TEXT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_details_id)
);


-- =====================================================
-- 3. Create Pizzas Table
-- =====================================================

CREATE TABLE IF NOT EXISTS pizzas (
    pizza_id TEXT,
    pizza_type_id TEXT,
    size TEXT,
    price DOUBLE DEFAULT NULL
);


-- =====================================================
-- 4. Create Pizza Types Table
-- =====================================================

CREATE TABLE IF NOT EXISTS pizza_types (
    pizza_type_id TEXT,
    name TEXT,
    category TEXT,
    ingredients TEXT
);


-- =====================================================
-- 5. Verify Tables
-- =====================================================

SHOW TABLES;


-- =====================================================
-- 6. Verify Row Counts
-- =====================================================

SELECT 'orders' AS table_name, COUNT(*) AS total_rows
FROM orders

UNION ALL

SELECT 'order_details', COUNT(*)
FROM order_details

UNION ALL

SELECT 'pizzas', COUNT(*)
FROM pizzas

UNION ALL

SELECT 'pizza_types', COUNT(*)
FROM pizza_types;


-- =====================================================
-- 7. Verify Order Details IDs
-- =====================================================

SELECT
    MIN(order_details_id) AS first_id,
    MAX(order_details_id) AS last_id,
    COUNT(DISTINCT order_details_id) AS unique_ids
FROM order_details;
