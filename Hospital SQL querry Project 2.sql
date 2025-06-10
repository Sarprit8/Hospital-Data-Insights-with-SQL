DROP TABLE IF EXISTS Hospital;


CREATE TABLE Hospital(
            Hospital_name VARCHAR (100) NOT NULL,
			Location VARCHAR (50),
			Department VARCHAR (50), 
			Doctors_count INT,
			Patients_count INT,
			Addmission_date DATE,
			Discharge_date DATE,
			Medical_expenses NUMERIC(10,2)
);



SELECT * FROM Hospital;


--Total Number of Patients 
SELECT SUM(Patients_count) AS Total_count_patients
FROM Hospital; 


--Average Number of Doctors per Hospital
SELECT Hospital_name, AVG(Doctors_count) AS Average_doc
FROM Hospital
GROUP BY hospital_name;


--Top 3 Departments with the Highest Number of Patients 
SELECT  department, SUM(patients_count) 
FROM Hospital
GROUP BY department
ORDER BY SUM(Patients_count) DESC LIMIT 3;


--Hospital with the Maximum Medical Expenses 
SELECT Hospital_name, SUM(Medical_expenses)
FROM Hospital
GROUP BY Hospital_name
ORDER BY SUM(Medical_expenses) DESC LIMIT 1;



--Daily Average Medical Expenses 
SELECT Hospital_name, AVG(Medical_expenses) AS AVG_medical_exp
FROM Hospital
GROUP BY hospital_name;



--Longest Hospital Stay 
SELECT *,
	   Discharge_date - Addmission_date AS Duration
FROM Hospital 
ORDER BY Duration DESC LIMIT 1;



--Total Patients Treated Per City 
SELECT Location, SUM(patients_count) AS Total_patients
FROM Hospital
GROUP BY Location;



--Average Length of Stay Per Department
SELECT DISTINCT Department, 	
		AVG(Discharge_date - Addmission_date) AS AVG_stay_period 
FROM Hospital
GROUP BY Department
ORDER BY AVG_stay_period DESC;



--Identify the Department with the Lowest Number of Patients
SELECT DISTINCT Department, SUM(Patients_count)
FROM Hospital
GROUP BY Department
ORDER BY SUM(Patients_count) ASC LIMIT 1;




-- Monthly Medical Expenses Report 
SELECT DATE_PART( 'MONTH', Addmission_date) AS Month,
		SUM(Medical_expenses) AS Total_exp
FROM Hospital
GROUP BY Month
ORDER BY Month;  



