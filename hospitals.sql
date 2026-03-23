create database hospital;
use hospital;

select * from hospital_records;

SELECT COUNT(DISTINCT Doctor_ID) FROM hospital_records;

select * from hospital_records where outcome ="Referred";

SELECT 
    h1.Doctor_ID,
    h1.Doctor_Name,
    h1.Treatment_Type
FROM hospital_records h1
ORDER BY h1.Doctor_ID desc;

SELECT DISTINCT
    Doctor_ID,
    Doctor_Name,
    Treatment_Type
FROM hospital_records
ORDER BY Doctor_ID;

SELECT 
    Doctor_ID,
    Doctor_Name,
    Count(Patient_ID) as total_patients
FROM hospital_records
WHERE Doctor_Name <> "General Doctor"
GROUP BY Doctor_ID, Doctor_Name
ORDER BY total_patients desc;

SELECT 
    Doctor_ID,
    Doctor_Name,
    AVG(Wait_Time_Minutes) AS avg_wait_time
FROM hospital_records
GROUP BY Doctor_ID, Doctor_Name
ORDER BY avg_wait_time DESC;

 
SELECT 
    YEAR(Admission_Date) AS year,
    MONTH(Admission_Date) AS month,
    COUNT(*) AS total_admissions,
    CASE 
        WHEN COUNT(*) >= 800 THEN "PEAK MONTH"
        WHEN COUNT(*) >= 700 THEN "AVERAGE MONTH"
        ELSE "LOW MONTH"
    END AS MOST_ADMISSONED_MONTH
FROM hospital_records
GROUP BY YEAR(Admission_Date), MONTH(Admission_Date)
ORDER BY year, month;

CREATE TABLE Department_ID (
dept_id int auto_increment primary key,
department varchar(100) 
)auto_increment=20001;

INSERT INTO Department_ID (department) values
("Cardiology"),
("Orthopedics"),
("Oncology"),
("Pediatrics"),
("Neurology"),
("General");

SELECT 
       d.dept_id as Department_ID,
       d.department,
       count(h.Patient_id) as Total_Patients,
       sum(h.Billing_Amount) as Total_Revenue,
       
CASE 
       WHEN sum(h.Billing_Amount) >= 45000000 THEN "GOOD REVENUE"
       WHEN sum(h.Billing_Amount) >= 40000000 THEN "AVERAGE REVENUE"
       ELSE "LOW REVENUE"
       END AS Revenue_Category

FROM hospital_records h
JOIN Department_ID d ON h.department = d.department
GROUP BY d.dept_id, d.department;

SELECT 
       d.dept_id as Department_ID,
       d.department,
       count(h.Patient_id) as Total_Patients
       
FROM hospital_records h
JOIN Department_ID d ON h.department = d.department
where Outcome = "Deceased"
GROUP BY d.dept_id, d.department;

