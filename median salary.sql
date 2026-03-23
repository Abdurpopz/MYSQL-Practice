create database median_salary;
use median_salary;

create table employees (
emp_id int not null auto_increment primary key,
emp_name varchar(25) not null
);

INSERT INTO employees (emp_name) VALUES
('Rohit Sharma'),
('Meera Krishnan'),
('Santhosh Kumar'),
('Aisha Rahman'),
('Vikram Singh'),
('Priya Nair'),
('Jatin Verma'),
('Farhan Ali'),
('Nisha Reddy'),
('Lavanya Devi'),
('Arjun Malhotra'),
('Sneha Kapoor'),
('Karthik Raj'),
('Ananya Shree'),
('Praveen Kumar'),
('Ritika Shah'),
('Harish Yadav'),
('Divya Patel'),
('Sagar Joshi'),
('Manish Gupta');

select * from employees;

create table  departments (
dept_id int not null auto_increment primary key,
dept_name varchar(25) not null,
emp_id int not null,
salary int not null,
foreign key (emp_id) references employees(emp_id)
)auto_increment=101;

INSERT INTO departments (dept_name, emp_id, salary) VALUES
('IT', 1, 65000),
('HR', 2, 48000),
('Sales', 3, 52000),
('Finance', 4, 70000),
('IT', 5, 72000),
('HR', 6, 46000),
('Sales', 7, 55000),
('Finance', 8, 68000),
('IT', 9, 61000),
('HR', 10, 49000),
('Sales', 11, 53000),
('Finance', 12, 71000),
('IT', 13, 69000),
('HR', 14, 47000),
('Sales', 15, 56000),
('Finance', 16, 73000),
('IT', 17, 64000),
('HR', 18, 50000),
('Sales', 19, 54000),
('Finance', 20, 72000);

select * from departments group by emp_id,dept_id; 

SELECT AVG(salary) AS median_salary
FROM (
    SELECT salary,
           ROW_NUMBER() OVER (ORDER BY salary) AS rn,
           COUNT(*) OVER () AS cnt
    FROM departments
) t
WHERE rn IN ((cnt + 1) / 2, (cnt + 2) / 2);

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_id,
    d.dept_name,
    d.salary,
    CASE
        WHEN d.salary > (SELECT AVG(salary) FROM departments)
        THEN 'HIGH PERFORMER'
        ELSE 'LOW PERFORMER'
    END AS performance
FROM departments d
JOIN employees e ON e.emp_id = d.emp_id;

SELECT 
    d.dept_name,
    d.salary,
    (SELECT COUNT(*) 
     FROM departments d1 
     WHERE d1.dept_name = d.dept_name
    ) AS total
FROM departments d;



(select total_emp > 3) as total;


            

select avg(salary) from departments;




