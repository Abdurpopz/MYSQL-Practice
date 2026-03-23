create database task;
use task;

CREATE TABLE students (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL
);

INSERT INTO students(name,address) values
("Abdur","villuupuram"),
("Aaleeyaah","villupuram"),
("Anuu","chennai"),
("Tharun","banglore"),
("Sriram","coimbatore"),
("Palani","coimbatore"),
("Karthi","pondy"),
("Ameen","chennai"),
("Mano","banglore"),
("Arif","pondy");

select * from students order by  name asc ;

CREATE TABLE staffs (
staff_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
staff_name VARCHAR(255) NOT NULL,
designation VARCHAR(255) NOT NULL
)auto_increment=101;

INSERT INTO staffs (staff_name, designation) VALUES
('Arun','trainer'),
('Meena','trainer'),
('Suresh','admin'),
('Priya','trainer'),
('Rahul','admin'),
('Kavya','admin'),
('Vignesh','admin'),
('Lakshmi','trainer'),
('Manoj','accountant'),
('Hardik','trainer'),
('Nisha','accountant'),
('Jadeja','admin');


 select * from staffs;

CREATE TABLE students_staffs_map (
map_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
stu_id INT NOT NULL,
staf_id INT NOT NULL,
FOREIGN KEY (stu_id) REFERENCES students(id),
FOREIGN KEY (staf_id) REFERENCES staffs(staff_id)
);

INSERT INTO students_staffs_map(stu_id,staf_id) VALUES
(1,101),
(2,102),
(3,103),
(4,104),
(5,105),
(6,106),
(7,107),
(8,108),
(9,109),
(10,110);

SELECT * FROM students_staffs_map;

SELECT st.id,
	   st.name,
       st.address,
       
       sf.staff_id,
       sf.staff_name,
       sf.designation ,
       
IF (sf.designation ="trainer","teaching staff",
IF(sf.designation='admin','administrative staff','others') 
)as staff_category,
IF (sf.staff_id IS NOT NULL,'assigned','not assigned') AS appointed,
(SELECT COUNT(*) appointed) AS teacher_student_pair
FROM students st 
JOIN students_staffs_map ssm ON st.id = ssm.stu_id
JOIN staffs sf               ON ssm.staf_id = sf.staff_id
;


