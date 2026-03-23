Create database window_function;
use window_function;

Create table employee
(
emp_id int not null primary key,
emp_name varchar(50) not null,
dept_name varchar(50) not null,
emp_salary bigint not null
);
insert into employee(emp_id, emp_name,dept_name, emp_salary)
values(1, "Abdul", "admin",3000),
(2, "Kala", "HR", 4000),
(3, "Malathi", "Support", 5000),
(4, "Ram", "HR", 7000),
(5, "Kamali", "admin", 6000),
(6, "Lali", "Support", 8000),
(7, "Nisha", "HR", 3000),
(8, "Uma", "Support", 8000),
(9, "Tharan", "admin", 7000);

select*from employee;



-- max salary grouped by dept--
select dept_name, max(emp_salary) 
as max_salaries from employee
group by dept_name;

-- using windows function to find max salary --

select e.*,
max(emp_salary)
over (partition by dept_name) as max_salary 
from employee e;
SELECT e.*,
       MAX(emp_salary) OVER (PARTITION BY dept_name) AS max_salary
FROM employee e;
-- row number--

select e.*,
row_number() over(partition by dept_name)
as rn from employee e;
-- fetch the first 2 employees from each department to join the company--
select*from(
select e.*,
row_number() over(partition by dept_name order by emp_id)
as rn from employee e) x
where x.rn>2;

-- rank()--
--fetch the top 2 employees in each dept earning themax salary --
SELECT *
FROM (
    SELECT e.*,
           RANK() OVER (PARTITION BY dept_name ORDER BY emp_salary DESC) AS rnk
    FROM employee e
) x
WHERE x.rnk <= 2;
-- dense rank--
SELECT *
FROM (
    SELECT e.*,
           RANK() OVER (PARTITION BY dept_name ORDER BY emp_salary DESC) AS rnk,
           DENSE_RANK() OVER (PARTITION BY dept_name ORDER BY emp_salary DESC) AS rnks
    FROM employee e
) x
;

--rank will skip the value
-- dense rank will not skip the value