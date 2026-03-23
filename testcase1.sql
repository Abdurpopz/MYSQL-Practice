create database testcase1;
use testcase1;

create table customers (
customer_id int not null auto_increment primary key,
customer_name varchar(25) not null,
city varchar(25) not null
);

insert into customers (customer_name,city) values
('Abdur','chennai'),
('Aaleeyaah','chennai'),
('Anuu','banglore'),
('virat','banglore'),
('hardik','mumbai');

select * from customers;

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
select * from products;

create table sales(
sales_id int not null auto_increment primary key,
customer_id int not null,
product_id int not null,
quantity int not null,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
)auto_increment=1001;

insert into sales(customer_id,product_id,quantity) values
(1,101,2),
(1,102,1),
(2,103,1),
(3,104,2),
(4,105,2),
(5,102,1),
(5,103,2);

select * from sales;

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(s.sales_id) AS total_orders,
    SUM(p.price * s.quantity) AS total_amount_spent,
    c.city,
    CASE 
        WHEN SUM(p.price * s.quantity) > 50000 THEN 'PLATINUM'
        WHEN SUM(p.price * s.quantity) BETWEEN 25000 AND 50000 THEN 'GOLD'
        ELSE 'SILVER'
    END AS customer_type
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
WHERE c.city IN ('chennai', 'banglore')
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_amount_spent DESC;

