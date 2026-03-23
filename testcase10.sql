create database testcase10;
use testcase10;
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

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-03-15', 12000),
(1, '2025-01-20', 18000),

(2, '2024-06-10', 15000),
(2, '2025-02-05', 22000),

(3, '2024-09-12', 17000),

(4, '2025-03-18', 25000),

(5, '2024-11-25', 9000),
(5, '2025-04-02', 14000);

select 
    c.customer_name,
    (select count(*) 
     from orders o1 
     where o1.customer_id = c.customer_id
       and YEAR(o1.order_date) = YEAR(CURDATE()) - 1
    ) as last_year_orders,
    (select COUNT(*) 
     from orders o2 
     where o2.customer_id = c.customer_id
       AND YEAR(o2.order_date) = YEAR(CURDATE())
    ) as current_year_orders
from customers c
where c.customer_id in (
    select customer_id
    from orders
    where YEAR(order_date) = YEAR(CURDATE()) - 1
)
and c.customer_id IN (
    select customer_id
    from orders
    where YEAR(order_date) = YEAR(CURDATE())
);
