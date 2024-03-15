
--=========================================================================================================================
--=========================================================================================================================
---including the phone number constraint to table CustomerDetails.Client
ALTER TABLE CustomerDetails.Client ADD CONSTRAINT chk1_PhoneNumberFormat 
CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' )

--=========================================================================================================================
--=========================================================================================================================
-- Adding a CHECK constraint to enforce BillingRate > 0 in the table HumanResources.Employees 
ALTER TABLE HumanResources.Employees
ADD CONSTRAINT chk_BillingRateGreaterThanZero CHECK (BillingRate > 0);


---including the phone number constraint in the table HumanResources.Employees
ALTER TABLE HumanResources.Employees ADD CONSTRAINT chk_PhoneNumberFormat 
CHECK (PhoneNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')



--==EDIT BEGINS 15/12/23
-- Adding a CHECK constraint to ensure title must be only those in the list to the Employees table
ALTER TABLE HumanResources.Employees
ADD CONSTRAINT ck_Title CHECK (
    Title IN ('Trainee', 'Team Member', 'Team Leader', 'Project Manager', 'Senior Project Manager')
);
--==EDIT ENDED 15/12/23




--=========================================================================================================================
--=========================================================================================================================

-- Adding a CHECK constraint to enforce BillingEstimate > 1000 to the table ProjectDetails.Project
ALTER TABLE ProjectDetails.Project
ADD CONSTRAINT chk_BillingEstimateGreaterThan1000 CHECK (BillingEstimate > 1000);



-- Adding a CHECK constraint to enforce EndDate > StartDate to the table ProjectDetails.Project
ALTER TABLE ProjectDetails.Project
ADD CONSTRAINT chk_EndDateGreaterThanStartDate CHECK (EndDate > StartDate);


--=========================================================================================================================
--=========================================================================================================================
-- Adding a CHECK constraint to enforce PaymentAmount > 0 to the table Payment.Payments
ALTER TABLE Payment.Payments
ADD CONSTRAINT chk_PaymentAmountGreaterThanZero CHECK (PaymentAmount > 0);


--==EDIT BEGINS 15/12/23
-- Adding a CHECK constraint to the Payments table to check PaymentDate should be greater than the end date of the project. 
--= First Create a Scalar Function
CREATE FUNCTION fn_CheckPaymentDate(
    @PaymentDate DATETIME,
    @ProjectID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT;

    SELECT @Result = CASE WHEN @PaymentDate > EndDate THEN 1 ELSE 0 END
    FROM ProjectDetails.Project
    WHERE ProjectID = @ProjectID;

    RETURN @Result;
END;
--= Second   Alter the table to add the CHECK constraint using the function
ALTER TABLE Payment.Payments
ADD CONSTRAINT ck_PaymentDate
CHECK (dbo.fn_CheckPaymentDate(PaymentDate, ProjectID) = 1);




-- Adding a CHECK constraint to the Payments table to check that the CreditCardExpDate value should be greater than the payment date.
ALTER TABLE Payment.Payments
ADD CONSTRAINT ck_CreditCardExpiryDate
CHECK (CreditCardExpiryDate > PaymentDate);
--==EDIT ENDS 15/12/23

--Adding a CHECK Constraint to enforce Payment Due < Payment Amount of the table Payment.Payments---i dont know what this is for
ALTER TABLE Payment.Payments
ADD CONSTRAINT chk_PaymentDueLessThanPaymentAmount CHECK (PaymentDue < PaymentAmount);
--=========================================================================================================================
--=========================================================================================================================



-- Adding CHECK constraint to enforce ExpenseAmount > 0 to the ProjectDetails.TimeCardExpenses

ALTER TABLE ProjectDetails.TimeCardExpenses
ADD CONSTRAINT chk_ExpenseAmountGreaterThanZero
CHECK (ExpenseAmount > 0);


--==EDIT BEGINS 15/12/23
-- Adding CHECK constraint to enforce ExpenseDate should be less than the project end date.
-- First  Create a Scalar Function
CREATE FUNCTION fn_CheckExpenseDate(
    @ExpenseDate DATETIME,
    @ProjectID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT;

    SELECT @Result = CASE WHEN @ExpenseDate < EndDate THEN 1 ELSE 0 END
    FROM ProjectDetails.Project
    WHERE ProjectID = @ProjectID;

    RETURN @Result;
END;

-- Second 
-- Alter the table to add the CHECK constraint using the function
ALTER TABLE ProjectDetails.TimeCardExpenses
ADD CONSTRAINT ck_ExpenseDate
CHECK (dbo.fn_CheckExpenseDate(ExpenseDate, ProjectID) = 1);
--==EDIT ENDS 15/12/23

--=========================================================================================================================
--=========================================================================================================================




--==EDIT BEGINS 15/12/23
--Adding CHECK constraint to enforce Billable Hours > 0 to the table ProjectDetails.TimeCards
ALTER TABLE ProjectDetails.TimeCards
ADD CONSTRAINT chk_BillableHoursGreaterThanZero CHECK (BillableHours > 0);
--==EDIT ENDS 15/12/23


--==EDIT BEGINS 15/12/23
--Adding CHECK constraint to enforce Date issued should be greater than current Date and the project start date
-- Create a Scalar Function
CREATE FUNCTION fn_CheckDateIssued(
    @DateIssued DATETIME,
    @ProjectID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT;

    SELECT @Result = CASE WHEN @DateIssued > GETDATE() AND @DateIssued > StartDate THEN 1 ELSE 0 END
    FROM ProjectDetails.Project
    WHERE ProjectID = @ProjectID;

    RETURN @Result;
END;


-- Alter the table to add the CHECK constraint using the function
ALTER TABLE ProjectDetails.TimeCards
ADD CONSTRAINT ck_DateIssued
CHECK (dbo.fn_CheckDateIssued(DateIssued, ProjectID) = 1);


--==EDIT ENDS 15/12/23





--==EDIT BEGINS 15/12/23
-- Adding CHECK constraint to enforce DaysWorked should be greater than 0. 


ALTER TABLE ProjectDetails.TimeCards
ADD CONSTRAINT chk_DaysWorked CHECK (DaysWorked > 0);


--==EDIT ENDS 15/12/23








--To add TotalCost to the table ProjectDetails.TimeCards
ALTER TABLE ProjectDetails.TimeCards ADD TotalCost DECIMAL; 


-- To calculate TotalCost using the formula (TotalCost=Billable Hours * BillingRate)
UPDATE tc
SET TotalCost = CAST(tc.BillableHours AS DECIMAL) * CAST(hr.BillingRate AS DECIMAL)
FROM ProjectDetails.TimeCards tc
JOIN HumanResources.Employees hr ON tc.EmployeeID = hr.EmployeeID;
