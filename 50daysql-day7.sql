-- Day 07/50 days sql challenge 


DROP TABLE IF EXISTS employees;

-- Create the employee_salary table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);



-- Insert all records again to simulate duplicates
INSERT INTO employees(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);


/*
Question:

How would you identify duplicate entries in
a SQL in given table employees columns are 
emp_id, name, department, salary

*/


-- ------------------------
-- My Solution
-- ------------------------

select emp_id,
	name,
	count(1) as total_freq
	from employees
	group by emp_id,name
	having count(1)>1;


--solution 2
-- best approach 

select * from 
		(select *,
		row_number() over(partition by name order by name) as rn
		from employees) x
where rn >1;


-- identify the employee details who is appearing more than twice in the employees table 

--solution 
select * from 
		(select *,
		row_number() over(partition by name order by name) as rn
		from employees) x
where rn >2;



