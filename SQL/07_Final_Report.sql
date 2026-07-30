-- ===================================================================================
-- HR Analytics Project
-- Phase 7: Final Report
-- Objective: Generate executive-level HR metrics and business
-- insights to support workforce planning and employee retention
-- strategies.
-- ===================================================================================
-- Query 1: Overall Attrition Rate
-- Purpose: Calculate the company's overall employee attrition rate.
-- ===================================================================================
SELECT
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 /
COUNT(*), 2
) AS attrition_rate
FROM employee_attrition;
-- ===================================================================================
-- Query 2: Attrition by Department
-- Purpose: Identify departments with the highest employee turnover.
-- ===================================================================================
SELECT department,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY attrition_count DESC;
-- ==================================================================================
-- Query 3: Attrition by Job Role
-- Purpose: Identify job roles with the highest employee attrition.
-- ==================================================================================
SELECT job_role,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY job_role
ORDER BY attrition_count DESC;
-- ==================================================================================
-- Query 4: Attrition by Overtime
-- Purpose: Compare attrition between employees who work overtime
-- and those who do not.
-- ==================================================================================
SELECT over_time,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY over_time
ORDER BY attrition_count DESC;
-- ==================================================================================
-- Query 5: Average Monthly Income by Attrition Status
-- Purpose: Compare the average monthly income of employees who
-- stayed versus employees who left.
-- ==================================================================================
SELECT attrition,
ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition
GROUP BY attrition;
-- ==================================================================================
-- Query 6: Average Years at Company by Attrition Status
-- Purpose: Compare average employee tenure based on attrition
-- status.
-- ==================================================================================
SELECT attrition,
ROUND(AVG(years_at_company), 2) AS average_years_at_company
FROM employee_attrition
GROUP BY attrition;
-- ==================================================================================
-- Query 7: High-Risk Employees
-- Purpose: Identify employees who are more likely to leave based
-- on overtime, job satisfaction, and lower income.
-- ==================================================================================
SELECT employee_number, department, job_role,
over_time, job_satisfaction, monthly_income
FROM employee_attrition
WHERE attrition = 'Yes'
AND over_time = 'Yes'
AND job_satisfaction <= 2
ORDER BY monthly_income;
-- =================================================================================
-- Query 8: Attrition by Business Travel
-- Purpose: Analyze employee attrition by business travel frequency.
-- =================================================================================
SELECT business_travel,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY business_travel
ORDER BY attrition_count DESC;
-- =================================================================================
-- Query 9: Attrition by Age Group
-- Purpose: Compare employee attrition across different age groups.
-- =================================================================================
SELECT age_group,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY age_group
ORDER BY attrition_count DESC;
-- =================================================================================
-- Query 10: Executive KPI Display
-- Purpose: Display key HR indicators.
-- =================================================================================
SELECT
COUNT(*) AS total_employees,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS total_attrition,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 /
COUNT(*), 2
) AS attrition_rate,
ROUND(AVG(age), 2) AS average_age,
ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition;
-- ================================================================================
-- FINAL REPORT SUMMARY
-- ================================================================================
-- Calculated overall employee attrition rate.
-- Identified departments and job roles with the highest turnover.
-- Evaluated the impact of overtime on employee attrition.
-- Compared income and tenure by attrition status.
-- Identified high-risk employee groups.
-- Analyzed attrition by business travel and age group.
-- Generated executive KPIs for workforce reporting.
-- Summarized key HR metrics to support strategic decision-making.