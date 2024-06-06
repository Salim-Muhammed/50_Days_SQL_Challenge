-- Day 32/50 SQL challenge



-- Create table fb_active_users
CREATE TABLE fb_active_users (
    user_id INT,
    name VARCHAR(50),
    status VARCHAR(10),
    country VARCHAR(50)
);

-- Insert records into fb_active_users
INSERT INTO fb_active_users (user_id, name, status, country) VALUES
(33, 'Amanda Leon', 'open', 'Australia'),
(27, 'Jessica Farrell', 'open', 'Luxembourg'),
(18, 'Wanda Ramirez', 'open', 'USA'),
(50, 'Samuel Miller', 'closed', 'Brazil'),
(16, 'Jacob York', 'open', 'Australia'),
(25, 'Natasha Bradford', 'closed', 'USA'),
(34, 'Donald Ross', 'closed', 'China'),
(52, 'Michelle Jimenez', 'open', 'USA'),
(11, 'Theresa John', 'open', 'China'),
(37, 'Michael Turner', 'closed', 'Australia'),
(32, 'Catherine Hurst', 'closed', 'Mali'),
(61, 'Tina Turner', 'open', 'Luxembourg'),
(4, 'Ashley Sparks', 'open', 'China'),
(82, 'Jacob York', 'closed', 'USA'),
(87, 'David Taylor', 'closed', 'USA'),
(78, 'Zachary Anderson', 'open', 'China'),
(5, 'Tiger Leon', 'closed', 'China'),
(56, 'Theresa Weaver', 'closed', 'Brazil'),
(21, 'Tonya Johnson', 'closed', 'Mali'),
(89, 'Kyle Curry', 'closed', 'Mali'),
(7, 'Donald Jim', 'open', 'USA'),
(22, 'Michael Bone', 'open', 'Canada'),
(31, 'Sara Michaels', 'open', 'Denmark');


/*
-- Meta Data Analyst Question 

You have meta table with columns
user_id, name, status, country

Output share of US users that are active. 
Active users are the ones with an 
"open" status in the table.

Return total users and active users
and active users share for US
*/

-- COUNT FILTER FOR US
-- COUNT ACTIVE users in US
-- active users/total users * 100

select * from fb_active_users;

--solution 

select 
     count(user_id) as total_users,
	 sum(case when status = 'open' then 1
	 else 0
	 end ) as active_users,
	round(  sum(case when status = 'open' then 1
	 else 0
	 end )::numeric/count(user_id)::numeric *100,2) as active_share_users_US
from fb_active_users
where country = 'USA';


--solution with cte

with cte as 
(select 
     count(user_id) as total_users,
	 sum(case when status = 'open' then 1
	 else 0
	 end ) as active_users
from fb_active_users
where country = 'USA')
select total_users,
      active_users,
	  round(active_users::numeric/total_users::numeric *100,2) as share_users
	  from cte
	  
	  

-- Your Task
-- Find non_active users share for China	 


select 
     count(user_id) as total_users,
	 sum(case when status = 'closed' then 1
	 else 0
	 end ) as non_active_users,
	round(  sum(case when status = 'closed' then 1
	 else 0
	 end )::numeric/count(user_id)::numeric *100,2) as non_active_share_users_china
from fb_active_users
where country = 'China';
