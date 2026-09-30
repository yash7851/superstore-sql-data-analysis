
/* ============================================================
   ============================================================
              SUPERSTORE SQL DATA ANALYSIS PROJECT
   ============================================================
   
   DATABASE  : superstore_db
   TABLE     : superstore
   RECORDS   : ~9,994
   
   SQL CONCEPTS COVERED:
   
   1. SELECT
   2. WHERE
   3. ORDER BY
   4. GROUP BY
   5. HAVING
   6. CASE
   7. JOINS
   8. SUBQUERIES
   9. AGGREGATION
   
   BUSINESS ANALYSIS:
   Sales | Profit | Customers | Orders | Products
   Category | Sub-Category | Region | State | Segment
   Discount | Shipping | Time Trend
   
   ============================================================
*/


/* ============================================================
   ========================= OVERVIEW ==========================
   ============================================================

   OBJECTIVE:

   Analyze Superstore sales data and answer 40 business
   questions using SQL.

   BUSINESS GOALS:

   1. Understand overall sales and profit.
   2. Identify high-performing categories.
   3. Identify loss-making products/sub-categories.
   4. Analyze regions, states and customer segments.
   5. Understand discount vs profitability.
   6. Analyze customers and products.
   7. Analyze sales trends over time.
   8. Analyze shipping performance.
   9. Convert SQL results into business insights.

   ============================================================
*/


USE superstore;


/* ============================================================
   QUESTION 01
   What are the overall Sales, Profit, Orders and Customers?
   
   CONCEPT:
   SELECT + COUNT DISTINCT + AGGREGATION
   ============================================================ */

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore;


/* ============================================================
   QUESTION 02
   What is the Average Order Value?
   
   Formula:
   Total Sales / Total Orders
   ============================================================ */

SELECT
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM superstore;


/* ============================================================
   QUESTION 03
   Which Category generates the highest Sales?
   
   CONCEPT:
   GROUP BY + SUM + ORDER BY
   ============================================================ */

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


/* ============================================================
   QUESTION 04
   Which Category generates the highest Profit?
   ============================================================ */

SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;


/* ============================================================
   QUESTION 05
   Which Region generates the highest Sales?
   ============================================================ */

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


/* ============================================================
   QUESTION 06
   Which Region generates the highest Profit?
   ============================================================ */

SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;


/* ============================================================
   QUESTION 07
   Which Customer Segment generates the highest Profit?
   
   CONCEPT:
   GROUP BY + AGGREGATION
   ============================================================ */

SELECT
    segment,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;


/* ============================================================
   QUESTION 08
   Which Sub-Category has the highest Sales?
   ============================================================ */

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 1;


/* ============================================================
   QUESTION 09
   Which Sub-Category is the least profitable?
   
   CONCEPT:
   ORDER BY ASC
   ============================================================ */

SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 1;


/* ============================================================
   QUESTION 10
   Which State has the highest Sales?
   ============================================================ */

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 1;


/* ============================================================
   QUESTION 11
   Which State has the lowest Profit?
   ============================================================ */

SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit ASC
LIMIT 1;


/* ============================================================
   QUESTION 12
   What are the Top 10 Products by Sales?
   
   CONCEPT:
   GROUP BY + ORDER BY + LIMIT
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


/* ============================================================
   QUESTION 13
   What are the Top 10 Products by Profit?
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


/* ============================================================
   QUESTION 14
   How does Discount affect Profitability?
   
   CONCEPT:
   GROUP BY + AVG + SUM
   ============================================================ */

SELECT
    discount,
    COUNT(*) AS total_records,
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY discount
ORDER BY discount;


/* ============================================================
   QUESTION 15
   How many orders have high discount and negative profit?
   
   Business condition:
   Discount >= 30%
   AND Profit < 0
   
   CONCEPT:
   WHERE
   ============================================================ */

SELECT
    COUNT(*) AS high_discount_loss_records
FROM superstore
WHERE discount >= 0.30
  AND profit < 0;


/* ============================================================
   QUESTION 16
   Which Ship Mode generates the highest Sales?
   ============================================================ */

SELECT
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;


/* ============================================================
   QUESTION 17
   Which Ship Mode generates the highest Profit?
   ============================================================ */

SELECT
    ship_mode,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY ship_mode
ORDER BY total_profit DESC;


/* ============================================================
   QUESTION 18
   What is the Monthly Sales Trend?
   
   CONCEPT:
   DATE_FORMAT + GROUP BY
   ============================================================ */

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;


/* ============================================================
   QUESTION 19
   What is the Yearly Sales Trend?
   ============================================================ */

SELECT
    YEAR(order_date) AS year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY year;


/* ============================================================
   QUESTION 20
   Who are the Top 10 Customers by Sales?
   ============================================================ */

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;


