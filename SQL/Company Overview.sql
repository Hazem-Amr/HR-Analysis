-- Attrition Analysis

use hr_management_system;

-- 1. Total employees
SELECT COUNT(*) AS TotalEmployees
FROM dimemployee;

-- 2. Total departments
SELECT COUNT(DISTINCT Department) AS TotalDepartments
FROM dimemployee;

-- 3. Average tenure (years at company)
SELECT AVG(YearsAtCompany) AS AverageTenure
FROM dimemployee;

-- 4. Distribution by job role
SELECT JobRole, COUNT(*) AS Total
FROM dimemployee
GROUP BY JobRole
ORDER BY Total DESC;

-- 5. Average age of employees
SELECT AVG(Age) AS AverageAge
FROM dimemployee;

-- 6. Work-life balance average
SELECT AVG(WorkLifeBalanceID) AS AvgWorkLifeBalance
FROM dimworklifebalance;

-- 7. Overall job satisfaction average
SELECT AVG(JobSatisfactionID) AS AvgJobSatisfaction
FROM dimjobsatisfaction;



