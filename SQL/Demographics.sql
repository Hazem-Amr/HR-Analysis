-- Demographics

use hr_management_system;

-- 1. Gender distribution
SELECT Gender, COUNT(*) AS Total
FROM dimemployee
GROUP BY Gender;

-- 2. Age distribution (Grouped)
SELECT CASE 
         WHEN Age < 25 THEN 'Under 25'
         WHEN Age BETWEEN 25 AND 34 THEN '25-34'
         WHEN Age BETWEEN 35 AND 44 THEN '35-44'
         WHEN Age >= 45 THEN '45+'
       END AS AgeGroup, 
       COUNT(*) AS Total
FROM dimemployee
GROUP BY CASE 
           WHEN Age < 25 THEN 'Under 25'
           WHEN Age BETWEEN 25 AND 34 THEN '25-34'
           WHEN Age BETWEEN 35 AND 44 THEN '35-44'
           WHEN Age >= 45 THEN '45+'
         END;

-- 3. Marital status breakdown
SELECT MaritalStatus, COUNT(*) AS Total
FROM dimemployee
GROUP BY MaritalStatus;

-- 4 Diversity by department
SELECT Department, Gender, COUNT(*) AS Total
FROM dimemployee
GROUP BY Department, Gender;





