-- 37/50 SQL challenge

-- Create customer table
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Create spending records table
CREATE TABLE spending_records (
    record_id INT PRIMARY KEY,
    customer_id INT,
    spending_amount DECIMAL(10, 2),
    spending_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert example data into customers table
INSERT INTO customer (customer_id, customer_name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(4, 'Charlie');

-- Insert example data into spending records table
INSERT INTO spending_records (record_id, customer_id, spending_amount, spending_date) VALUES
(9, 1, 120.00, '2024-03-25'),
(10, 2, 80.00, '2024-03-25'),
(11, 3, 150.00, '2024-03-25'),
(12, 4, 70.00, '2024-03-25'),
(13, 1, 90.00, '2024-03-02'),
(14, 2, 100.00, '2024-04-02'),
(15, 3, 160.00, '2024-04-02'),
(16, 4, 30.00, '2024-03-02'),
(17, 1, 110.00, '2024-04-09'),
(18, 2, 70.00, '2024-02-09'),
(19, 3, 140.00, '2024-03-09'),
(20, 4, 60.00, '2024-04-09'),
(21, 1, 100.00, '2024-03-16'),
(22, 2, 60.00, '2024-03-16'),
(23, 3, 130.00, '2024-03-16'),
(24, 4, 50.00, '2024-04-16'),
(25, 1, 80.00, '2024-03-23'),
(26, 2, 50.00, '2024-04-23'),
(27, 3, 120.00, '2024-04-23'),
(28, 4, 40.00, '2024-04-23'),
(29, 1, 70.00, '2024-04-30'),
(30, 2, 40.00, '2024-04-30'),
(31, 3, 110.00, '2024-03-01'),
(32, 4, 30.00, '2024-03-01');

/*

-- Amazon Data Analyst Interview Question

You are given two table of amazon
spending_records and customers 

Write a SQL query to show all customers
and their total spending show only those
customers whos total spending has reduced
compare to last month ()

Return customer_name, customer_id, 
last MONTH spend, current month spent 

-- Note consider last month as March
Current Month as April
*/

-- each customer spend for march
-- each customer spend for april
-- compare both of these 
-- make logic to say last month spend > current month spend

SELECT * FROM spending_records;
SELECT * FROM customer;

-- solution 

with cte1 as
(select 
     customer_id,
	 sum(spending_amount) as total_spend
from spending_records
where extract(month from spending_date) = 3
group by 1),

cte2 as 
(select 
     customer_id,
	 sum(spending_amount) as total_spend
from spending_records
where extract(month from spending_date) = 4
group by 1)

select 
     cte1.customer_id,
	 c.customer_name,
	 cte1.total_spend as last_month_spend,
	 cte2.total_spend as current_month_spend
from cte1
join
cte2
on cte1.customer_id = cte2.customer_id
join customer c
on cte1.customer_id = c.customer_id
where cte1.total_spend > cte2.total_spend




