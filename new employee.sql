create database newemployee;
use newemployee;

create table Employee(
employee_id bigint not null auto_increment primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(20) not null,
phone_number varchar(20) not null,
hire_date date not null,
job_id varchar(20) not null,
salary bigint not null,
commission_pct bigint not null,
manager_id bigint not null,
department_id bigint not null
) auto_increment=1001;

INSERT INTO Employee 
(first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
/*Manager_id = DA (Data Analyst) - 3001,SAP - 3002,ENG (Engineer) - 3003,DEV (Developer) - 3004,ACC (Accounts) - 3005,NET (Networking) - 3006*/
/*department_id = DA-10 , SAP-20 , ENG-30, DEV-40, ACC-50 ,NET-60*/
("Abdur","Rahaman", "abdur@gmail.com",9080570491,"2023-02-10","DA",80000,10,3001,10),
("Tharun","Raj", "tharun@gmail.com",7339292372,"2024-05-14","SAP",70000,10,3002,20),
("Palani","Raja", "palani@gmail.com",6384719720,"2022-08-21","ENG",60000,10,3003,30),
("Sriram","chand", "sriram@gmail.com",6384719821,"2021-11-19","DEV",66000,10,3004,40),
("Raj","bawa", "raj@gmail.com",6384713781,"2023-09-12","SAP",55000,10,3002,20),
("Virat","kohli", "virat@gmail.com",7339292567,"2025-01-03","DA",90000,10,3001,10),
("karthi","keyan", "karthi@gmail.com",9080572738,"2023-07-25","DEV",50000,10,3004,40),
("Mano","bala", "mano@gmail.com",9080570492,"2022-03-30","NET",60000,10,3006,60),
("Arif","shaikh", "arif@gmail.com",9080578254,"2021-06-11","SAP",98000,10,3002,20),
("Rohit","sharma", "rohit1@gmail.com",9080570982,"2025-02-05","ENG",120000,10,3003,30),
("Ameen","khan", "ameen@gmail.com",8056906788,"2024-12-20","DA",145000,10,3001,10),
("Saadh","mohammed", "saadh@gmail.com",7338282472,"2021-09-09","ACC",40000,10,3005,50),
("Shreyas","iyer", "shreyas@gmail.com",9270057825,"2022-10-14","SAP",98000,10,3002,20),
("Rohit","singh", "rohit2@gmail.com",9384570982,"2023-04-27","NET",80000,10,3006,60),
("Hardik","pandya", "hardik@gmail.com",8302906788,"2024-11-22","DA",145000,10,3001,10),
("Tilak","varma", "tilak@gmail.com",7338249247,"2022-05-08","ACC",40000,10,3005,50);

select * from employee;

select first_name,job_id,manager_id from employee where manager_id=3001;
select min(salary) from employee where job_id="DA";/*80000*/
select max(salary) from employee where job_id="DA";/*145000*/

select min(salary) from employee where job_id="SAP";/*55000*/
select max(salary) from employee where job_id="SAP";/*98000*/

select min(salary) from employee where job_id="ENG";/*60000*/
select max(salary) from employee where job_id="ENG";/*120000*/

select min(salary) from employee where job_id="DEV";/*50000*/
select max(salary) from employee where job_id="DEV";/*66000*/

select min(salary) from employee where job_id="ACC";/*40000*/
select max(salary) from employee where job_id="ACC";/*40000*/

select min(salary) from employee where job_id="NET";/*60000*/
select max(salary) from employee where job_id="NET";/*80000*/




create table jobs (
job_id varchar(20) not null primary key,
job_title varchar(20) not null,
min_salary bigint not null,
max_salary bigint not null
);

insert into jobs(job_id,job_title,min_salary,max_salary) values
("DA", "Data Analyst", 80000, 145000),
("SAP", "SAP ", 55000, 98000),
("ENG", "Engineer", 60000, 120000),
("DEV", "Developer", 50000, 66000),
("ACC", "Accounts", 40000, 40000),
("NET", "Networking", 60000, 80000);

select * from jobs;
select job_title,min_salary from jobs order by min_salary desc;
select job_id,max_salary from jobs order by max_salary asc;

create table job_history (
employee_id bigint not null auto_increment primary key,
start_date date not null ,
end_date date not null,
job_id varchar(20) not null,
department_id bigint not null
) auto_increment=1001;

insert into job_history(start_date,end_date,job_id,department_id) values
('2022-02-09', '2023-02-09', 'DA', 10),     
('2023-05-13', '2024-05-13', 'SAP', 20),    
('2021-08-20', '2022-08-20', 'ENG', 30),    
('2020-11-18', '2021-11-18', 'DEV', 40),   
('2022-09-11', '2023-09-11', 'SAP', 20),   
('2024-01-02', '2025-01-02', 'DA', 10),     
('2022-07-24', '2023-07-24', 'DEV', 40),    
('2021-03-29', '2022-03-29', 'NET', 60),    
('2020-06-10', '2021-06-10', 'SAP', 20),   
('2024-02-04', '2025-02-04', 'ENG', 30),    
('2023-12-19', '2024-12-19', 'DA', 10),     
('2020-09-08', '2021-09-08', 'ACC', 50),    
('2021-10-13', '2022-10-13', 'SAP', 20),   
('2022-04-26', '2023-04-26', 'NET', 60),    
('2023-11-21', '2024-11-21', 'DA', 10),     
('2021-05-07', '2022-05-07', 'ACC', 50);    

select * from job_history;
select employee_id,start_date from job_history where start_date > '2023-02-09';
select distinct(job_id) from job_history;
select count(distinct job_id ) from job_history;

create table job_grades(
grade_level varchar(2) not null primary key,
lowest_sal bigint not null,
highest_sal bigint not null
);

insert into job_grades(grade_level,lowest_sal,highest_sal) values
('A', 120000, 150000),
('B', 90000, 120000),
('C', 70000, 90000),
('D', 50000, 70000),
('E', 30000, 50000);

select * from job_grades;

select grade_level from job_grades where lowest_sal<=80000;

create table departments(
department_id bigint not null primary key,
department_name varchar(30) not null,
manager_id bigint not null,
location_id bigint not null
);

insert into departments(department_id,department_name,manager_id,location_id) values
(10,"data analyst",3001,100),
(20,"SAP",3002,101),
(30,"engineer",3003,102),
(40,"developer",3004,103),
(50,"accounts",3005,104),
(60,"networking",3006,105);

select * from departments;



