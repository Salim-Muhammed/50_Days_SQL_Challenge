-- Day 05/30 SQL Challenge 



DROP TABLE IF EXISTS Employees;

-- Create the Employee table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- Insert sample records into the Employee table
INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(101, 'John Smith', 'Sales', 60000.00, '2022-01-15'),
(102, 'Jane Doe', 'Marketing', 55000.00, '2022-02-20'),
(103, 'Michael Johnson', 'Finance', 70000.00, '2021-12-10'),
(104, 'Emily Brown', 'Sales', 62000.00, '2022-03-05'),
(106, 'Sam Brown', 'IT', 62000.00, '2022-03-05'),	
(105, 'Chris Wilson', 'Marketing', 58000.00, '2022-01-30');


/*

Write a SQL query to retrieve the 
third highest salary from the Employee table.

*/
--fetching the employees table

select * from employees

--soln	
with cte as	
			(select *,
			dense_rank() over(order by salary desc) as drn
			from employees)
select * from cte
	where drn = 3;

--soln 2
select 
	salary as third_highest_salary
	from
	(select *,
			dense_rank() over(order by salary desc) as drn
			from employees) as x
where drn = 3;


-- Find the employee details who has highest salary from each department
-- by subquery

select employeeid,name,department,salary
	from
		(select *,
		dense_rank() over(partition by department order by salary desc) as ddrn
		from employees) as subq
where ddrn = 1;




-- soln using DISTINCT 

select 
DISTINCT on (Department) *
from Employees
order by Department, Salary DESC

-- soln using row_number

with cte as (
select 
*, row_number() over(PARTITION by Department ORDER By Salary DESC) as num
from Employees
) select * from cte where num=1

--soln using rank 
	
with cte as (
select 
*, rank() over(PARTITION by Department ORDER By Salary DESC) as num
from Employees
) select * from cte where num=1


