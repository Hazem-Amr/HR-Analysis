-- Dimension Tables

USE HR_MANAGEMENT_SYSTEM;

CREATE TABLE IF NOT EXISTS DimEducationLevel (
    EducationLevelID INT PRIMARY KEY,
    EducationLevel VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS DimenvironmentSatisfaction (
    EnvSatisfactionID INT PRIMARY KEY,
    SatisfactionLevel VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimjobSatisfaction (
    JobSatisfactionID INT PRIMARY KEY,
    SatisfactionLevel VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimRelationshipSatisfaction (
    RelSatisfactionID INT PRIMARY KEY,
    SatisfactionLevel VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimSelfRating(
    SelfRatingID INT PRIMARY KEY,
    RatingLevel VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimManagerRating (
    ManagerRatingID INT PRIMARY KEY,
    RatingLevel VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS DimWorklifeBalance (
    WorklifeBalanceID INT PRIMARY KEY,
    RatingLevel VARCHAR(50)
);



CREATE TABLE IF NOT EXISTS DimEmployee (
    EmployeeID VARCHAR(20) PRIMARY KEY UNIQUE,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    BusinessTravel VARCHAR(50),
    Department VARCHAR(50),
    DistanceFromHome INT,
    State VARCHAR(20),
    Ethnicity VARCHAR(50),
    EducationLevelID INT,
    EducationField VARCHAR(100),
    JobRole VARCHAR(100),
    MaritalStatus VARCHAR(20),
    Salary INT,
    StockOptionLevel INT,
    OverTime VARCHAR(10),
    HireDate VARCHAR(10),
    Attrition VARCHAR(10),
    YearsAtCompany INT,
    YearsInMostRecentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    FOREIGN KEY (EducationLevelID) REFERENCES DimEducationLevel(EducationLevelID)
);


