create database Employees;
use Employees;
create table Employee(
Employee_id int not null auto_increment primary key,
Empname varchar(255) not null,
age int not null,
Designation varchar(255) not null,
Address varchar(255) not null,
phone bigint not null,
salary bigint not null,
PF bigint not null
) auto_increment=1001;

insert into Employee (Empname,Age,Designation,Address,Phone,salary,PF) values
("Abdur",22,"Data Analyst","Villupuram",9080570491,80000,3000),
("Tharun",22,"SAP","Chennai",7339292372,70000,4000),
("Palani",24,"Engineer","Coimbatore",6384719720,60000,2000),
("Sriram",24,"Developer","Villupuram",6384719821,66000,2500),
("Raj",27,"SAP","Pondy",6384713781,55000,2500),
("Virat",32,"Data Analyst","Banglore",7339292567,90000,4000),
("karthi",21,"Developer","Pondy",9080572738,50000,2500),
("Mano",26,"Networking","Chennai",9080570492,60000,3500),
("Arif",30,"SAP","Banglore",9080578254,98000,4500),
("Rohit",37,"Engineer","Mumbai",9080570982,120000,5500),
("Ameen",35,"Data Analyst","Villupuram",8056906788,145000,6000),
("Saadh",21,"Accounts","Mumbai",7338282472,40000,2500),
("Shreyas",32,"SAP","Banglore",9270057825,98000,4500),
("Rohit",27,"Engineer","Mumbai",9384570982,80000,5500),
("Hardik",31,"Data Analyst","Villupuram",8302906788,145000,6000),
("Tilak",21,"Accounts","Mumbai",7338249247,40000,2500);

select * from Employee;
select * from Employee where Designation="Data Analyst";
select * from Employee where salary>70000;
select * from Employee Where Designation="Data Analyst" AND Salary >85000;

alter table Employee
add tax bigint;

update Employee 
set tax=12
where Employee_id=1007;