/* ============================================================
   QUESTION 21
   Which customers placed the highest number of orders?
   
   CONCEPT:
   COUNT DISTINCT
   ============================================================ */

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC
LIMIT 10;


/* ============================================================
   QUESTION 22
   Which Products generate both high Sales and high Profit?
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(sales) > 1000
   AND SUM(profit) > 100
ORDER BY total_profit DESC;


/* ============================================================
   QUESTION 23
   Which Products are generating losses?
   
   CONCEPT:
   GROUP BY + HAVING
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


/* ============================================================
   QUESTION 24
   Classify each record as:
   
   HIGH PROFIT
   LOW PROFIT
   LOSS
   
   CONCEPT:
   CASE
   ============================================================ */

SELECT
    order_id,
    product_name,
    profit,
    CASE
        WHEN profit > 100 THEN 'HIGH PROFIT'
        WHEN profit >= 0 THEN 'LOW PROFIT'
        ELSE 'LOSS'
    END AS profit_status
FROM superstore
LIMIT 100;


/* ============================================================
   QUESTION 25
   Classify Sales into Sales Bands.
   
   CONCEPT:
   CASE
   ============================================================ */

SELECT
    order_id,
    sales,
    CASE
        WHEN sales >= 1000 THEN 'HIGH SALES'
        WHEN sales >= 500 THEN 'MEDIUM SALES'
        ELSE 'LOW SALES'
    END AS sales_band
FROM superstore
LIMIT 100;


/* ============================================================
   QUESTION 26
   What is the Average Sales for each Category?
   
   CONCEPT:
   AVG + GROUP BY
   ============================================================ */

SELECT
    category,
    ROUND(AVG(sales), 2) AS average_sales
FROM superstore
GROUP BY category
ORDER BY average_sales DESC;


/* ============================================================
   QUESTION 27
   Which Sub-Categories are making losses?
   
   CONCEPT:
   HAVING
   ============================================================ */

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


/* ============================================================
   QUESTION 28
   Which records have BOTH high discount and loss?
   
   Business Question:
   Are high discounts associated with losses?
   ============================================================ */

SELECT
    order_id,
    product_name,
    discount,
    sales,
    profit
FROM superstore
WHERE discount >= 0.30
  AND profit < 0
ORDER BY profit ASC;


/* ============================================================
   QUESTION 29
   What is the average shipping delay?
   
   Formula:
   Ship Date - Order Date
   
   CONCEPT:
   DATEDIFF
   ============================================================ */

SELECT
    ROUND(AVG(DATEDIFF(ship_date, order_date)), 2)
        AS average_shipping_days
FROM superstore;


/* ============================================================
   QUESTION 30
   How many records took more than 4 days to ship?
   ============================================================ */

SELECT
    COUNT(*) AS shipments_over_4_days
FROM superstore
WHERE DATEDIFF(ship_date, order_date) > 4;


/* ============================================================
   QUESTION 31
   Which Products have Sales above the average product sales?
   
   SUBQUERY:
   First calculate average product sales.
   Then compare every product against it.
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY product_name
HAVING SUM(sales) >
(
    SELECT AVG(product_sales)
    FROM
    (
        SELECT
            product_name,
            SUM(sales) AS product_sales
        FROM superstore
        GROUP BY product_name
    ) AS product_summary
)
ORDER BY total_sales DESC;


/* ============================================================
   QUESTION 32
   Which States have Sales above the average State Sales?
   
   SUBQUERY
   ============================================================ */

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
HAVING SUM(sales) >
(
    SELECT AVG(state_sales)
    FROM
    (
        SELECT
            state,
            SUM(sales) AS state_sales
        FROM superstore
        GROUP BY state
    ) AS state_summary
)
ORDER BY total_sales DESC;


/* ============================================================
   QUESTION 33
   Which Customers have Sales above the average Customer Sales?
   
   SUBQUERY
   ============================================================ */

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY customer_id, customer_name
HAVING SUM(sales) >
(
    SELECT AVG(customer_sales)
    FROM
    (
        SELECT
            customer_id,
            SUM(sales) AS customer_sales
        FROM superstore
        GROUP BY customer_id
    ) AS customer_summary
)
ORDER BY total_sales DESC;


/* ============================================================
   QUESTION 34
   Which Category has the highest Profit?
   
   SUBQUERY
   ============================================================ */

SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
HAVING SUM(profit) =
(
    SELECT MAX(category_profit)
    FROM
    (
        SELECT
            category,
            SUM(profit) AS category_profit
        FROM superstore
        GROUP BY category
    ) AS category_summary
);


/* ============================================================
   QUESTION 35
   Which State has the SECOND highest Sales?
   
   SUBQUERY
   ============================================================ */

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 1 OFFSET 1;


/* ============================================================
   QUESTION 36
   JOIN:
   
   Compare Region Sales and Region Profit together.
   
   This creates two summaries and joins them using Region.
   
   CONCEPT:
   JOIN + AGGREGATION
   ============================================================ */

