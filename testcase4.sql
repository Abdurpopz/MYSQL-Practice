create database testcase4;
use testcase4;

create table suppliers (
supplier_id int not null auto_increment primary key,
supplier_name varchar(25) not null,
city varchar(25) not null
);

insert into suppliers (supplier_name,city) values
('Abdur','india'),
('Aaleeyaah','india'),
('Anuu','china'),
('virat','london'),
('hardik','china');

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

create table orders(
order_id int not null auto_increment primary key,
supplier_id int not null,
product_id int not null,
quantity int not null,
foreign key (supplier_id) references suppliers(supplier_id),
foreign key (product_id) references products(product_id)
)auto_increment=1001;

insert into orders(supplier_id,product_id,quantity) values
(1,101,2),
(1,102,1),
(2,103,1),
(3,104,2),
(4,105,2),
(5,102,1),
(5,103,2);

SELECT 
    s.supplier_name,
    COUNT(DISTINCT o.product_id) AS total_products_supplied,
    SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN suppliers s 
    ON o.supplier_id = s.supplier_id
JOIN products p 
    ON o.product_id = p.product_id
WHERE s.city IN ('india', 'china')
GROUP BY s.supplier_id, s.supplier_name
HAVING SUM(p.price * o.quantity) > 10000
ORDER BY total_revenue DESC;
