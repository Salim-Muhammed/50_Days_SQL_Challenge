-- Day 34/50 SQL Challenge


-- Create table bank_transactions
CREATE TABLE bank_transactions (
    transaction_id SERIAL PRIMARY KEY,
    bank_id INT,
    customer_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_type VARCHAR(10),
    transaction_date DATE
);

-- Insert sample records into bank_transactions
INSERT INTO bank_transactions (bank_id, customer_id, transaction_amount, transaction_type, transaction_date) VALUES
(1, 101, 500.00, 'credit', '2024-01-01'),
(1, 101, 200.00, 'debit', '2024-01-02'),
(1, 101, 300.00, 'credit', '2024-01-05'),
(1, 101, 150.00, 'debit', '2024-01-08'),
(1, 102, 1000.00, 'credit', '2024-01-01'),
(1, 102, 400.00, 'debit', '2024-01-03'),
(1, 102, 600.00, 'credit', '2024-01-05'),
(1, 102, 200.00, 'debit', '2024-01-09');




/*
You are given a bank transaction data 
with columns bank_id, customer_id, 
amount_type(credit debit), 
transaction_amount and transaction_date



-- Write a query to find starting and ending 
trans amount for each customer

Return cx_id, their first_transaction_amt, 
last_transaction and these transaction_date

*/
-- 


SELECT * FROM bank_transactions;




-- first trans details 
-- last trans details 
-- than join these 2 trans

with cte as 
	(select *,
		row_number() over(partition by customer_id 
		order by transaction_date) as rn
		from bank_transactions),
cte1 as 
	(select 
		customer_id,
		transaction_amount,
		transaction_date
		from cte 
		where rn = (select min(rn) from cte)),
cte2 as 
	(select 
		customer_id,
		transaction_amount,
		transaction_date
		from cte 
		where rn = (select max(rn) from cte))
select 
	cte1.customer_id,
	cte1.transaction_amount as first_trans_amt,
	cte1.transaction_date as first_trans_date,
	cte2.transaction_amount as last_trans_amt,
	cte2.transaction_date as last_trans_date
from cte1
join
cte2
on cte1.customer_id = cte2.customer_id
	
	
		
	
