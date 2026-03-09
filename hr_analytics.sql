set SQL_SAFE_UPDATES = 0;
CREATE DATABASE hr_analytics;
USE hr_analytics;


-- Create a Table
CREATE TABLE employees (
    Employee_ID INT,
    Age INT,
    Gender VARCHAR(20),
    Marital_Status VARCHAR(20),
    Department VARCHAR(50),
    Job_Role VARCHAR(50),
    Job_Level INT,
    Monthly_Income INT,
    Hourly_Rate INT,
    Years_at_Company INT,
    Years_in_Current_Role INT,
    Years_Since_Last_Promotion INT,
    Work_Life_Balance INT,
    Job_Satisfaction INT,
    Performance_Rating INT,
    Training_Hours_Last_Year INT,
    Overtime VARCHAR(10),
    Project_Count INT,
    Average_Hours_Worked_Per_Week INT,
    Absenteeism INT,
    Work_Environment_Satisfaction INT,
    Relationship_with_Manager INT,
    Job_Involvement INT,
    Distance_From_Home INT,
    Number_of_Companies_Worked INT,
    Attrition VARCHAR(10),
    Income_Category VARCHAR(20),
    Experience_Level VARCHAR(20),
    Promotion_Status VARCHAR(50),
    Risk_Flag VARCHAR(20)
);

select * from employees;


                                                            #### 1>Data Understanding ####
-- 	Purpose:- Understand dataset structure before performing analysis.
# 1> what does the employee data look like
select * from employees
limit 5;

# 2> How many employees are in data set
select count(*) as total_No_Employee
from employees;

# 3> what columns and datatype exist in the table.
Describe employees;



													    #### 2> Data Cleaning and Validation ####	
-- Purpose :- Ensure the dataset is clean and values are consistent.
# 1> are there any missing value in the monthly income
SELECT *
FROM employees
WHERE Monthly_Income IS NULL;

-- so that there is no any null value in the month income


# 2> Are there duplicate  employee records?
SELECT Employee_ID, COUNT(*)
FROM employees
GROUP BY Employee_ID
HAVING COUNT(*) > 1; # only those employee show which come more than two time

-- so that in this table there is no any duplicate values

# 3> what unique deparment exist in the company
select distinct Department
from employees;

					                                          #### 3> Employee Overview Analysis ####
-- Helps HR understand employee turnover.

# 1> what is the total number of employee
select count(*) as total_number_employee from employees;

# 2> How many employees left the company?
select Attrition, count(*) as employee_count
from employees
group by Attrition;

# 3> What is the overall attrition rate?
SELECT 
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS attrition_rate
FROM employees;


															#### 4> Department Analysis #### 
-- Identify departments with high resignation rates.

# 1> How many employees fall into each income category?
select Income_Category, count(*) as employee
from employees
group by Income_Category;


# 2> Which income category has the highest attrition?
select Income_Category, count(*) as count_as_Attrition
from employees
where Attrition = 'yes'
group by Income_Category;

                                                                             
																#### 5> Experience Level Analysis ####
-- Junior employees usually change jobs more frequently.
# 1> How are employees distributed by experience level?(devided by their experince)
SELECT Experience_Level,
COUNT(*) AS total_employees
FROM employees
GROUP BY Experience_Level;


# 2> Which experience level has the highest attrition?
SELECT Experience_Level,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Experience_Level;


															    #### 6> Promotion Analysis #### 
 -- Employees without promotions for long periods may leave the company.
 
 # 1> How many employees received promotions recently vs no promotion for 5+ years?
 SELECT Promotion_Status,
COUNT(*) AS employee_count
FROM employees
GROUP BY Promotion_Status;

# 2> Does lack of promotion impact attrition?
SELECT Promotion_Status,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Promotion_Status;

                                                                            #### 7> Risk Analysis #### 
-- Helps HR identify employees likely to resign.

# 1> How many employees are classified as High Risk vs Normal?
SELECT Risk_Flag,
COUNT(*) AS employees
FROM employees
GROUP BY Risk_Flag;


# 2> Who are the high-risk employees?
SELECT *
FROM employees
WHERE Risk_Flag='High Risk';


                                                                  #### 8> Advanced SQL Analysis #### 
 -- Window Function (RANK)
 # 1> Who are the highest-paid employees in each department?
 SELECT Employee_ID,
Department,
Monthly_Income,
RANK() OVER(PARTITION BY Department ORDER BY Monthly_Income DESC) AS rank_salary
FROM employees;



# 2> Which departments have the highest attrition?
-- Common Table Expression (CTE)

WITH attrition_data AS
(
SELECT Department,
COUNT(*) AS attrition_count
FROM employees
WHERE Attrition='Yes'
GROUP BY Department
)

SELECT *
FROM attrition_data
ORDER BY attrition_count DESC;



													#### 10> Creating SQL Views for Reporting #### 
 # 1> Can we create a reusable summary table for reporting tools like Power BI?
 -- Allows Power BI to directly use pre-aggregated data.
 CREATE VIEW attrition_summary AS
SELECT Department,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY Department;

