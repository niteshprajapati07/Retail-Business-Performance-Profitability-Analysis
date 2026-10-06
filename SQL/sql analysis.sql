CREATE DATABASE retail_analysis;
USE retail_analysis;

CREATE TABLE orders_temp (
    Order_ID VARCHAR(50),
    Customer_ID INT,
    Order_Date DATE,
    Year INT,
    Month VARCHAR(20),
    Season VARCHAR(20),
    Region VARCHAR(100),
    Country VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100),
    Customer_Segment VARCHAR(50),
    Product_Category VARCHAR(100),
    Product_Brand VARCHAR(100),
    Product_Type VARCHAR(100),
    Quantity INT,
    Sales DECIMAL(12,2),
    COGS DECIMAL(12,2),
    Gross_Profit DECIMAL(12,2),
    Profit_Margin_Percent DECIMAL(10,2),
    Inventory_Days INT,
    Shipping_Method VARCHAR(50),
    Payment_Method VARCHAR(50),
    Order_Status VARCHAR(50),
    Customer_Rating DECIMAL(3,1)
);
LOAD DATA LOCAL INFILE 'E:/Python Projects/Retail-Business-Performance-Analysis/data/Retail_Datasets.csv'
INTO TABLE orders_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT 
    COUNT(*) AS total_rows,
    MIN(Order_Date) AS first_order_date,
    MAX(Order_Date) AS last_order_date
FROM orders_temp;
SELECT DISTINCT Month
FROM orders_temp
ORDER BY Month;

SELECT 
    SUM(Sales) AS Total_Sales
FROM orders_temp;
SELECT 
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp;
SELECT 
    SUM(Quantity) AS Total_Quantity
FROM orders_temp;

SELECT
    Product_Category,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

SELECT
    Product_Category,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Product_Category
ORDER BY Total_Gross_Profit DESC;

SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT
    Region,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Region
ORDER BY Total_Gross_Profit DESC;

SELECT
    Customer_Segment,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;

SELECT
    Customer_Segment,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Customer_Segment
ORDER BY Total_Gross_Profit DESC;

SELECT
    Product_Type,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Product_Type
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    Product_Type,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Product_Type
ORDER BY Total_Gross_Profit DESC
LIMIT 10;

SELECT
    Product_Type,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Product_Type
HAVING SUM(Gross_Profit) < 0
ORDER BY Total_Gross_Profit ASC;

SELECT
    Order_Status,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Order_Status
ORDER BY Total_Sales DESC;

SELECT
    Season,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Season
ORDER BY Total_Sales DESC;

SELECT
    Year,
    Month,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Year, Month
ORDER BY Year, 
         STR_TO_DATE(CONCAT('01 ', Month, ' ', Year), '%d %M %Y');
         
SELECT
    Year,
    Month,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Year, Month
ORDER BY Year,
         STR_TO_DATE(CONCAT('01 ', Month, ' ', Year), '%d %M %Y');         

SELECT
    Product_Category,
    AVG(Profit_Margin_Percent) AS Avg_Profit_Margin
FROM orders_temp
GROUP BY Product_Category
ORDER BY Avg_Profit_Margin DESC;

SELECT
    Product_Category,
    AVG(Inventory_Days) AS Avg_Inventory_Days
FROM orders_temp
GROUP BY Product_Category
ORDER BY Avg_Inventory_Days DESC;

SELECT
    Product_Category,
    AVG(Customer_Rating) AS Avg_Customer_Rating
FROM orders_temp
GROUP BY Product_Category
ORDER BY Avg_Customer_Rating DESC;

SELECT
    City,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    City,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY City
ORDER BY Total_Gross_Profit DESC
LIMIT 10;

SELECT
    Product_Brand,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Product_Brand
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    Product_Brand,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Product_Brand
ORDER BY Total_Gross_Profit DESC
LIMIT 10;

SELECT
    Product_Brand,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Product_Brand
HAVING SUM(Gross_Profit) < 0
ORDER BY Total_Gross_Profit ASC;

SELECT
    Product_Brand,
    AVG(Profit_Margin_Percent) AS Avg_Profit_Margin
FROM orders_temp
GROUP BY Product_Brand
ORDER BY Avg_Profit_Margin DESC
LIMIT 10;

SELECT
    Product_Brand,
    AVG(Inventory_Days) AS Avg_Inventory_Days
FROM orders_temp
GROUP BY Product_Brand
ORDER BY Avg_Inventory_Days DESC
LIMIT 10;

SELECT
    Product_Brand,
    AVG(Customer_Rating) AS Avg_Customer_Rating
FROM orders_temp
GROUP BY Product_Brand
ORDER BY Avg_Customer_Rating DESC
LIMIT 10;

SELECT
    Product_Type,
    SUM(Quantity) AS Total_Quantity
FROM orders_temp
GROUP BY Product_Type
ORDER BY Total_Quantity DESC
LIMIT 10;

SELECT
    Product_Type,
    AVG(Profit_Margin_Percent) AS Avg_Profit_Margin
FROM orders_temp
GROUP BY Product_Type
ORDER BY Avg_Profit_Margin DESC
LIMIT 10;

SELECT
    Product_Type,
    AVG(Inventory_Days) AS Avg_Inventory_Days
FROM orders_temp
GROUP BY Product_Type
ORDER BY Avg_Inventory_Days DESC
LIMIT 10;

SELECT
    Product_Type,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Product_Type
ORDER BY Total_Sales DESC;

SELECT
    Product_Type,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Product_Type
ORDER BY Total_Gross_Profit DESC;

SELECT
    Product_Type,
    AVG(Profit_Margin_Percent) AS Avg_Profit_Margin
FROM orders_temp
GROUP BY Product_Type
ORDER BY Avg_Profit_Margin DESC;

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) / COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM orders_temp;


SELECT
    Country,
    SUM(Sales) AS Total_Sales
FROM orders_temp
GROUP BY Country
ORDER BY Total_Sales DESC
LIMIT 10;

SELECT
    Country,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Country
ORDER BY Total_Gross_Profit DESC;

SELECT
    Order_Status,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Order_Status
ORDER BY Total_Gross_Profit DESC;

SELECT
    Shipping_Method,
    SUM(Sales) AS Total_Sales,
    SUM(Gross_Profit) AS Total_Gross_Profit
FROM orders_temp
GROUP BY Shipping_Method
ORDER BY Total_Sales DESC;



