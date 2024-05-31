-- day 28/50 days SQL Challenge






SELECT * FROM walmart_eu;

/*
--Question
Write a query to find the highest-selling 
product for each customer

Return cx id, product description, 
and total count of purchase.

*/ 
-- cx all product they purchased and their total orders
-- order by by number of purchase desc
-- 1 product that has highest purchase 
-- rank

--my solution 

select 
     customerid,
	 description,
	 total_purchase
from 
(
select 
     customerid,
	 description,
	 count(*) as total_purchase,
	 rank() over(partition by customerid order by count(*) desc) as rnk
	 from walmart_eu
	 group by customerid,description
	 order by customerid,total_purchase desc
)
where rnk =1;




/*
-- Your Task
Find each country and best selling product 
Return country_name, description, total count of sale
*/


--solution
select 
     country ,
	 description,
	 total_sale
	 from (
select 
     country,
	 description,
	 count(*) as total_sale,
	 rank() over(partition by country order by count(*) desc) as rn
	 from walmart_eu
	 group by country,description
	 order by total_sale desc)
	 where rn = 1;