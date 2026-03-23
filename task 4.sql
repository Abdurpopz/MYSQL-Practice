create database task4;
use task4;

create table employees (
emp_id int not null auto_increment primary key,
emp_name varchar(25) not null,
dept_name varchar(25) not null,
salary int not null
);

create table  departments (
dept_id int not null auto_increment primary key,
dept_name varchar(25) not null
)auto_increment=101;


INSERT INTO employees (emp_name, dept_name, salary) VALUES
('Rohit Sharma', 'IT', 65000),
('Meera Krishnan', 'HR', 48000),
('Santhosh Kumar', 'Sales', 52000),
('Aisha Rahman', 'Finance', 70000),
('Vikram Singh', 'IT', 72000),
('Priya Nair', 'HR', 46000),
('Jatin Verma', 'Sales', 55000),
('Farhan Ali', 'Finance', 68000),
('Nisha Reddy', 'IT', 61000),
('Lavanya Devi', 'HR', 49000),
('Arjun Malhotra', 'Sales', 53000),
('Sneha Kapoor', 'Finance', 71000),
('Karthik Raj', 'IT', 69000),
('Ananya Shree', 'HR', 47000),
('Praveen Kumar', 'Sales', 56000),
('Ritika Shah', 'Finance', 73000),
('Harish Yadav', 'IT', 64000),
('Divya Patel', 'HR', 50000),
('Sagar Joshi', 'Sales', 54000),
('Manish Gupta', 'Finance', 72000);

select * from employees order by emp_name;

insert into departments(dept_name) values
('Finance'),
('IT'),
('HR'),
('Sales');

select * from departments ;

create table emp_dept_map (
map_id int not null auto_increment primary key,
employee_id int not null,
department_id int not null,
foreign key (employee_id) references employees(emp_id),
foreign key (department_id) references departmrnts(dept_id)
);
