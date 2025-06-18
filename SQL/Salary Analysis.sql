-- Salary Analysis

use hr_management_system;

-- 1. Average salary
SELECT AVG(Salary) AS AverageSalary
FROM dimemployee;

-- 2. Salary by department
SELECT Department, AVG(Salary) AS AvgSalary
FROM dimemployee
GROUP BY Department
ORDER BY AvgSalary DESC;

-- 3. Salary by job role
SELECT JobRole, AVG(Salary) AS AvgSalary
FROM dimemployee
GROUP BY JobRole
ORDER BY AvgSalary DESC;

-- 4. Salary distribution
SELECT Salary, COUNT(*) AS Total
FROM dimemployee
GROUP BY Salary
ORDER BY Salary;

-- 5. Salary range grouping
SELECT CASE 
         WHEN Salary < 3000 THEN 'Below 3K'
         WHEN Salary BETWEEN 3000 AND 6000 THEN '3K-6K'
         WHEN Salary BETWEEN 6001 AND 9000 THEN '6K-9K'
         ELSE 'Above 9K'
       END AS SalaryRange, COUNT(*) AS Total
FROM dimemployee
GROUP BY CASE 
         WHEN Salary < 3000 THEN 'Below 3K'
         WHEN Salary BETWEEN 3000 AND 6000 THEN '3K-6K'
         WHEN Salary BETWEEN 6001 AND 9000 THEN '6K-9K'
         ELSE 'Above 9K'
         END;

-- 6. Gender salary gap
SELECT Gender, AVG(Salary) AS AvgSalary
FROM dimemployee
GROUP BY Gender;

-- 7. Salary vs performance rating
SELECT p.ManagerRatingID, AVG(e.Salary) AS AvgSalary
FROM factperformance p
JOIN dimemployee e ON p.EmployeeID = e.EmployeeID
GROUP BY p.ManagerRatingID;




