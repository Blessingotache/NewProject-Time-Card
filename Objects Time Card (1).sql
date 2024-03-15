----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
---Creating all the schemas

---Creating schema CustomerDetails
CREATE SCHEMA CustomerDetails;

 ---Creating schema HumanResources
CREATE SCHEMA HumanResources;

---Creating schema ProjectDetails
CREATE SCHEMA  ProjectDetails;   

---Creating schema Payment
CREATE SCHEMA  Payment;


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
--==Creating all TABLES

---Creating table CustomerDetails.Client
CREATE TABLE CustomerDetails.Client (
    ClientID INT IDENTITY(1000,1) NOT NULL,
    CompanyName VARCHAR(50) NOT NULL,
	Address_ VARCHAR(200) NOT NULL,
	City VARCHAR(50) NOT NULL,
    State_ VARCHAR(50) NOT NULL,
	Zip VARCHAR(20) NOT NULL,
	Country VARCHAR(30) NOT NULL,
	ContactPerson VARCHAR(30) NOT NULL,
	PhoneNumber VARCHAR (20) NOT NULL,
	CONSTRAINT pk_ClientID PRIMARY KEY (ClientID),
); 


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
---Creating table HumanResources.Employees
CREATE TABLE HumanResources.Employees (
    EmployeeID INT IDENTITY(1,1) NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Title VARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
	BillingRate DECIMAL (15,2) NOT NULL,

    CONSTRAINT pk_EmployeeID PRIMARY KEY (EmployeeID),
);



----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------


---Creating table ProjectDetails.Project
CREATE TABLE ProjectDetails.Project (
    ProjectID INT IDENTITY(10,1) NOT NULL,
    ProjectName VARCHAR(100) NOT NULL,
	ProjectDescription VARCHAR(200) NOT NULL,
	BillingEstimate DECIMAL(15,2) NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	EmployeeID INT,
	ClientID INT,
    CONSTRAINT pk_ProjectID PRIMARY KEY (ProjectID)
); 




----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
------Creating table Payment.PaymentMethod
 
CREATE TABLE Payment.PaymentMethod (
    PaymentMethodID INT IDENTITY(100,1) NOT NULL,
    DescriptionPM_ VARCHAR(100) NOT NULL,
	
	CONSTRAINT pk_PaymentMethodID PRIMARY KEY (PaymentMethodID)
); 


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

------Creating table  Payment.Payments
 
CREATE TABLE Payment.Payments (
    PaymentID BIGINT IDENTITY(1000,1) NOT NULL,
    PaymentAmount MONEY NOT NULL,
	PaymentDate DATETIME NOT NULL,
    CreditCardNumber VARCHAR(30) NULL,
	CardHoldersName VARCHAR(50) NOT NULL,
	CreditCardExpiryDate DATE NOT NULL,
	ProjectID INT,
	PaymentMethodID INT
	CONSTRAINT pk_PaymentID PRIMARY KEY (PaymentID),
);
ALTER TABLE Payment.Payments ADD PaymentDue MONEY NULL; 

--To document the payment details of each client in a text file. I need Client ID in the payment table
-- Step 1: Alter Table to Add ClientID Column
ALTER TABLE Payment.Payments
ADD ClientID INT;



-- Step 2: Update Existing Records (if needed)
	UPDATE Payment.Payments  SET ClientID = '1001'  WHERE PaymentID = '1004';
	UPDATE Payment.Payments  SET ClientID = '1002'  WHERE PaymentID = '1093';
	UPDATE Payment.Payments  SET ClientID = '1003'  WHERE PaymentID = '1094';
	UPDATE Payment.Payments  SET ClientID = '1004'  WHERE PaymentID = '1095';
	UPDATE Payment.Payments  SET ClientID = '1005'  WHERE PaymentID = '1096';
	UPDATE Payment.Payments  SET ClientID = '1006'  WHERE PaymentID = '1097';
	UPDATE Payment.Payments  SET ClientID = '1007'  WHERE PaymentID = '1098';
	UPDATE Payment.Payments  SET ClientID = '1008'  WHERE PaymentID = '1099';
	UPDATE Payment.Payments  SET ClientID = '1009'  WHERE PaymentID = '1100';
	UPDATE Payment.Payments  SET ClientID = '1010'  WHERE PaymentID = '1101';
	UPDATE Payment.Payments  SET ClientID = '1011'  WHERE PaymentID = '1102';
	UPDATE Payment.Payments  SET ClientID = '1012'  WHERE PaymentID = '1103';
	UPDATE Payment.Payments  SET ClientID = '1013'  WHERE PaymentID = '1104';
	UPDATE Payment.Payments  SET ClientID = '1014'  WHERE PaymentID = '1105';
	UPDATE Payment.Payments  SET ClientID = '1000'  WHERE PaymentID = '1106';

-- Step 3: Add Foreign Key Constraint
ALTER TABLE Payment.Payments
ADD CONSTRAINT fk1_ClientID FOREIGN KEY (ClientID) REFERENCES CustomerDetails.Client(ClientID);




--To make CardHoldersName NULL
ALTER TABLE Payment.Payments
ALTER COLUMN CardHoldersName VARCHAR(50) NULL;

UPDATE Payment.Payments
SET CardHoldersName = NULL;

--To make CreditCardExpiryDate NULL
ALTER TABLE Payment.Payments
ALTER COLUMN CreditCardExpiryDate DATE NULL;

UPDATE Payment.Payments
SET CreditCardExpiryDate = NULL;



----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
------Creating table  ProjectDetails.WorkCodes 

CREATE TABLE ProjectDetails.WorkCodes (
    WorkCodeID INT IDENTITY(11,1) NOT NULL,
    Description_ VARCHAR(100) NOT NULL,
	
	CONSTRAINT pk_WorkCodeID PRIMARY KEY (WorkCodeID),
);


----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
------Creating table  ProjectDetails.ExpenseDetails

CREATE TABLE ProjectDetails.ExpenseDetails (
    ExpenseID INT IDENTITY(111,1) NOT NULL,
    DescriptionED_ VARCHAR(100) NOT NULL,

	CONSTRAINT pk_ExpenseID PRIMARY KEY (ExpenseID)
); 

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

------Creating table  ProjectDetails.TimeCards

CREATE TABLE ProjectDetails.TimeCards (
    TimeCardID INT IDENTITY(1111,1) NOT NULL,
    DateIssued DATETIME NOT NULL,
	BillableHours DECIMAL(7,2) NOT NULL,
	ProjectID INT,
	EmployeeID INT,
	WorkCodeID INT,
	DaysWorked DATE NOT NULL,

	CONSTRAINT pk_TimeCardID PRIMARY KEY (TimeCardID)	
);
--EDITED BEGINS 15/12/23
ALTER TABLE ProjectDetails.TimeCards
DROP COLUMN DaysWorked;
ALTER TABLE ProjectDetails.TimeCards ADD DaysWorked INT NOT NULL
--EDITED ENDS 15/12/23

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
------Creating table  ProjectDetails.TimeCardExpenses

CREATE TABLE ProjectDetails.TimeCardExpenses (
    TimeCardExpenseID INT IDENTITY(150,1) NOT NULL,
    ExpenseDate DATETIME NOT NULL,
	ExpenseDescription CHAR(200) NOT NULL,
	ExpenseAmount MONEY NOT NULL,
	ProjectID INT,
	ExpenseID INT,
	TimeCardID INT,
	CONSTRAINT pk_TimeCardExpenseID PRIMARY KEY (TimeCardExpenseID),
); 


