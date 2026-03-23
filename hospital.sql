create database hospital;
use hospital;

select * from Hospital_records;

select count(*) Admission_Date from Hospital_records;

select * from Hospital_records where outcome ="Referred";


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

SELECT Doctor_ID,
	   count(*) as Total_Doc_id
FROM hospital_records h1
GROUP BY Doctor_ID;

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
    Doctor_ID,
    Doctor_Name,
    Department,
    count(Patient_ID) as Total_Patient
FROM hospital_records
GROUP BY Doctor_ID,Doctor_Name,Department
ORDER BY Total_Patient asc;
 
SELECT 
    YEAR(Admission_Date) AS year,
    MONTH(Admission_Date) AS month,
    COUNT(*) AS total_admissions,
    CASE 
        WHEN COUNT(*) >= 6600 THEN "PEAK MONTH"
        WHEN COUNT(*) >= 6300 THEN "AVERAGE MONTH"
        ELSE "LOW MONTH"
    END AS MOST_ADMISSONED_MONTH
FROM hospital_records
GROUP BY YEAR(Admission_Date), MONTH(Admission_Date)
ORDER BY year, month;