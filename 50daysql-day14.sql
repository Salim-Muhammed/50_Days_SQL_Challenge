-- sql challenge 14 of 50 day

drop table if exists students;
create table students(
	sname varchar(10),
	sid varchar(5) ,
	mark int
);

insert into students values('A','X',75),
('A','Y',75),
('A','Z',80),
('B','X',90),
('B','Y',91),
('B','Z',75);


--problem statement 
-- fetch the student name and total marks of the top two subjects

	select sname,sum(mark) as total_mark from(
			select sname,mark,
				row_number() over(partition by sname order by mark desc) as rn
				from students) x
		where rn <= 2
	group by sname

