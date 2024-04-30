-- 01/50 Days SQL challenge

-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert records for three departments
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);


select * from employees;


--Write the SQL query to find the second highest salary


-- simple solution but it is wrong when there is two or more recordes

select * from employees order by salary desc
	limit 1 offset 1;


--using window function DENSE_RANK by using cte

with cte as
		(select *,
		dense_rank() over(order by salary desc) as drn
		from employees) 
select * from cte where drn = 2;


--using subquery

select * from 		
		(select *,
		dense_rank() over(order by salary desc) as drn
		from employees) x
where drn = 2;


--Task 
--get the details of the employee with the second highest salary from each department

with cte as
		(select *,
		dense_rank() over(partition by department order by salary desc) as drn
		from employees) 
select * from cte where drn = 2;












