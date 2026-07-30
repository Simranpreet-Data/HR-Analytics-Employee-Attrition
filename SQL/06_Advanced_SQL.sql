-- =======================================================================================
-- HR Analytics Project
-- Phase 6: Advanced SQL
-- Objective: Apply advanced SQL techniques such as window functions, ranking,
--            partitioning, and analytical calculations to generate deeper
--            business insights from the HR dataset.
-- =======================================================================================
-- Query 1: Rank departments by attrition
-- Purpose: Rank departments based on the number of employees who left.
-- =======================================================================================
SELECT department,
COUNT(*) AS attrition_count,
RANK() OVER (ORDER BY COUNT(*) DESC) AS department_rank
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY department;
-- ========================================================================================
-- Query 2: Rank job roles by average monthly income
-- Purpose: Rank job roles based on average monthly income.
-- ========================================================================================
SELECT job_role,
ROUND(AVG(monthly_income),2) AS average_monthly_income,
RANK() OVER (ORDER BY AVG(monthly_income) DESC) AS income_rank
FROM employee_attrition
GROUP BY job_role;
-- ========================================================================================
-- Query 3: Rank employees by monthly income
-- Purpose: Rank employees based on monthly income without skipping ranks.
-- ========================================================================================
SELECT employee_number, job_role, monthly_income,
DENSE_RANK() OVER (ORDER BY monthly_income DESC) AS income_rank
FROM employee_attrition;
-- ========================================================================================
-- Query 4: Row number within each department
-- Purpose: Assign a unique row number to employees within each department.
-- ========================================================================================
SELECT employee_number, department, job_role,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY employee_number)
AS row_num
FROM employee_attrition;
-- =========================================================================================
-- Query 5: Average monthly income by Department
-- Purpose: Compare each employee's income with the department average.
-- =========================================================================================
SELECT employee_number, department, monthly_income,
ROUND(AVG(monthly_income) OVER(PARTITION BY department),2) 
AS department_average_income
FROM employee_attrition;
-- =========================================================================================
-- Query 6: Running total of monthly income
-- Purpose: Calculate the cumulative monthly income across employees.
-- =========================================================================================
SELECT employee_number, monthly_income,
SUM(monthly_income) OVER(ORDER BY employee_number)
AS running_total_income
FROM employee_attrition;
-- ===========================================================================================
-- Query 7: Highest income in each department
-- Purpose: Identify the highest monthly income within each department.
-- ===========================================================================================
SELECT employee_number, department, 
monthly_income,
MAX(monthly_income) OVER(PARTITION BY department) 
AS highest_department_income
FROM employee_attrition;
-- ==========================================================================================
-- Query 8: Previous employee income
-- Purpose: Compare an employee's monthly income with the previous employee.
-- ==========================================================================================
SELECT employee_number, monthly_income,
LAG(monthly_income) OVER(ORDER BY employee_number)
AS previous_income
FROM employee_attrition;
-- ==========================================================================================
-- Query 9: Next employee income
-- Purpose: Compare an employee's monthly income with the next employee.
-- ==========================================================================================
SELECT employee_number, monthly_income,
LEAD(monthly_income) OVER(ORDER BY employee_number)
AS next_income
FROM employee_attrition;
-- ==========================================================================================
-- Query 10: Percent rank by monthly income
-- Purpose: Calculate the relative income ranking of each employee.
-- ==========================================================================================
SELECT employee_number, monthly_income,
PERCENT_RANK() OVER(ORDER BY monthly_income)
AS income_percent_rank
FROM employee_attrition;
-- ==========================================================================================
-- ADVANCED SQL SUMMARY
-- ==========================================================================================
-- Ranked departments by employee attrition.
-- Ranked job roles by average monthly income.
-- Used DENSE_RANK() for employee income ranking.
-- Applied ROW_NUMBER() within department partitions.
-- Used window functions with OVER() for analytical calculations.
-- Applied PARTITION BY for department-level analysis.
-- Calculated running totals using SUM().
-- Used LAG() and LEAD() for sequential income comparison.
-- Applied PERCENT_RANK() for income comparison.
-- Demonstrated advanced SQL analytical skills.