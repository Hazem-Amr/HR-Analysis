-- Fact Table

USE HR_MANAGEMENT_SYSTEM;

CREATE TABLE IF NOT EXISTS Fact_Performance (
    PerformanceID VARCHAR(20) PRIMARY KEY,
    EmployeeID VARCHAR(20),
    ReviewDate VARCHAR(20),
    EnvironmentSatisfaction INT,
    JobSatisfaction INT,
    RelationshipSatisfaction INT,
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken INT,
    WorkLifeBalance INT,
    SelfRating INT,
    ManagerRating INT,
    FOREIGN KEY (EmployeeID) REFERENCES DimEmployee(EmployeeID),
    FOREIGN KEY (EnvironmentSatisfaction) REFERENCES DimenvironmentSatisfaction(EnvSatisfactionID),
    FOREIGN KEY (JobSatisfaction) REFERENCES DimjobSatisfaction(JobSatisfactionID),
    FOREIGN KEY (RelationshipSatisfaction) REFERENCES DimRelationshipSatisfaction(RelSatisfactionID),
    FOREIGN KEY (WorkLifeBalance) REFERENCES DimWorklifeBalance(WorklifeBalanceID),
    FOREIGN KEY (SelfRating) REFERENCES DimSelfRating(SelfRatingID),
    FOREIGN KEY (ManagerRating) REFERENCES DimManagerRating(ManagerRatingID)
);
