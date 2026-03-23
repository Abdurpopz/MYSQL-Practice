create database testcase6;
use testcase6;

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);

INSERT INTO customers (customer_name) VALUES
('Abdur'),
('Aaleeyaah'),
('Anuu'),
('Virat'),
('Hardik');

create table products(
product_id int not null auto_increment primary key,
product_name varchar(25) not null,
price int not null
)auto_increment=101;

insert into products(product_name,price) values
('laptop',40000),
('mouse',1000),
('speakers',25000),
('keyboard',3000),
('GPU',50000);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (customer_id, product_id, order_date, status) VALUES
(1, 101, '2025-04-10', 'completed'),
(1, 105, '2025-04-15', 'completed'),
(2, 103, '2025-04-20', 'completed'),
(3, 102, '2025-04-25', 'pending'),
(4, 104, '2025-05-01', 'completed'),
(5, 105, '2025-05-05', 'completed');



SELECT 
    MONTH(o.order_date) AS month,
    COUNT(o.order_id) AS total_orders,
    SUM(p.price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE YEAR(o.order_date) = YEAR(CURDATE())
      AND o.status <> 'Cancelled'
GROUP BY MONTH(o.order_date)
HAVING SUM(p.price) > 20000
ORDER BY month;
