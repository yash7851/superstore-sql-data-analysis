# 📊 Superstore SQL Data Analysis Project

> SQL-based analysis of Superstore sales, profit, customers, products, regions, discounts, and shipping performance.

---

## 📌 Project Overview

This project analyzes the **Superstore sales dataset** using SQL to answer **40 business questions** related to sales, profit, customers, products, regions, categories, discounts, shipping, and time trends.

The objective is not only to write SQL queries, but to demonstrate how a Data Analyst can use SQL to move from:

**Raw Data → Business Questions → SQL Analysis → Insights → Business Decisions**

The project contains approximately **9,994 records** and covers transaction-level sales data.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Measure overall business performance.
- Analyze total sales and profit.
- Identify high-performing categories and sub-categories.
- Identify loss-making products and sub-categories.
- Analyze regional and state-level performance.
- Understand customer segment performance.
- Identify top customers and products.
- Analyze the relationship between discount and profitability.
- Analyze monthly and yearly sales trends.
- Evaluate shipping time.
- Practice advanced SQL concepts such as subqueries, joins, self joins, `CASE`, `HAVING`, and aggregations.
- Convert query results into meaningful business insights.

---

## 📂 Dataset Information

### Dataset

**Superstore Sales Dataset**

### Approximate Records

**9,994 rows**

### Key Business Fields

| Field | Description |
|---|---|
| `Order ID` | Unique order identifier |
| `Customer ID` | Customer identifier |
| `Customer Name` | Customer name |
| `Order Date` | Date when the order was placed |
| `Ship Date` | Date when the order was shipped |
| `Ship Mode` | Shipping method |
| `Segment` | Customer segment |
| `Category` | Product category |
| `Sub-Category` | Product sub-category |
| `Product Name` | Product name |
| `Sales` | Sales amount |
| `Profit` | Profit generated |
| `Discount` | Discount applied |
| `Quantity` | Quantity sold |
| `Region` | Sales region |
| `State` | Customer/order state |
| `City` | Customer/order city |

---

## 🛠️ Tools & Technologies

### Database & SQL

- **MySQL**
- **MySQL Workbench**
- SQL

### Data Source / File Format

- CSV
- Superstore dataset

### SQL Concepts Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- `COUNT()`
- `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `ROUND()`
- `CASE`
- `LIMIT`
- `OFFSET`
- Date functions
- `DATEDIFF()`
- `DATE_FORMAT()`
- `YEAR()`
- Subqueries
- Derived tables
- `JOIN`
- `SELF JOIN`
- Aggregations
- Business KPI calculations

---

## 🗄️ Database Structure

```text
Database
└── superstore
        ├── Order Information
        ├── Customer Information
        ├── Product Information
        ├── Sales & Profit
        ├── Discount
        ├── Shipping Information
        └── Geographic Information

## 📋 Business Questions & Analytical Scope

The analysis is structured around **40 business questions** designed to evaluate key areas of business performance and identify patterns within the Superstore dataset.

Rather than focusing only on SQL syntax, the questions are organized around **business performance, profitability, customer behavior, product performance, operational efficiency, and comparative analysis**.

### 📈 1. Business Performance & Profitability

Questions focused on understanding overall business performance and identifying major revenue and profit drivers.

* Overall Sales, Profit, Orders and Customers
* Average Order Value
* Category-level Sales and Profit
* Regional Sales and Profit
* Customer Segment profitability
* Sub-category Sales and profitability
* State-level Sales and Profit
* Top and bottom-performing business areas

### 👥 2. Customer & Product Performance

Questions focused on identifying high-value customers, products, and areas contributing to business performance.

* Top customers by Sales
* Customers with the highest order activity
* Top Products by Sales
* Top Products by Profit
* Loss-making Products
* Products generating both high Sales and high Profit
* Customers performing above average
* Products performing above average

### 💰 3. Discount & Profitability Analysis

Questions designed to understand how discount levels relate to profitability.

* Discount versus Profitability
* High-discount transactions
* High-discount transactions with negative Profit
* Profit-status classification
* Sales-band classification
* Loss-making sub-categories

### 🌎 4. Geographic & Regional Analysis

Questions focused on identifying geographic differences in business performance.

* Highest-sales Region
* Highest-profit Region
* Highest-sales State
* Lowest-profit State
* Second-highest Sales State
* Region-level Sales and Profit comparison
* State-level performance benchmarking

### 🚚 5. Shipping & Operational Analysis

Questions focused on evaluating shipping performance and operational patterns.

* Ship Mode performance by Sales
* Ship Mode performance by Profit
* Average shipping delay
* Orders taking more than four days to ship

### 📅 6. Time-Based Analysis

Questions focused on understanding sales patterns over time.

* Monthly Sales Trend
* Yearly Sales Trend
* Time-based business performance

### 🔍 7. Advanced SQL & Comparative Analysis

The project also applies SQL techniques to answer comparative and benchmark-based business questions.

* Subqueries for above-average comparisons
* Derived tables for aggregated analysis
* `JOIN` for comparing Sales and Profit
* `SELF JOIN` for identifying customers with multiple orders
* Aggregate benchmarking
* Conditional classification using `CASE`
* Second-highest performance analysis
* Top-N analysis

### 📊 8. Executive-Level Metrics

The analysis concludes with high-level business metrics derived from the underlying transactional data, including:

* Total Sales
* Total Profit
* Total Orders
* Total Customers
* Average Order Value
* Profit Margin

These metrics are used to provide a consolidated view of the business performance analyzed in the project.



## 💡 Key Insights

Based on the analysis results included in the SQL project:

### 1. Technology Leads Sales

Technology is identified as the highest-selling category, with approximately **$836.2K in sales**, representing around **36% of total sales** in the analyzed results.

### 2. Regional Performance

The **West region** is identified as the strongest region by sales, with approximately **$725.5K in sales** in the project analysis.

### 3. Consumer Segment Drives Profit

The **Consumer segment** is identified as a major profit contributor, with approximately **$419.7K in profit** in the analyzed results.

### 4. Tables Shows Significant Losses

The **Tables sub-category** is identified as a major loss-making sub-category, with approximately **$72.5K in loss**.

### 5. California Leads State Sales

California is identified as the leading state by sales among the states analyzed in the project.

### 6. Overall Business Performance

The project analysis reports approximately:

- **Total Sales:** $2.297M
- **Total Profit:** $544.9K
- **Profit Margin:** 23.72%

> **Note:** The figures above reflect the results documented in this project. They should be interpreted within the dataset and query logic used.

---


## 🔄 Analytical Workflow

```text
Superstore Dataset
        ↓
Import CSV into MySQL
        ↓
Create Database & Table
        ↓
Explore Transaction Data
        ↓
Create Business Questions
        ↓
Write SQL Queries
        ↓
Aggregate & Compare Results
        ↓
Identify Patterns
        ↓
Generate Business Insights
        ↓
Executive Summary
```

---




## 👤 Author

**Yash Angnani**  
BCA Student | Aspiring Data Analyst

**Skills:** SQL · MySQL · Excel · Python · Power BI · Data Analytics
