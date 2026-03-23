create database second_high_salary;
use second_high_salary;

create table employees(
emp_id int not null auto_increment primary key,
emp_name varchar(25) not null,
salary bigint not null
);

insert into employees(emp_name,salary)values
('Abdur', 35000),
('Aaleeyaah', 42000),
('Anuu', 30000),
('Virat', 55000),
('Hardik', 60000);

select salary from employees where in

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


select salary from employees
order by salary desc
limit 1 ;

select max(salary) 
from employees
where salary < (
 select max(salary) 
 from employees);