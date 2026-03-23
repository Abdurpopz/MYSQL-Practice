create database testcase9;
use testcase9;
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
(101,1,210000,210000),
(102,2,180000,150000),
(103,3,150000,140000),
(104,4,230000,107000),
(105,5,19000,19000)
;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_mode VARCHAR(30) NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (order_id, payment_mode, amount) VALUES
(101, 'Credit Card', 110000),
(101, 'Credit Card', 100000),
(102, 'UPI', 80000),
(102, 'UPI', 70000),
(103, 'Debit Card', 70000),
(103, 'Debit Card', 70000),
(104, 'Net Banking', 50000),
(104, 'Net Banking', 57000),
(105, 'Cash', 19000);

SELECT 
    p.payment_mode,
    count(p.payment_id) as total_payments,
    sum(p.amount) as total_amount,
    CASE
        WHEN SUM(p.amount) > 200000 THEN 'High Usage'
        WHEN SUM(p.amount) BETWEEN 100000 AND 200000 THEN 'Medium Usage'
        ELSE 'Low Usage'
    END AS payment_rating
from payments p
group by p.payment_mode
HAVING sum(p.amount) > 0;

