-- ==================================================================================
-- HR ANALYTICS PROJECT
-- PHASE 4 – SQL VIEWS
-- Objective: Create reusable SQL views to simplify reporting, support dashboard development, and improve query efficiency.
-- ==================================================================================
-- VIEW 1 – EMPLOYEE SUMMARY
-- Purpose: Create a summary view containing key employee information.
-- ==================================================================================
CREATE VIEW employee_summary AS
SELECT employee_number, age, age_group,
gender, department, job_role, marital_status,
education_field, monthly_income, years_at_company,
attrition
FROM employee_attrition;
-- ==================================================================================
-- VIEW 2 – ATTRITION SUMMARY
-- Purpose: Create a view showing employees who left the company.
-- ==================================================================================
CREATE VIEW attrition_summary AS
SELECT *
FROM employee_attrition
WHERE attrition = 'Yes';
-- ===================================================================================
-- VIEW 3 – DEPARTMENT SUMMARY
-- Purpose: Create a department-level summary for employee count and average monthly income.
-- ===================================================================================
CREATE VIEW department_summary AS
SELECT department,
COUNT(*) AS total_employees,
ROUND(AVG(monthly_income), 2) AS average_monthly_income
FROM employee_attrition
GROUP BY department;
-- ===================================================================================
-- VIEW 4 – OVERTIME ANALYSIS
-- Purpose: Create a view to analyze overtime and attrition.
-- ===================================================================================
CREATE VIEW overtime_analysis AS
SELECT over_time, attrition,
COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY over_time, attrition;
-- ===================================================================================
-- VIEW 5 – JOB ROLE ANALYSIS
-- Purpose: Create a summary of employees and attrition by job role.
-- ===================================================================================
CREATE VIEW job_role_analysis AS
SELECT job_role,
COUNT(*) AS total_employees,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS attrition_count
FROM employee_attrition
GROUP BY job_role;
-- ===================================================================================
-- VERIFY VIEWS
-- Purpose: Verify that all views were created successfully.
-- ===================================================================================
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
-- ===================================================================================
-- SQL VIEWS SUMMARY
-- ===================================================================================
-- Created Employee Summary View.
-- Created Attrition Summary View.
-- Created Department Summary View.
-- Created Overtime Analysis View.
-- Created Job Role Analysis View.
-- Verified all SQL views were created successfully.