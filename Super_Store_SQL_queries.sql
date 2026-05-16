/*
===========================================================
SUPERSTORE SALES ANALYSIS

Description:
This SQL analysis explores retail sales performance using
the Superstore dataset. The queries focus on:

- Total revenue and profit
- Regional sales performance
- Profitability by product category
- Top-performing products
- Discount impact on profitability

The objective of this analysis is to identify trends,
measure business performance, and uncover insights that
can support data-driven decision-making.
===========================================================
*/


/*
===========================================================
1. TOTAL REVENUE AND TOTAL PROFIT
Purpose:
Calculates the overall sales revenue and total profit
generated across all orders in the dataset.

Business Insight:
Provides a high-level overview of overall business
performance and profitability.
===========================================================
*/

SELECT 
    ROUND(SUM(Sales)) AS total_revenue,
    ROUND(SUM(Profit)) AS total_profit
FROM orders;

-- Total Revenue: 1536107
-- Total Profit: 172933



/*
===========================================================
2. REVENUE AND PROFIT BY REGION
Purpose:
Analyzes sales revenue and profit across different
geographic regions.

Business Insight:
Identifies the strongest and weakest performing regions
to support regional sales and operational strategies.
===========================================================
*/

SELECT 
    Region,
    ROUND(SUM(Sales)) AS revenue,
    ROUND(SUM(Profit)) AS profit
FROM orders
GROUP BY Region
ORDER BY revenue DESC;

/* 
Key Finding:
The West region generated the highest revenue and profit,
followed by the East, Central, and South regions.
*/



/*
===========================================================
3. PROFIT MARGIN BY PRODUCT CATEGORY
Purpose:
Compares revenue, profit, and profit margins across
different product categories.

Business Insight:
Helps determine which product categories are the most
profitable and efficient at generating returns.
===========================================================
*/

SELECT 
    Category,
    ROUND(SUM(Sales)) AS revenue,
    ROUND(SUM(Profit)) AS profit,
    ROUND(SUM(Profit)) / ROUND(SUM(Sales)) AS profit_margin
FROM orders
GROUP BY Category;

/* 
Key Finding:
Although Office Supplies generated the highest revenue,
Technology and Furniture categories produced stronger
profit margins and overall profitability.
*/



/*
===========================================================
4. TOP 10 PRODUCTS BY REVENUE
Purpose:
Identifies the top-performing products based on total
sales revenue.

Business Insight:
Highlights the products driving the most revenue and
supports inventory and marketing decisions.
===========================================================
*/

SELECT 
    `Product Name`,
    ROUND(SUM(Sales)) AS revenue
FROM orders
GROUP BY `Product Name`
ORDER BY revenue DESC
LIMIT 10;



/*
===========================================================
5. DISCOUNT IMPACT ON PROFITABILITY
Purpose:
Analyzes how discount levels affect average profit.

Business Insight:
Helps evaluate whether higher discounts contribute to
reduced profitability and identifies optimal discount
strategies.
===========================================================
*/

SELECT 
    Discount,
    AVG(Profit) AS avg_profit
FROM orders
GROUP BY Discount
ORDER BY Discount;



/*
===========================================================
END OF ANALYSIS
===========================================================
*/
