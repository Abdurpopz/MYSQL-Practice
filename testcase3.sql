create database testcase3;
use testcase3;

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

create table orders(
order_id int not null auto_increment primary key,
customer_id int not null,
product_id int not null,
payment varchar(25) not null,
status varchar(25) not null,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
)auto_increment=1001;
insert into orders(customer_id,product_id,payment,status) values
(1,101,'online','completed'),
(1,102,'online','completed'),
(2,103,'offline','completed'),
(3,104,'offline','not completed'),
(4,105,'online','completed'),
(5,102,'online','completed'),
(5,103,'online','not completed');

SELECT 
    c.customer_name,
    SUM(p.price) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
WHERE o.status = 'completed'
  AND o.payment = 'online'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(p.price) > 0
ORDER BY total_revenue DESC
LIMIT 5;
