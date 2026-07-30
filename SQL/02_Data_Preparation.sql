-- =====================================================================================================================
-- HR Analytics Project
-- Phase 2: Data Preparation
-- Objective: Create helper columns for business analysis
-- =====================================================================================================================
USE employee_attrition;

-- =====================================================================================================================
-- Step 1 : Add Age Group 
-- Purpose: Group Employees based on their age to indetify age-related attrition trends and workforce distribution.
-- =====================================================================================================================
ALTER TABLE employee_attrition
ADD COLUMN age_group VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE employee_attrition
SET age_group =
CASE
WHEN age < 30 THEN 'Under 30'
WHEN age BETWEEN 30 AND 39 THEN '30-39'
WHEN age BETWEEN 40 AND 49 THEN '40-49'
ELSE '50+'
END;
-- ======================================================================================================================
-- Step 2  : Add Income Group
-- Purpose : Group employees based on monthly income to compare attrition across different income levels.
-- ======================================================================================================================
ALTER TABLE employee_attrition
ADD COLUMN income_group VARCHAR(20);

UPDATE employee_attrition
SET income_group = 
CASE 
WHEN monthly_income < 5000 THEN 'Low Income'
WHEN monthly_income BETWEEN 5000 AND 9999 THEN 'Medium Income'
ELSE 'High Income'
END;
-- ======================================================================================================================
-- Step 3: Add Years at Company Group
-- Purpose : Group employees based on years at company to analyze retention.
-- ======================================================================================================================
ALTER TABLE employee_attrition
ADD COLUMN years_at_company_group VARCHAR(20);

UPDATE employee_attrition
SET years_at_company_group =
CASE 
WHEN years_at_company < 3 THEN '0-2 Years'
WHEN years_at_company BETWEEN 3 AND 5 THEN '3-5 Years'
WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10 Years'
ELSE '10+ Years'
END;
-- ======================================================================================================================
-- Step 4: Add Distance Group
-- Purpose: Group employees based on commuting distance to evaluate its relationship with employee attrition.
-- ======================================================================================================================
ALTER TABLE employee_attrition
ADD COLUMN distance_group VARCHAR(20);

UPDATE employee_attrition
SET distance_group =
CASE WHEN distance_from_home <=5 THEN 'Near'
WHEN distance_from_home BETWEEN 6 AND 15 THEN 'Moderate'
ELSE 'Far'
END;
-- =====================================================================================================================
-- Step 5: Verify Helper Columns
-- Purpose: Verify all helper columns have been created 
-- =====================================================================================================================
SELECT age, age_group, monthly_income, income_group,
years_at_company, years_at_company_group,
distance_from_home, distance_group
FROM employee_attrition
LIMIT 10;
--  ====================================================================================================================
-- Data Preperation Summary
-- =====================================================================================================================
-- 1.) Created age_group.
-- 2.) Created income_group.
-- 3.) Created years_at_company_group.
-- 4.) Created distance_group.
-- 5.) Verify all helper columns.
