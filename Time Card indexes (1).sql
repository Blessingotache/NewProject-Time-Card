----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

--Creating indexes   (number 7a)

-- Index on FirstName and LastName columns
CREATE INDEX idx_Employees_Name ON HumanResources.Employees (FirstName, LastName);


-- Index on EmployeeID column (used in the foreign key relationship and WHERE clause)
CREATE INDEX idx_TimeCards_EmployeeID ON ProjectDetails.TimeCards (EmployeeID);








--Creating indexes   (number 7b)

-- Index on TimeCardID column in ProjectDetails.TimeCardExpenses table
CREATE INDEX idx_TimeCardExpenses_TimeCardID ON ProjectDetails.TimeCardExpenses (TimeCardID);

-- Index on TimeCardID column in ProjectDetails.TimeCards table
CREATE INDEX idx_TimeCards_TimeCardID ON ProjectDetails.TimeCards (TimeCardID);





--Creating indexes   (number 7c)

-- Index on EmployeeID column in HumanResources.Employees table
CREATE INDEX idx_Employees_EmployeeID ON HumanResources.Employees (EmployeeID);

-- Index on EmployeeID column in ProjectDetails.Project table
CREATE INDEX idx_Project_EmployeeID ON ProjectDetails.Project (EmployeeID);





--Creating indexes   (number 7d)
-- Index on EndDate column in ProjectDetails.Project table
CREATE INDEX idx_Project_EndDate ON ProjectDetails.Project (EndDate);