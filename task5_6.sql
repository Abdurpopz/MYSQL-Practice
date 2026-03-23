create database task5_1;
use task5_1;

create table customers (
customer_id int not null auto_increment primary key,
customer_name varchar(25) not null
);

create table products (
product_id int not null auto_increment primary key,
product_name varchar(25) not null,
price int not null
)auto_increment=101;

create table orders (
order_id int not null auto_increment primary key,
customer_id int not null,
product_id int not null,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
)auto_increment=1001;


create table total_order_amounts (
ordered_item_id int not null auto_increment primary key,
customer_id int not null,
order_id int not null,
product_id int not null,
quantity int not null,
price int not null,
foreign key (customer_id) references customers(customer_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);
insert into customers(customer_name) values
('Rohit Sharma'),
('Aisha Khan'),
('Vikram Rao'),
('Sneha Patel'),
('Manoj Kumar');
select * from customers; 

insert into products(product_name, price) values
('Laptop',20000),
('Smartphone',15000),
('Headphones',500),
('Smartwatch',1000);
select * from products;

insert into orders (customer_id,product_id) values
(1,101),
(1,102),
(1,103),
(2,102),
(3,101),
(3,102),
(4,103),
(5,101),
(5,103);

INSERT INTO total_order_amounts (customer_id, order_id, product_id,quantity, price) VALUES
(1, 1001, 101,1, 20000),
(1, 1002, 102,2, 15000),
(1, 1003, 103,1, 500),
(2, 1004, 102,2, 15000),
(3, 1005, 101, 1,20000),
(3, 1006, 102, 1,15000),
(4, 1007, 103,3, 500),
(5, 1008, 101, 4,20000),
(5, 1009, 103,2, 500);


SELECT 
    c.customer_id,
    c.customer_name,
    o.product_id,
    o.order_id,

    (
        SELECT COUNT(DISTINCT o2.product_id)
        FROM orders o2
        WHERE o2.customer_id = c.customer_id
    ) AS unique_items,
(
SELECT COUNT(*)
from( select o.customer_id
from orders o
group by o.customer_id
having COUNT(DISTINCT o.product_id) >= 2
) as t
) as two_or_more
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
;

