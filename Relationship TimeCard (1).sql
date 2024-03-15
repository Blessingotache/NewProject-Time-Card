USE TimeCard
GO
-------------------------------------------------------------------------------------------------------------------------
----Adding EmployeeID (Foreign key) to ProjectDetails.Project
ALTER TABLE ProjectDetails.Project
ADD CONSTRAINT fk_Emp FOREIGN KEY (EmployeeID) REFERENCES HumanResources.Employees(EmployeeID)
ON DELETE CASCADE
ON UPDATE CASCADE


----Adding ClientID (Foreign key) to ProjectDetails.Project
ALTER TABLE ProjectDetails.Project
ADD CONSTRAINT fk_ClientID FOREIGN KEY(ClientID) REFERENCES 
CustomerDetails.Client(ClientID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

-------------------------------------------------------------------------------------------------------------------------

---Edited 12/14/2023 3:19pm

----Adding ProjectID (Foreign key) to Payment.Payments
ALTER TABLE Payment.Payments
ADD CONSTRAINT fk_ProjectID FOREIGN KEY(ProjectID) REFERENCES 
ProjectDetails.Project(ProjectID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO


----Adding PaymentMethodID (Foreign key) to Payment.Payments
ALTER TABLE Payment.Payments
ADD CONSTRAINT fk_PaymentMethodID FOREIGN KEY(PaymentMethodID) REFERENCES 
Payment.PaymentMethod(PaymentMethodID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

-------------------------------------------------------------------------------------------------------------------------	

----Adding ProjectID (Foreign key) to ProjectDetails.TimeCards
ALTER TABLE ProjectDetails.TimeCards
ADD CONSTRAINT fk_ProjID FOREIGN KEY(ProjectID) REFERENCES 
ProjectDetails.Project(ProjectID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO


----Adding EmployeeID (Foreign key) to ProjectDetails.TimeCards---MIne didnt run
ALTER TABLE ProjectDetails.TimeCards
ADD CONSTRAINT fk_Emp1 FOREIGN KEY(EmployeeID) REFERENCES 
HumanResources.Employees(EmployeeID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO


----Adding WorkCodeID (Foreign key) to ProjectDetails.TimeCards
ALTER TABLE ProjectDetails.TimeCards
ADD CONSTRAINT fk_WorkCodeID FOREIGN KEY(WorkCodeID) REFERENCES 
ProjectDetails.WorkCodes(WorkCodeID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO


-------------------------------------------------------------------------------------------------------------------------	

----Adding ProjectID (Foreign key) to ProjectDetails.TimeCardExpenses
ALTER TABLE ProjectDetails.TimeCardExpenses
ADD CONSTRAINT fk_ProjID1 FOREIGN KEY(ProjectID) REFERENCES 
ProjectDetails.Project(ProjectID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO	


----Adding ExpenseID (Foreign key) to ProjectDetails.TimeCardExpenses
ALTER TABLE ProjectDetails.TimeCardExpenses
ADD CONSTRAINT fk_ExpenseID FOREIGN KEY(ExpenseID) REFERENCES 
ProjectDetails.ExpenseDetails(ExpenseID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO	


----Adding TimeCardID (Foreign key) to ProjectDetails.TimeCardExpenses
ALTER TABLE ProjectDetails.TimeCardExpenses
ADD CONSTRAINT fk_TimeCID FOREIGN KEY(TimeCardID) REFERENCES 
ProjectDetails.TimeCards(TimeCardID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO	

-----------------------------------------------------------------------------
	---END 12/14/2023 3:53PM