-- =============================================================================================
-- Hr Analytics Project
-- Phase 3: Business Analysis
-- Objective: Analyze employee attrition, workforce demographics, and key HR metrics to 
--            identify trends and generate business insights for better decision-making.
-- =============================================================================================
-- =============================================================================================
-- SECTION 1 – WORKFORCE OVERVIEW
-- =============================================================================================

-- =============================================================================================
-- Business Question 1: Total Employees
-- Purpose: Calculate the total number of employees in the organization.
-- =============================================================================================
SELECT COUNT(*) AS total_employees
FROM employee_attrition;
-- =============================================================================================
-- Business Question 2: Total Employees Who Left
-- Purpose: Count the total number of employees who left the company.
-- =============================================================================================
SELECT COUNT(*) AS employees_left
FROM employee_attrition
WHERE attrition = 'Yes';
-- =============================================================================================
-- Business Question 3: Attrition Rate
-- Purpose: Calculate the percentage of employees who left the company.
-- =============================================================================================
SELECT
ROUND(COUNT(CASE 
WHEN attrition = 'Yes' THEN 1 END) * 100.0 /COUNT(*),2) AS attrition_rate
FROM employee_attrition;
-- =============================================================================================
-- Business Question 4: Average Age
-- Purpose:
-- Calculate the average age of employees.
-- =============================================================================================
SELECT
ROUND(AVG(age), 2) AS average_age
FROM employee_attrition;
-- =============================================================================================
-- Business Question 5: Average Monthly Income
-- Purpose: Calculate the average monthly income of employees.
-- =============================================================================================
SELECT
ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition;
-- =============================================================================================
-- SECTION 2 – DEPARTMENT ANALYSIS
-- =============================================================================================
-- Business Question 6: Employee by Department
-- Purpose: Indentify departments with the highest attrition
-- =============================================================================================
SELECT department,
COUNT(*) AS total_employees
FROM employee_attrition
GROUP BY department
ORDER BY total_employees DESC;
-- =============================================================================================
-- Business Question 7: Attrition by Department
-- Purpose : Indentify departments with the highest attrition
-- =============================================================================================
SELECT department,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY attrition_count DESC;
-- ============================================================================================
-- Business Question 8: Attrition by Job Role
-- Purpose : Indentify Job Role with the highest attrition
-- ============================================================================================
SELECT job_role,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY attrition_count DESC;
-- ===========================================================================================
-- Business Question 9: Attrition by Gender
-- Purpose : Indentify Gender with the highest attrition
-- ===========================================================================================
SELECT gender,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY gender;
-- ==========================================================================================
-- Business Question 10: Attrition by Overtime
-- Purpose : Indentify Overtime with the highest attrition
-- ==========================================================================================
SELECT over_time,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY over_time;
-- ==========================================================================================
-- SECTION 3: COMPENSATION & EXPERIENCE
-- ==========================================================================================
-- Business Question 11: Employees by Income Group
-- Purpose: Analyze distribution of employees across different income group
-- ==========================================================================================
SELECT income_group,
COUNT(*) AS total_employees
FROM employee_attrition
GROUP BY income_group
ORDER BY total_employees DESC;
-- =========================================================================================
-- Business Question 12: Attrition by Income Group
-- Purpose: Identify which income group has the highest employee attrition
-- =========================================================================================
SELECT income_group,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY income_group
ORDER BY attrition_count DESC;
-- =========================================================================================
-- Business Question 13: Average monthly income by job role
-- Purpose: Compare average monthly income across different job roles
-- =========================================================================================
SELECT job_role,
ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition
GROUP BY job_role
ORDER BY average_monthly_income desc;
-- ==========================================================================================
-- Business Question 14: Average total working years by Department
-- Purpose: Analyze work experience of employees in each department
-- ==========================================================================================
SELECT department,
ROUND(AVG(total_working_years), 2) AS average_working_years
FROM employee_attrition
GROUP BY department
ORDER BY average_working_years desc;
-- ==========================================================================================
-- Business Question 15: Attrition by years at company group
-- Purpose: Which employee group has the highest attrition
-- ==========================================================================================
SELECT years_at_company_group,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY years_at_company_group
ORDER BY attrition_count DESC;

-- ==========================================================================================
-- SECTION 4 – SATISFACTION & PERFORMANCE
-- ==========================================================================================

