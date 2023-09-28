
---Over-Viewing the Data
Select * from Pizza_Sales


---Total Revenue
Select Cast(sum(total_price) as Decimal (10,2)) As Total_Revenue  From [dbo].[Pizza_Sales]


---Average Order Value
Select Cast(SUM(total_price) / Count(Distinct order_id) as Decimal(10,2))
as Average_Revenue From Pizza_Sales


---Total Pizza Sold
select Sum(quantity) as Total_Pizza_Sales
 from [My Data Base]..Pizza_Sales
 
 
---Total Orders
Select COUNT(Distinct order_id) As Total_Order
from [My Data Base]..Pizza_Sales


---Average Pizzas Per Order
select Cast(Cast(sum(quantity) as decimal(10,2)) / Cast(COUNT(Distinct order_id) as Decimal(10,2))
as Decimal(10,2)) as Average_Pizza_Per_Order
from Pizza_Sales


---Daily Trend For Total Orders
select DATENAME(Dw,order_date) as Day, COUNT(Distinct order_id) As Total_order
from Pizza_Sales Group By Datepart(Dw,order_date),DATENAME(Dw,order_date)
order by Datepart(Dw,order_date)


---Monthly Trend For Total Orders
select DATENAME(MONTH,order_date) as Month, COUNT(Distinct order_id) As Total_order
from Pizza_Sales Group By Datepart(MONTH,order_date),DATENAME(MONTH,order_date)
order by Datepart(MONTH,order_date)


---Percentage of Sales by Pizza Category
select pizza_category as Pizza_Category,CAST(SUM(total_price) as decimal(10,2)) as Total_Sales,
CAST(SUM(total_Price)*100/
(Select SUM(total_Price) From Pizza_Sales) as decimal(10,2)) as Percentage_By_Sales
from Pizza_Sales group by pizza_category
order by Percentage_By_Sales


---Percentage of Sales by Pizza Size
select pizza_size as Pizza_Size,CAST(SUM(total_price) as decimal(10,2)) as Total_Sales,
CAST(SUM(total_Price)*100/
(Select SUM(total_Price) From Pizza_Sales) as decimal(10,2)) as Percentage_By_Sales
from Pizza_Sales group by pizza_size
order by Percentage_By_Sales desc


---Total Pizzas Sold by Pizza Category
select pizza_category as Pizza_Category, SUM(quantity) as Total_Pizzas_Sold
from Pizza_Sales group by pizza_category
order by Total_Pizzas_Sold Desc


---Top Five Pizza by Total Revenue
select Top 5 pizza_name as Pizza_Name,CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue
from Pizza_Sales
group by pizza_name
order by Total_Revenue Desc


---Top Five Pizza by Total Quantity
select Top 5 pizza_name as Pizza_Name,SUM(quantity) as Total_Quantity
from Pizza_Sales
group by pizza_name
order by Total_Quantity desc


---Top Five Pizza by Total Orders
select Top 5 pizza_name as Pizza_Name, Count(Distinct order_id) as Total_Order
from Pizza_Sales
group by pizza_name
order by Total_Order desc


---Bottom Five Pizza by Total Revenue
select TOP 5 pizza_name as Pizza_Name,CAST(SUM(total_price) as decimal(10,2)) as Total_Revenue
from Pizza_Sales
group by pizza_name
order by Total_Revenue


---Bottom Five Pizza by Total Quantity
select Top 5 pizza_name as Pizza_Name,SUM(quantity) as Total_Quantity
from Pizza_Sales
group by pizza_name
order by Total_Quantity 


---Bottom Five Pizza by Total Orders
select Top 5 pizza_name as Pizza_Name, Count(Distinct order_id) as Total_Order
from Pizza_Sales
group by pizza_name
order by Total_Order