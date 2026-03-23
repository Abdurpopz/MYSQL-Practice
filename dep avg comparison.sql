create database dept_average_comparison;
use dept_average_comparison;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO employees VALUES
(1, 'Abdur', 40000, 10),
(2, 'Aaleeyaah', 60000, 10),
(3, 'Anuu', 50000, 20),
(4, 'Virat', 70000, 20),
(5, 'Hardik', 80000, 30),
(6, 'Rohit', 60000, 30);

SELECT emp_id, emp_name, salary, dept_id
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
