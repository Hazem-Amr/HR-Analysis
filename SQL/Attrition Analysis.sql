-- Attrition Analysis

use hr_management_system;

-- 1. Count of attrition (Yes/No)
SELECT Attrition, COUNT(*) AS Total
FROM dimemployee
GROUP BY Attrition;

-- 2. Attrition rate (%)
SELECT 
  (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS AttritionRatePercentage
FROM dimemployee;

-- 3. Attrition by department
SELECT Department, 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft
FROM dimemployee
GROUP BY Department;

-- 4. Attrition by gender
SELECT Gender, 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft
FROM dimemployee
GROUP BY Gender;

-- 5. Average years at company for employees who left vs stayed
SELECT Attrition, AVG(YearsAtCompany) AS AvgYearsAtCompany
FROM dimemployee
GROUP BY Attrition;

-- 6. Job roles with highest attrition
SELECT JobRole, COUNT(*) AS AttritionCount
FROM dimemployee
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY AttritionCount DESC;



