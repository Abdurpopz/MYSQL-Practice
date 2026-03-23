create database task2;
use task2;

CREATE TABLE employees (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
department VARCHAR(255) NOT NULL,
salary BIGINT(10) NOT NULL
)AUTO_INCREMENT=101;


INSERT INTO employees (name, department, salary) VALUES
('Rohit Menon', 'IT', 88700),
('Parthiban R', 'Sales', 72500),
('Sanjay Kulkarni', 'IT', 61200),
('Vikram Nair', 'IT', 70000),
('Meera Varadhan', 'HR', 49100),
('Yeshwanth Rao', 'IT', 55400),
('Pradeep Jain', 'IT', 57800),
('Nisha Joseph', 'Marketing', 89500),
('Harsha Vardhan', 'IT', 50300),
('Divya Suresh', 'HR', 35200),
('Joanna Mathew', 'Operations', 52800),
('Aadhil Khan', 'Finance', 95300),
('Sangeetha Devi', 'Finance', 70200),
('Keerthi Rajan', 'Marketing', 39800),
('Abinaya Gopal', 'Support', 38700),
('Surya Narayanan', 'Sales', 47200),
('Rithvik Sharma', 'Operations', 54900),
('Karthik Reddy', 'Support', 42200);


SELECT e.id,
	   e.name,
       e.department,
       e.salary,
IF ( e.salary > '70000','high earner',
    IF ( e.salary <= '70000' and salary >'40000','mid earner','low earner')
    ) AS calculated_column,
(
SELECT COUNT(*) 
FROM employees e1
WHERE e1.department = e.department
)AS total_employees,
(
(SELECT COUNT(*)
FROM employees e1
WHERE  e1.department = e.department) > 5
) AS big_department
FROM employees e
ORDER BY e.salary desc
LIMIT 10;

