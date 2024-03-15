
SELECT * FROM HumanResources.Employees
SELECT * FROM ProjectDetails.Project
SELECT * FROM CustomerDetails.Client
SELECT * FROM ProjectDetails.TimeCards
SELECT * FROM ProjectDetails.WorkCodes
SELECT * FROM ProjectDetails.TimeCardExpenses

SELECT * FROM ProjectDetails.ExpenseDetails
SELECT * FROM Payment.Payments


SELECT * FROM Payment.PaymentMethod


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
--To Create a report to display the projects and the details of the employee assigned to a project in the following format.

SELECT
    P.ProjectID AS 'Project ID',
    P.ProjectName AS 'Project Name',
    CONCAT(E.FirstName, ' ', E.LastName) AS 'Employee Name',
    E.Title AS 'Employee Title'
FROM
    ProjectDetails.Project P
JOIN
    HumanResources.Employees E ON P.EmployeeID = E.EmployeeID;

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------


--To document the payment details of each client in a text file.
	SELECT
        c.ClientID,
        c.CompanyName,
        p.PaymentID,
        p.PaymentAmount,
        p.PaymentDate
    FROM
        CustomerDetails.Client c
        JOIN Payment.Payments p ON c.ClientID = p.ClientID
