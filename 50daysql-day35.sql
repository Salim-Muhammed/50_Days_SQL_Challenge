-- Day 35/50 SQL Challenge

DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT,
    class VARCHAR(10)
);


INSERT INTO Students (student_id, student_name, marks, class) VALUES
(1, 'John Doe', 85, 'A'),
(2, 'Jane Smith', 92, 'B'),
(3, 'Michael Johnson', 78, 'A'),
(4, 'Emily Brown', 59, 'C'),
(5, 'David Lee', 88, 'B'),
(6, 'Sarah Wilson', 59, 'A'),
(7, 'Daniel Taylor', 90, 'C'),
(8, 'Emma Martinez', 79, 'B'),
(9, 'Christopher Anderson', 87, 'A'),
(10, 'Olivia Garcia', 91, 'C'),
(11, 'James Rodriguez', 83, 'B'),
(12, 'Sophia Hernandez', 94, 'A'),
(13, 'Matthew Martinez', 76, 'C'),
(14, 'Isabella Lopez', 89, 'B'),
(15, 'Ethan Gonzalez', 80, 'A'),
(16, 'Amelia Perez', 93, 'C'),
(17, 'Alexander Torres', 77, 'B'),
(18, 'Mia Flores', 86, 'A'),
(19, 'William Sanchez', 84, 'C'),
(20, 'Ava Ramirez', 97, 'B'),
(21, 'Daniel Taylor', 75, 'A'),
(22, 'Chloe Cruz', 98, 'C'),
(23, 'Benjamin Ortiz', 89, 'B'),
(24, 'Harper Reyes', 99, 'A'),
(25, 'Ryan Stewart', 99, 'C');



/*
Data Analyst Interview Questions 

You have a students table with columns
id, name, marks and class of students

-- Write a query to fetch students
with minmum marks and maximum marks 


*/



-- Approach 1

-- minimum marks
-- maximum marks

select * from students 
where marks = (select min(marks) from students)
or marks = (select max(marks) from students);

--Approach 2

with cte as
	(select 
			min(marks) as min_mark,
			max(marks) as max_mark
		from students)
select 
	s.*
from students s
join cte
on s.marks = cte.min_mark
or s.marks = cte.max_mark ;




-- Your Task
-- Write a SQL query to return students with highest mark in each class

select * from 
(select 
	 * ,
	 rank() over(partition by class order by marks desc) as rnk
from students) as x
where rnk = 1 ;




	