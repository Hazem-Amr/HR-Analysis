-- Overall Attrition Rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee;


-- Attrition by Age Group
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY age_group
ORDER BY FIELD(age_group, 'Under 30', '30-40', '41-50', '51+');


-- Attrition based on OverTime
SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY OverTime;


-- Attrition by Gender
SELECT 
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY Gender;


-- Attrition by Department
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY Department;


-- Attrition by Education Field
SELECT 
    EducationField,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY EducationField;


-- Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY JobRole
ORDER BY employees_left DESC;


-- High-Risk Group: OverTime and Age Analysis
SELECT 
    OverTime,
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY OverTime, age_group
ORDER BY attrition_rate_percentage DESC;



-- Attrition by Years at Company
SELECT 
    CASE 
        WHEN YearsAtCompany <= 2 THEN '0-2 year'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 years'
        ELSE '10+ years'
    END AS tenure_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY tenure_band
ORDER BY attrition_rate_percentage DESC;


-- Attrition by Job Role and OverTime
SELECT 
    JobRole,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY JobRole, OverTime
ORDER BY attrition_rate_percentage DESC;


-- Attrition by Education Field and Gender
SELECT 
    EducationField,
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY EducationField, Gender
ORDER BY attrition_rate_percentage DESC;


-- Combination of 3 Factors (Age Group + OverTime + Gender)
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '51+' 
    END AS age_group,
    OverTime,
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate_percentage
FROM dimemployee
GROUP BY age_group, OverTime, Gender
ORDER BY attrition_rate_percentage DESC;

