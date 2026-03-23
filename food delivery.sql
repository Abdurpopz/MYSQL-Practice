create database food_delivery;
use food_delivery;

create table orders (
order_id int not null primary key,
customer_name varchar(50),
restaurant varchar(50),
city varchar(50),
order_time datetime,
delivery_time int,
order_value int,
rating float,
payment_type varchar(20),
order_hour int,
day varchar(15),
delivery_speed varchar(20)
);