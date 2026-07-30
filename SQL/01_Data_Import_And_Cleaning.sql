-- ==================================================================================
-- HR Analytics Project
-- Phase 1: Data Import & Cleaning
-- Objective: Prepare the dataset for analysis
-- ==================================================================================
-- Step 1: Select the database
-- Purpose: Select the HR Analytics database for the project
-- ==================================================================================
 USE hr_analytics;

-- ==================================================================================
-- Step 2: View available tables
-- Purpose: Verify that the employee_attrition table has been imported successfully
-- ==================================================================================
 SHOW TABLES;

-- ==================================================================================
-- Step 3: Check columns names and data types
-- Purpose: Review all columns and confirm their data types.
-- ==================================================================================
 DESCRIBE employee_attrition;

-- ==================================================================================
-- Step 4: Preview the first 10 rows
-- Purpose: Display the first 10 records to verify the imported data.
-- =================================================================================
 SELECT * 
 FROM employee_attrition
 LIMIT 10;
 -- ================================================================================
 -- Step 5 : Count Total Columns
 -- Purpose : Verify total number of columns in the dataset
 -- ================================================================================
 SELECT COUNT(*)
 FROM information_schema.columns
 WHERE table_schema = 'hr_analytics'
 AND table_name = 'employee_attrition';

-- ==================================================================================
-- Step 5 : Rename columns for consistency
-- Purpose: Standardize column names for consistency
-- ==================================================================================
ALTER TABLE employee_attrition
RENAME COLUMN ï»¿Age TO age,
RENAME COLUMN Attrition TO attrition,
RENAME COLUMN BusinessTravel TO business_travel,
RENAME COLUMN DailyRate TO daily_rate,
RENAME COLUMN Department TO department,
RENAME COLUMN DistanceFromHome TO distance_from_home,
RENAME COLUMN Education TO education,
RENAME COLUMN EducationField TO education_field,
RENAME COLUMN EmployeeCount TO employee_count,
RENAME COLUMN EmployeeNumber TO employee_number,
RENAME COLUMN EnvironmentSatisfaction TO environment_satisfaction,
RENAME COLUMN Gender TO gender,
RENAME COLUMN HourlyRate TO hourly_rate,
RENAME COLUMN JobInvolvement TO job_involvement,
RENAME COLUMN JobLevel TO job_level,
RENAME COLUMN JobRole TO job_role,
RENAME COLUMN JobSatisfaction TO job_satisfaction,
RENAME COLUMN MaritalStatus TO marital_status,
RENAME COLUMN MonthlyIncome TO monthly_income,
RENAME COLUMN MonthlyRate TO monthly_rate,
RENAME COLUMN NumCompaniesWorked TO num_companies_worked,
RENAME COLUMN Over18 TO over_18,
RENAME COLUMN OverTime TO over_time,
RENAME COLUMN PercentSalaryHike TO percent_salary_hike,
RENAME COLUMN PerformanceRating TO performance_rating,
RENAME COLUMN RelationshipSatisfaction TO relationship_satisfaction,
RENAME COLUMN StandardHours TO standard_hours,
RENAME COLUMN StockOptionLevel TO stock_option_level,
RENAME COLUMN TotalWorkingYears TO total_working_years,
RENAME COLUMN TrainingTimesLastYear TO training_times_last_year,
RENAME COLUMN WorkLifeBalance TO work_life_balance,
RENAME COLUMN YearsAtCompany TO years_at_company,
RENAME COLUMN YearsInCurrentRole TO years_in_current_role,
RENAME COLUMN YearsSinceLastPromotion TO years_since_last_promotion,
RENAME COLUMN YearsWithCurrManager TO years_with_current_manager;

-- ===========================================================================
-- Step 7 : Count Total Employees
-- Purpose: Confirm the total number of records.
-- ===========================================================================
SELECT COUNT(*) AS total_employees
FROM employee_attrition;

-- ============================================================================
-- Step 8 : Check for Duplicate Employee Numbers
-- Purpose: Ensure every employee has a unique employee number
-- ============================================================================
SELECT employee_number, COUNT(*) AS duplicate_count
FROM employee_attrition
GROUP BY employee_number
HAVING COUNT(*) > 1;

-- ============================================================================
-- Step 9 : Check for NULL Values
-- Purpose: Indentify NULL values in important columns.
-- ===========================================================================
SELECT *
FROM employee_attrition
WHERE age IS NULL
OR attrition IS NULL
OR business_travel IS NULL
OR department IS NULL
OR job_role IS NULL
OR monthly_income IS NULL
OR years_at_company IS NULL
OR over_time IS NULL;

-- ================================================================================
-- Step 10 : Check for Blank Values
-- Purpose: Identify blank values in text columns
-- ===============================================================================
SELECT * 
FROM employee_attrition
WHERE department = ''
OR job_role = ''
OR business_travel = ''
OR education_field = ''
OR gender = ''
OR marital_status = ''
OR over_time = '';

-- ================================================================================
-- Step 11 : Check Unique Values
-- Purpose: Review categorial values for consistency
-- ================================================================================
SELECT DISTINCT attrition FROM employee_attrition;
SELECT DISTINCT department FROM employee_attrition;
SELECT DISTINCT job_role FROM employee_attrition;
SELECT DISTINCT gender FROM employee_attrition;
SELECT DISTINCT business_travel FROM employee_attrition;
SELECT DISTINCT education_field FROM employee_attrition;
SELECT DISTINCT marital_status FROM employee_attrition;
SELECT DISTINCT over_time FROM employee_attrition;

-- ================================================================================
-- Step 12 : Validate Numeric Columns
-- Purpose: Verify numeric columns contain reasonablevalues
SELECT MIN(age) AS min_age,
MAX(age) AS max_age,
MIN(monthly_income) AS min_monthly_income,
MAX(monthly_income) AS max_monthly_income,
MIN(total_working_years) AS min_total_working_years,
MAX(total_working_years) AS max_total_working_years,
MIN(years_at_company) AS min_years_at_company,
MAX(years_at_company) AS max_years_at_company,
MIN(distance_from_home) AS min_distance_from_home,
MAX(distance_from_home) AS max_distance_from_home
FROM employee_attrition;

-- ================================================================================
-- Data Cleaning Notes
-- ================================================================================
-- 1.) Verify the HR dataset has been imported successfully.
-- 2.) Review column names and data types.
-- 3.) Check the total number of employee records.
-- 4.) Rename column for consistency.
-- 5.) Check for duplicate employee number values.
-- 6.) Indentify NULL values in important columns.
-- 7.) Indentify blank values in text columns.
-- 8.) Validate categorial value using DISTINCT.
-- 9.) Verify numeric columns contain reasonable values.
-- 10.) Confirm the dataset is clean and ready for data preparation.