SELECT
    sales_summary.region,
    sales_summary.total_sales,
    profit_summary.total_profit
FROM
(
    SELECT
        region,
        ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY region
) AS sales_summary

JOIN
(
    SELECT
        region,
        ROUND(SUM(profit), 2) AS total_profit
    FROM superstore
    GROUP BY region
) AS profit_summary

ON sales_summary.region = profit_summary.region

ORDER BY sales_summary.total_sales DESC;


/* ============================================================
   QUESTION 37
   JOIN:
   
   Compare Category Sales and Category Profit.
   
   CONCEPT:
   JOIN + AGGREGATION
   ============================================================ */

SELECT
    sales_summary.category,
    sales_summary.total_sales,
    profit_summary.total_profit
FROM
(
    SELECT
        category,
        ROUND(SUM(sales), 2) AS total_sales
    FROM superstore
    GROUP BY category
) AS sales_summary

JOIN
(
    SELECT
        category,
        ROUND(SUM(profit), 2) AS total_profit
    FROM superstore
    GROUP BY category
) AS profit_summary

ON sales_summary.category = profit_summary.category

ORDER BY sales_summary.total_sales DESC;


/* ============================================================
   QUESTION 38
   SELF JOIN:
   
   Compare customers having multiple orders.
   
   CONCEPT:
   SELF JOIN
   
   Note:
   Same table is joined with itself using customer_id.
   ============================================================ */

SELECT DISTINCT
    a.customer_id,
    a.customer_name
FROM superstore AS a
JOIN superstore AS b
    ON a.customer_id = b.customer_id
   AND a.order_id <> b.order_id
ORDER BY a.customer_name;


/* ============================================================
   QUESTION 39
   Which are the Top 5 Most Profitable Sub-Categories?
   ============================================================ */

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 5;


/* ============================================================
   QUESTION 40
   EXECUTIVE SUMMARY:
   
   Return the major business KPIs in one result.
   
   CONCEPT:
   MULTIPLE AGGREGATIONS
   ============================================================ */

SELECT

    ROUND(SUM(sales), 2) AS total_sales,

    ROUND(SUM(profit), 2) AS total_profit,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT customer_id) AS total_customers,

    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage

FROM superstore;


/* ============================================================
                     BUSINESS INSIGHTS

   ============================================================ */


/* ------------------------------------------------------------
   INSIGHT 01
   TECHNOLOGY LEADS SALES
   
   observation:
   Technology is shown as the highest-selling category
   with approximately $836.2K in sales,
   representing around 36% of total sales.
   ------------------------------------------------------------ */




/* ------------------------------------------------------------
   INSIGHT 02
   WEST REGION TOPS SALES
   
   observation:
   West is shown with approximately $725.5K sales.
   East is shown with approximately $160.2K loss.
   ------------------------------------------------------------ */




/* ------------------------------------------------------------
   INSIGHT 03
   CONSUMER DRIVES PROFIT
   
   observation:
   Consumer is shown with approximately $419.7K profit.
   Home Office is shown with approximately $153.6K loss.
   ------------------------------------------------------------ */




/* ------------------------------------------------------------
   INSIGHT 04
   TABLES IS THE BIGGEST LOSS-MAKING SUB-CATEGORY
   
   observation:
   Tables is shown with approximately $72.5K loss.
   ------------------------------------------------------------ */


/* ------------------------------------------------------------
   INSIGHT 05
   CALIFORNIA LEADS SALES
   
   observation:
   California is shown as having the highest sales among
   the states displayed in the dashboard.
   ------------------------------------------------------------ */



/* ------------------------------------------------------------
   INSIGHT 06
   OVERALL PERFORMANCE
   
   observation:
   Total Sales  : $2,297.2K
   Total Profit : $544.9K
   Profit Margin: 23.72%
   ------------------------------------------------------------ */




/* ============================================================
   ============================================================
                     FINAL CONCLUSION
   ============================================================
   
   
   1. Technology is shown as the leading sales category.
   
   2. West is shown as the strongest sales region.
   
   3. Consumer is shown as the strongest profit-driving
      customer segment.
   
   4. Tables is shown as the largest loss-making
      sub-category.
   
   5. California is shown as the leading state by sales
      among the states displayed.
   
   6. Discount should be analyzed carefully because high
      discount transactions can be associated with lower
      profitability.
   
   7. Product-level and sub-category-level analysis can help
      identify loss-making products.
   
   8. Region, category and customer-segment analysis helps
      management understand where sales and profit are
      being generated.
   
   9. Time-series analysis can identify monthly and yearly
      sales trends.
   
   10. SQL converts raw transaction-level data into
       business-level insights.
   
   ============================================================
   
                     END OF PROJECT
   
   ============================================================
*/