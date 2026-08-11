# 🍕 Restaurant Revenue Analysis (SQL Project)

## 📌 Project Overview

This project analyzes Domino’s pizza sales data using SQL to uncover insights related to customer ordering patterns, product performance, and revenue trends. The goal is to transform raw transactional data into meaningful business insights using structured querying techniques.

## 🗂️ Dataset Description

The dataset is organized into four relational tables:

* **orders** – contains order date and time
* **order_details** – includes quantity and pizza IDs
* **pizzas** – stores size and pricing information
* **pizza_types** – defines pizza names and categories

## ⚙️ Tools & Technologies

* MySQL
* SQL (Joins, Aggregations, Window Functions, CTEs, Views)
* PowerPoint (for presentation)

## 🧠 SQL Concepts Used

* SELECT queries for data extraction
* INNER JOIN for combining multiple tables
* GROUP BY & ORDER BY for aggregation and sorting
* Aggregate functions (SUM, COUNT, AVG)
* Window functions (ROW_NUMBER, SUM OVER)
* CTEs and Views for structured analysis
* Revenue and percentage calculations

## ❓ Business Questions Solved

1. What is the total number of orders placed?
2. What are the top 5 most ordered pizza types?
3. What is the total quantity ordered per pizza category?
4. What is the category-wise distribution of pizzas?
5. What is the average number of pizzas ordered per day?
6. What percentage does each pizza type contribute to total revenue?
7. How does cumulative revenue grow over time?
8. What is the most commonly ordered pizza size?
9. Which pizza is the highest priced?
10. What is the total revenue generated?
11. What is the hourly distribution of orders?

## 📊 Key Insights

* Large-sized pizzas are the most preferred among customers
* A few categories contribute significantly to total sales volume
* Revenue follows a concentration pattern (majority from few items)
* Peak demand occurs during lunch and evening hours
* Sales show steady cumulative growth over time
* Premium pizzas generate higher revenue despite fewer orders

## 💰 Revenue Analysis

Revenue is calculated as:

```id="9shgqj"
price × quantity
```

* Total revenue is aggregated across all orders
* Cumulative revenue is computed using window functions
Sales show steady cumulative growth over time
Premium pizzas generate higher revenue despite fewer orders
💰 Revenue Analysis
Revenue is calculated as:

price × quantity
Total revenue is aggregated across all orders
Cumulative revenue is computed using window functions
