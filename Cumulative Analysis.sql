-- Calculate the total sales per month and the running total of sales over time

SELECT 
order_date, total_sales, 
SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales
FROM
(
SELECT 
DATETRUNC(month, order_date) AS order_date,
SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
) t


-- Calculate the total sales per Year and the running total of sales over time
SELECT 
order_date, total_sales, 
SUM(total_sales) OVER (PARTITION BY order_date ORDER BY order_date) AS running_total_sales
FROM
(
SELECT 
DATETRUNC(Year , order_date) AS order_date,
SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(Year, order_date)
) t


-- Add moving Average 
SELECT 
order_date, total_sales, 
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
Avg(avg_price) OVER (ORDER BY order_date) AS Moving_Avergae_Price
FROM
(
SELECT 
DATETRUNC(Year , order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(Year, order_date)
) t



