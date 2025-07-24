Select 
Year(order_date) as Order_Year,
Month(order_date) as Order_Month,
SUM(Sales_amount) as Total_Sales,
COUNT(Distinct customer_key) as Total_customer, 
SUM(quantity) as Total_Quantity 

From gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY Year(order_date), Month(order_date)
ORDER BY Year(order_date), Month(order_date)

Select 
Format(order_date, 'yyyy-MMM') as Order_date,
SUM(Sales_amount) as Total_Sales,
COUNT(Distinct customer_key) as Total_customer, 
SUM(quantity) as Total_Quantity 
From gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY Format(order_date, 'yyyy-MMM')
ORDER BY Format(order_date, 'yyyy-MMM')

-- How many new customers were added each year 

SELECT 
    YEAR(create_date) AS create_year,
    COUNT(customer_key) AS total_customer
FROM gold.dim_customers
WHERE create_date IS NOT NULL
GROUP BY YEAR(create_date)
ORDER BY YEAR(create_date);

