-- ==============================================================================
-- HR Analytrics Project
-- Phase 5: Stored Procedures
-- Objective: Create reusable stored procedures to automate common HR analysis tasks
--            and simplify reporting.
-- ==============================================================================

-- ==============================================================================
-- Procedure 1: View all employees who left
-- Purpose: Display employees who have left the company.
-- ==============================================================================
DELIMITER $$
CREATE PROCEDURE employees_who_left()
BEGIN
    SELECT *
    FROM employee_attrition
    WHERE attrition = 'Yes';
END $$
DELIMITER ;
-- ==============================================================================
-- Procedure 2: Employees by department
-- Purpose: Retrieve employees from a selected department.
-- ==============================================================================
DELIMITER $$
CREATE PROCEDURE employees_by_department(IN dept_name VARCHAR(100))
BEGIN
    SELECT *
    FROM employee_attrition
    WHERE department = dept_name;
END $$
DELIMITER ;
-- =============================================================================
-- Procedure 3: Employees by job role
-- Purpose: Retrieve employees for a selected job role.
-- =============================================================================
DELIMITER $$
CREATE PROCEDURE employees_by_job_role(IN role_name VARCHAR(100))
BEGIN
    SELECT *
    FROM employee_attrition
    WHERE job_role = role_name;
END $$
DELIMITER ;
-- =============================================================================
-- Procedure 4: Employees by Age Group
-- Purpose: Retrieve employees from a selected age group.
-- =============================================================================
DELIMITER $$
CREATE PROCEDURE employees_by_age_group(IN age_grp VARCHAR(50))
BEGIN
    SELECT *
    FROM employee_attrition
    WHERE age_group = age_grp;
END $$
DELIMITER ;
-- =============================================================================
-- Procedure 5: Employees working Overtime
-- Purpose: Display employees based on overtime status.
-- =============================================================================
DELIMITER $$
CREATE PROCEDURE employees_by_overtime(IN overtime_status VARCHAR(10))
BEGIN
SELECT *
FROM employee_attrition
WHERE over_time = overtime_status;
END $$
DELIMITER ;
-- ===============================================================================
-- EXECUTE STORED PROCEDURES
-- Purpose: Execute each stored procedure to verify it works correctly.
-- ===============================================================================
CALL employees_who_left();
CALL employees_by_department('Sales');
CALL employees_by_job_role('Sales Executive');
CALL employees_by_age_group('Under 30');
CALL employees_by_overtime('Yes');
-- ==============================================================================
-- STORED PROCEDURE SUMMARY
-- ==============================================================================
-- Created a stored procedure to retrieve employees who left the company.
-- Created a stored procedure to retrieve employees by department.
-- Created a stored procedure to retrieve employees by job role.
-- Created a stored procedure to retrieve employees by age group.
-- Created a stored procedure to retrieve employees by overtime status.
-- Executed and verified all stored procedures successfully.