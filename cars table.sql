create database cars;
use cars;
create table BMW (
modelnumber int not null auto_increment primary key,
modelname varchar(255) not null,
colour varchar(255) not null
) auto_increment = 101;

insert into BMW (modelname,colour) values
("X1","Blue"),
("X2","Balck"),
("A1","White");

create table Audi (
modelnumber int not null auto_increment primary key,
modelname varchar(255) not null,
colour varchar(255) not null
) auto_increment=201;

insert into Audi (modelname,colour) values
("B6","Green"),
("AUX4","Blue");

Select * from BMW;
 
Select modelname from BMW;

Select * from Audi;

Select * from BMW,Audi;


create table Suzuki (
modelnumber int not null auto_increment primary key,
modelname varchar(255) not null ,
colour varchar(255) not null
) auto_increment=301;

insert into Suzuki(modelname,colour) values
("Creta","White"),
("I10","Green");

Select * from suzuki;

alter table Suzuki
add price varchar(15);

update suzuki
set price="1000000"
where modelnumber=301;

alter table Audi
add price varchar(10);

update Audi
set price="1500000"
where modelnumber=202;

update audi
set price="25000000"
where modelnumber=201;

alter table BMW
add price varchar(10);

insert into BMW(modelname,colour,price) values
("C1","yellow","2100000"),
("D1","red","5100000");

select * from bmw;

update BMW 
set price="4100000"
where modelnumber=101;

update bmw
set price = "1200000"
where modelnumber=102;

update bmw
set price="4100000"
where modelnumber=103;
select count(*) from BMW; 
select max(price) from BMW;
select avg(price) from Audi;
select modelname,price from bmw where price> 2200000 ;
select distinct colour from BMW
select distinct colour from Audi ;

select concat(lower(modelnumber),'-',upper(modelname)) as numbername from BMW;

select * from BMW order by price desc;