-- ==========================================================================================
-- Business Question 16: Attrition by Job Satisfaction
-- Purpose: Analyze employee attrition across different job satisfaction levels.
-- ==========================================================================================
SELECT job_satisfaction,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY job_satisfaction
ORDER BY job_satisfaction;
-- =========================================================================================
-- Business Question 17: Attrition by Environment Satisfaction
-- Purpose: Determine whether workplace environment satisfaction impacts employee attrition.
-- ==========================================================================================
SELECT environment_satisfaction,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY environment_satisfaction
ORDER BY environment_satisfaction;
-- ===========================================================================================
-- Business Question 18: Attrition by Work-Life Balance
-- Purpose: Analyze employee attrition based on work-life balance ratings.
-- ===========================================================================================
SELECT work_life_balance,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY work_life_balance
ORDER BY work_life_balance;
-- ============================================================================================
-- Business Question 19: Attrition by Performance Rating
-- Purpose: Compare employee attrition across different performance ratings.
-- ============================================================================================
SELECT performance_rating,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY performance_rating
ORDER BY performance_rating;
-- ============================================================================================
-- Business Question 20: Attrition by Overtime
-- Purpose: Evaluate whether employees working overtime are more likely to leave the company.
-- ============================================================================================
SELECT over_time,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY over_time
ORDER BY attrition_count DESC;
-- ==========================================================================================
-- SECTION 5 – EMPLOYEE DEMOGRAPHICS
-- ==========================================================================================

-- ==========================================================================================
-- Business Question 21: Attrition by Gender
-- Purpose: Compare employee attrition across different genders
-- ==========================================================================================
SELECT gender,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY gender
ORDER BY attrition_count DESC;
-- ==========================================================================================
-- Business Question 22: Attrition by Marital Status
-- Purpose: Analyze employee attrition based on marital status.
-- ==========================================================================================
SELECT marital_status,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY marital_status
ORDER BY attrition_count DESC;
-- ==========================================================================================
-- Business Question 23: Attrition by Education Field
-- Purpose: Identify which education fields have the highest employee attrition.
-- ==========================================================================================
SELECT education_field,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY education_field
ORDER BY attrition_count DESC;
-- ========================================================================================
-- Business Question 24: Attrition by Business Travel
-- Purpose: Evaluate whether business travel frequency is associated with employee attrition.
-- ========================================================================================
SELECT business_travel,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY business_travel
ORDER BY attrition_count DESC;
-- ========================================================================================
-- Business Question 25: Attrition by Age Group
-- Purpose: Compare employee attrition across different age groups.
-- ========================================================================================
SELECT age_group,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY age_group
ORDER BY attrition_count DESC;
-- =========================================================================================
-- SECTION 6 – ADVANCED BUSINESS ANALYSIS
-- =========================================================================================

-- =========================================================================================
-- Business Question 26: Top 5 Job Roles with Highest Attrition
-- Purpose: Identify the job roles with the highest number of employees who left the company.
-- =========================================================================================
SELECT
job_role,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY attrition_count DESC
LIMIT 5;
-- ==========================================================================================
-- Business Question 27: Department with the Highest Attrition Rate
-- Purpose: Calculate the attrition rate for each department to identify departments with the highest employee turnover.
-- ==========================================================================================
SELECT department,
COUNT(*) AS total_employees,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS attrition_count,
ROUND(COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 /COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;
-- =========================================================================================
-- Business Question 28: Average Monthly Income of Employees Who Left
-- Purpose: Compare the average monthly income of employees who left the company.
-- =========================================================================================
SELECT
ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition
WHERE attrition = 'Yes';
-- =========================================================================================
-- Business Question 29: Employees with More Than 10 Years at Company Who Left
-- Purpose: Identify experienced employees who left after working for more than 10 years.
-- =========================================================================================
SELECT employee_number, age, gender, department,
job_role, years_at_company, monthly_income
FROM employee_attrition
WHERE years_at_company > 10
AND attrition = 'Yes';
-- =========================================================================================
-- Business Question 30: High-Risk Employee Profile
-- Purpose: Identify employee groups with higher attrition by combining multiple business factors.
-- =========================================================================================
SELECT age_group, department, job_role,
over_time, income_group,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY age_group, department, job_role,
over_time, income_group
ORDER BY attrition_count DESC;
-- =========================================================================================
-- ATTRITION ANALYSIS SUMMARY
-- =========================================================================================
-- 1.) Analyzed overall workforce metrics and attrition rate.
-- 2.) Evaluated employee distribution across departments and job roles.
-- 3.) Analyzed compensation and employee experience.
-- 4.) Examined satisfaction, performance, and overtime trends.
-- 5.) Explored employee demographics related to attrition.
-- 6.) Identified high-risk employee segments using advanced business analysis.
-- 7.) Generated business insights to support HR decision-making.
