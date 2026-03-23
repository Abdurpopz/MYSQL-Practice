create database testcase5;
use testcase5;
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
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT not null,
    total_amount INT not null,
    paid_amount int not null,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)auto_increment=101;
INSERT INTO orders (order_id,customer_id, total_amount, paid_amount) VALUES
(101,1,20000,20000),
(102,2,18000,15000),
(103,3,15000,14000),
(104,4,17000,17000),
(105,5,19000,0)
;

SELECT o.order_id,
       c.customer_name,
	   o.total_amount,
       o.paid_amount,
case
       when o.total_amount = o.paid_amount then 'fully paid'
       when o.paid_amount= '0' then'not_paid'
       else 'partially paid'
       end as payment
from orders o
join customers c on o.customer_id=c.customer_id
having o.total_amount <> o.paid_amount;




