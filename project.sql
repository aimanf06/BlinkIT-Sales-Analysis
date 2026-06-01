 use project

select * from BlinkIT_Grocery_Data; 

update BlinkIT_Grocery_Data set Item_Fat_Content =             -----CLEANING COL1
case
WHEN Item_Fat_Content IN ('LOW FAT','LF') THEN 'Low Fat'
when Item_Fat_Content ='reg' then 'Regular'
ELSE Item_Fat_Content
END;

select DISTINCT(Item_Fat_Content) from BlinkIT_Grocery_Data; 

-------KPIS---

select CAST(SUM(Total_Sales)/1000000 AS DECIMAL (10,2)) AS TOTAL_OVERALL_SALES from BlinkIT_Grocery_Data; 


select CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS AVG_OVERALL_SALES from BlinkIT_Grocery_Data;


select COUNT(ITEM_IDENTIFIER) AS TOTAL_ITEMS from BlinkIT_Grocery_Data; 


select COUNT(*) from BlinkIT_Grocery_Data;

select CAST(AVG(Rating) AS DECIMAL(10,1)) AS AVG_RATING from BlinkIT_Grocery_Data;
----GRANULAR--

select Item_Fat_Content,CAST(SUM(TOTAL_SALES)/100000 AS DECIMAL(10,2)) AS TOTAL_SALES_BY_FATC
from BlinkIT_Grocery_Data
GROUP BY Item_Fat_Content;

select Item_Type,CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES_BY_ITEMT
from BlinkIT_Grocery_Data
GROUP BY Item_Type
ORDER BY TOTAL_SALES_BY_ITEMT DESC;

select Outlet_Establishment_Year,CAST(SUM(TOTAL_SALES) AS DECIMAL(10,2)) AS TOTAL_SALES_BY_OEY 
from BlinkIT_Grocery_Data
GROUP BY Outlet_Establishment_Year
ORDER BY TOTAL_SALES_BY_OEY DESC;

select Outlet_Location_Type,CAST(SUM(TOTAL_SALES)AS DECIMAL(10,2)) AS TOTAL_SALES_BY_LOC
from BlinkIT_Grocery_Data
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES_BY_LOC DESC;

select Outlet_Type,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS TOTAL_OVERALL_SALES,
CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS AVG_OVERALL_SALES,
COUNT(*) AS TOTAL_ITEMS,
CAST(AVG(Rating) AS DECIMAL(10,1)) AS AVG_RATING
from BlinkIT_Grocery_Data
GROUP BY Outlet_Type
ORDER BY TOTAL_OVERALL_SALES DESC;
