
-- Total Revenue and Profit
SELECT 
    ROUND(SUM(Sales)) AS total_revenue,
    ROUND(SUM(Profit)) AS total_profit
FROM orders;

-- Total Revenue: 1536107
-- Total Profit: 172933


-- Revenue and Profit by Region
SELECT 
    Region,
    ROUND(SUM(Sales)) AS revenue,
    ROUND(SUM(Profit)) AS profit
FROM orders
GROUP BY Region
ORDER BY revenue DESC;

/* 
The West Region has the higher revenue and profit, followed by the East, Central and South Regions
*/


-- Profit Margin by Category

SELECT 
    Category,
    ROUND(SUM(Sales)) AS revenue,
    ROUND(SUM(Profit)) AS profit,
    ROUND(SUM(Profit)) / ROUND(SUM(Sales)) AS profit_margin
FROM orders
GROUP BY Category;


/* 
Despite Office Supplies having the higher revenue, both Furniture and Technology has the higher profit and proft margin
*/


select * from orders limit 10;

-- Top 10 Products by Revenue
SELECT 
    `Product Name`,
    ROUND(SUM(Sales)) AS revenue
FROM orders
GROUP BY `Product Name`
ORDER BY revenue DESC
LIMIT 10;


-- Discount Impact
SELECT 
    Discount,
    AVG(Profit) AS avg_profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

