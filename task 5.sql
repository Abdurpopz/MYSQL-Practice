create database task5;
use task5;

create table customers (
customer_id int not null auto_increment primary key,
customer_name varchar(25) not null,
total_orders int not null,
total_order_amount int not null
);

insert into customers(customer_name,total_orders,total_order_amount) values
('Rohit Sharma', 5, 12000),
('Aisha Khan', 3, 8500),
('Vikram Rao', 8, 24000),
('Sneha Patel', 2, 4300),
('Manoj Kumar', 10, 30500),
('Fatima Noor', 6, 25000),
('Arjun Mehta', 4, 9800),
('Priya Sinha', 7, 32000),
('Suresh Reddy', 9, 28000),
('Divya Nair', 3, 7600),
('Harish Gupta', 11, 33000),
('Kavya Iyer', 2, 4100),
('Naveen Joshi', 5, 12500),
('Pooja Verma', 6, 17000),
('Imran Shaikh', 4, 9200),
('Meera Rao', 7, 21500),
('Tarun Yadav', 8, 26000),
('Ananya Roy', 3, 7400),
('Ravi Prasad', 9, 29500),
('Zoya Ali', 5, 13200);

select * from customers;

create table products(
product_id int not null,
product_name varchar(25) not null
);

insert into products(product_id,product_name) values
(101, 'Laptop'),
(102, 'Smartphone'),
(103, 'Headphones'),
(104, 'Smartwatch'),
(105, 'Keyboard'),
(106, 'Bluetooth Speaker');
alter table products
add primary key(product_id);

select * from products;

create table cus_prod_map (
map_id int not null auto_increment primary key,
cus_id int not null,
prod_id int not null,
foreign key (cus_id) references customers(customer_id),
foreign key (prod_id) references products(product_id)
);

insert into cus_prod_map (cus_id,prod_id) values
(1,101),
(1,102),
(1,103),
(1,104),
(1,105),
(2,106),
(2,102),
(2,103),
(3,103),(3,104),(3,105),(3,106),(3,101),(3,102),(3,103),(3,104),
(4,105),(4,106),
(5,101),(5,102),(5,103),(5,104),(5,105),(5,106),(5,101),(5,102),(5,103),(5,104),
(6,105),(6,106),(6,101),(6,102),(6,103),(6,104),
(7,105),(7,106),(7,101),(7,102),
(8,103),(8,104),(8,105),(8,106),(8,101),(8,102),(8,103),
(9,104),(9,105),(9,106),(9,101),(9,102),(9,103),(9,104),(9,105),(9,106),
(10,101),(10,102),(10,103),
(11,104),(11,105),(11,106),(11,101),(11,102),(11,103),(11,104),(11,105),(11,106),(11,101),(11,102),
(12,103),(12,104),
(13,105),(13,106),(13,101),(13,102),(13,103),
(14,104),(14,105),(14,106),(14,101),(14,102),(14,103),
(15,104),(15,105),(15,106),(15,101),
(16,102),(16,103),(16,104),(16,105),(16,106),(16,101),(16,102),
(17,103),(17,104),(17,105),(17,106),(17,101),(17,102),(17,103),(17,104),
(18,105),(18,106),(18,101),
(19,102),(19,103),(19,104),(19,105),(19,106),(19,101),(19,102),(19,103),(19,104),
(20,105),(20,106),(20,101),(20,102),(20,103);

select * from cus_prod_map;


SELECT 
c.customer_id,
c.customer_name,
c.total_orders,
c.total_order_amount,
p.product_id,

CASE 
WHEN c.total_order_amount > 25000 THEN 'Prime Customer'
ELSE 'Regular Customer'
END AS customer_category,

(
select count(DISTINCT m.prod_id)
from cus_prod_map m
where m.cus_id = c.customer_id
) as distinct_products,
    
( select count(*) 
from cus_prod_map m
where distinct_products > 5 
) as different_products

with average_salary (select avg(m.cus_id) > 
    

from customers c
join cus_prod_map m on c.customer_id = m.cus_id
join products p on m.prod_id = p.product_id;
