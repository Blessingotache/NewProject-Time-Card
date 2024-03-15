--==-- Insert into CustomerDetails.Client table :column 'id' (identity primary key)
INSERT INTO CustomerDetails.Client 
	(CompanyName, Address_, City, State_, Zip, Country, ContactPerson,	PhoneNumber)
VALUES
	('Triple A Company', 'No 10b umaru gwandu malali', 'Kaduna', 'Kaduna', '800238', 'Nigeria', 'Manager', '08051889570' )


INSERT INTO CustomerDetails.Client 
	(CompanyName, Address_, City, State_, Zip, Country, ContactPerson,	PhoneNumber)
VALUES
	('bristol palace Ltd', 'No 7A Chad crescent U/Dosa', 'Kaduna', 'Kaduna', '800238', 'Nigeria', 'HR Personel', '08087855597'),
	('Afnan global resource', 'No 15 Lagos street', 'Kaduna', 'Kaduna', '800238', 'Nigeria', 'Secetary', '09098710013'),
	('Ammak Global', 'No 33 Badawa Street', 'Kano', 'Kano', '700101', 'Nigeria', 'Manager', '09091511625'),
	('Centre Stage Ltd', 'No 4A Waila GRA DUTSE', 'Dutse', 'Jigawa', '700101', 'Nigeria', 'HR Personel', '07053331238'),
	('Shemas group Ltd', 'N0 53 Rafin Sanyi', 'Bauchi', 'Bauchi', '742103', 'Nigeria', 'HR Personel', '09024999541'),
	('Alkauthar and co Ltd', 'No 11C Wuse 2, Abuja', 'Abuja', 'Abuja', '900001', 'Nigeria', 'Manager', '09154190117'),
	('Tasidi and Sons Ltd', 'No 30 Gida Dubu, Kazaure', 'Kazaure', 'Jigawa', '720141', 'Nigeria', 'HR Personel', '09151347777'),
	('Golden Pen global', 'No 18E Nasarawa GRA', 'Kano', 'Kano', '700104', 'Nigeria', 'HR Personel', '09163459809'),
	('Talamis Airways', 'No 14 Gwani Muktar', 'Adamawa', 'Adamawa', '640014', 'Nigeria', 'Manager', '09012789884'),
	('Alkanawy Empire', 'No 44 Doctors Quarters', 'Kaduna', 'Kaduna', '800237', 'Nigeria', 'Manager', '09160200988'),
	('Yalwawa Enterprises', 'No 76D Samaru', 'Zaria', 'Kaduna', '800247', 'Nigeria', 'Secetary', '09012739331'),
	('Taro sisi Enterprises', 'No 1C EFCC Quarters', 'Jos', 'Plateau', '740108', 'Nigeria', 'Personal Assistant', '08090021210'),
	('Maje and Art ', 'No 50 Kofar Sauri', 'Katsina', 'Katsina', '820101', 'Nigeria', 'Personal Assistant', '09151310789'),
	('Paradise table water', 'NO 8 Jeka Da Fari', 'Gombe', 'Gombe', '760242', 'Nigeria', 'HR Personel', '08051112222')



SET @ClientID = SCOPE_IDENTITY(); -- Get the last identity value inser


DECLARE @ClientID INT;ted
--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------			 					
--==-- Insert into HumanResources.Employees table :column 'id' (identity primary key)
INSERT INTO HumanResources.Employees (FirstName, LastName, Title, PhoneNumber, BillingRate )
VALUES
    ('Tessy', 'Folorunsho', 'Trainee', '09334900044', 50.00 ),
    ('Merry', 'Temitayo', 'Senior Project Manager', '08057700117', 370.00 ),
    ('Amarchi', 'Edeh', 'Team member', '08085675552', 250.00);

INSERT INTO HumanResources.Employees (FirstName, LastName, Title, PhoneNumber, BillingRate )
VALUES
    ('Bashiru', 'Ahmad', 'Project Manager', '09034304380', 150.00);

	INSERT INTO HumanResources.Employees (FirstName, LastName, Title, PhoneNumber, BillingRate )
VALUES
    ('Dashiru', 'Shehu', 'Team member', '07058902777', '250.00'),
	('Aminah', 'Umar', 'Senior Project Manager', '09026774147', '370.00'),
	('Ebube', 'Aneke', 'Team member', '09151185673', '250.00'),
	('Emanual', 'Omeka', 'Project Manager', '09123448015', '150.00'),
	('Misbahu', 'Alkali', 'Trainee', '09153453450', '50.00'),
	('Isah', 'Adamu', 'Trainee', '09133466445', '50.00'),
	('Rejoice', 'Jermeah', 'Team Leader', '09163400232', '300.00'),
	('Patricia', 'Petter', 'Project Manager', '09127112051', '370.00'),
	('Aliyu', 'Ibrahim', 'Team Leader', '09162789016', '250.00'),
	('Nazifi', 'Adamu', 'Team Leader', '09114562706', '300.00'),
	('Jude', 'Gambo', 'Senior Project Manager', '09027756703', '370.00');
	
DECLARE @EmployeeID INT;
SET @EmployeeID = SCOPE_IDENTITY(); -- Get the last identity value inserted
--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	

--==-- Insert into ProjectDetails.Project table :column 'id' (identity primary key)
INSERT INTO ProjectDetails.Project
	(ProjectName, ProjectDescription, BillingEstimate, StartDate, EndDate, EmployeeID, ClientID)
VALUES
	('Construction management','A project about construction management', '1200.00','2020-02-06', '2022-12-02', 1, 1000)  

INSERT INTO ProjectDetails.Project
	(ProjectName, ProjectDescription, BillingEstimate, StartDate, EndDate, EmployeeID, ClientID)
VALUES
	('Weekend worrious','They develop games.', '156700.00','2020-04-06', '2022-01-04', 2, 1001),
	('Canary','Contruction', '230550.00','2020-09-08', '2022-05-04', 3, 1002),
	('Big fish','Design and Development', '400000.00','2020-02-09', '2022-05-09', 4, 1003),
	('Bender project','Contruction and Development', '350000.00','2020-08-15', '2023-02-13', 1002, 1004),
	('Husky cat','Develop a basic game', '110000.00','2020-08-15', '2022-07-14', 1003, 1005),
	('Westerners','Maintenance execution', '940000.00','2019-10-20', '2021-02-04', 1004, 1006),
	('Galaxy technology','Design and Development', '107000.00','2021-09-08', '2022-08-05', 1005, 1007),
	('Tanhall metting','Design and Development', '130000.00','2020-09-08', '2022-09-15', 1006, 1008),
	('Grade leadership','Leadership Enpowerment Program', '205000.00','2021-04-06', '2023-10-03', 1007, 1009),
	('Passion chasers','Develop a basic game', '800000.00','2021-04-06', '2023-02-25', 1008, 1010),
	('Limited horizones',' Maintenance execution', '182000.00','2020-06-04', '2021-04-25', 1009, 1011),
	('Coding region','Developing an E-Payment App', '164000.00','2019-11-27', '2023-05-07', 1010, 1012),
	('Mentee to mentor','Personal Development Program', '450000.00','2020-10-29', '2022-09-02', 1011, 1013),
	('Skill up','Women Empowerment Program', '300000.00','2020-08-09', '2023-12-04', 1012, 1014);

DECLARE @ProjectID INT;
SET @ProjectID = SCOPE_IDENTITY(); -- Get the last identity value inserted 



--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	




--==-- Insert into Payment.PaymentMethod table :column 'id' (identity primary key)
INSERT INTO Payment.PaymentMethod
	( DescriptionPM_ )
VALUES
	('Credit Card Payment')  

INSERT INTO Payment.PaymentMethod
	( DescriptionPM_ )
VALUES
	('E-Transfer'),
	('Bank Transfer'),
	('Cheques'),
	('E-Transfer'),
	('Credit Card Payment'),
	('Debit Card Payment'),
	('E-Transfer'),
	('Bank Transfer'),
	('Credit Card Payment'),
	('Cheques'),
	('Bank Transfer'),
	('Bank Transfer'),
	('Debit Card Payment'),
	('Debit Card Payment'),
	('Cheques');
	 
	 

DECLARE @PaymentMethodID INT;
SET @PaymentMethodID = SCOPE_IDENTITY(); -- Get the last identity value inserted 

--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	

--==-- Insert into Payment.Payments table :column 'id' (identity primary key)
INSERT INTO Payment.Payments
	(PaymentAmount, PaymentDate, CreditCardNumber, CardHoldersName, CreditCardExpiryDate, ProjectID, PaymentMethodID, PaymentDue)
VALUES
	(50000.00,'2023-01-04', '7199435289990045','Triple A Company', '2027-08-30', 1015, 100, NULL)  



INSERT INTO Payment.Payments
	(PaymentAmount, PaymentDate, CreditCardNumber, CardHoldersName, CreditCardExpiryDate, ProjectID, PaymentMethodID, PaymentDue)
VALUES
	(450000.00,'2023-11-20', NULL,NULL, NULL, 2038, 101, NULL),
	(550000.00,'2023-12-20', NULL,NULL, NULL, 2039, 102, NULL),
	(300000.00,'2023-12-07', NULL,NULL, NULL, 2040, 103, NULL),
	(300000.00,'2023-12-27', NULL,NULL, NULL, 2041, 104, NULL),
	(600000.00,'2023-10-13', '1119930528129004','Shemas group Ltd', '2026-07-29', 2042, 105, NULL),
	(570000.00,'2023-11-15', '1150068289990045','Alkauthar and co Ltd', '2025-08-30', 2043, 106, NULL),
	(405000.00,'2023-12-15', NULL,NULL, NULL, 2044, 107, NULL),
	(250000.00,'2023-12-25', NULL,NULL, NULL, 2045, 108, NULL),
	(800000.00,'2023-12-23', '3096665281190041','Talamis Airways', '2024-08-30', 2046, 109, NULL),
	(730000.00,'2023-12-20', NULL,NULL, NULL, 2047, 110, NULL),
	(602000.00,'2022-12-10', NULL,NULL, NULL, 2048, 111, NULL),
	(100000.00,'2023-12-23', NULL,NULL, NULL, 2049, 112, NULL),
	(740000.00,'2023-12-25', '7122065282093333',NULL, NULL, 2050, 113, NULL),
	(400000.00,'2023-12-29', '4776065282090922','Maje and Art ', '2027-08-30', 2051, 114, NULL);
	

DECLARE @PaymentID INT;
SET @PaymentID = SCOPE_IDENTITY(); -- Get the last identity value inserted 







--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	

--==-- Insert into ProjectDetails.WorkCodes :column 'id' (identity primary key)
INSERT INTO ProjectDetails.WorkCodes
	(Description_)
VALUES
	('Construction')  

INSERT INTO ProjectDetails.WorkCodes
	(Description_)
VALUES
	('Control'),
	('Quality Control'),
	('Management'),
	('Technician'),
	('Management'),
	('Customer Service'),
	('Quality Control'),
	('Research'),
	('Construction'),
	('Control'),
	('Management'),
	('Quality Control'),
	('Research'),
	('Welfare')  

DECLARE @WorkCodeID INT;
SET @WorkCodeID = SCOPE_IDENTITY(); -- Get the last identity value inserted 




--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	

--==-- Insert into ProjectDetails.ExpenseDetails table :column 'id' (identity primary key)
INSERT INTO ProjectDetails.ExpenseDetails
	(DescriptionED_)
VALUES
	('Utilities')  

INSERT INTO ProjectDetails.ExpenseDetails
	(DescriptionED_)
VALUES
	('Maintenance'),
	('Maintenance'),
	('Food'),
	('Maintenance'),
	('Transportation'),
	('Food'),
	('Transportation'),
	('Utilities'),
	('Rent'),
	('Utilities'),
	('Transportation'),
	('Transportation'),
	('Food'),
	('Rent');

DECLARE @ExpenseID INT;
SET @ExpenseID = SCOPE_IDENTITY(); -- Get the last identity value inserted 



--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	
--==-- Insert into ProjectDetails.TimeCards table :column 'id' (identity primary key)
INSERT INTO ProjectDetails.TimeCards
	(DateIssued, BillableHours, ProjectID, EmployeeID, WorkCodeID, DaysWorked)
VALUES
	('2023-12-19','600', 1015, 1, 11, '312')  



INSERT INTO ProjectDetails.TimeCards
	(DateIssued, BillableHours, ProjectID, EmployeeID, WorkCodeID, DaysWorked)
VALUES
	('2023-12-20','600', 2038, 2, 11, '123'),
	('2023-12-29','567', 2039, 3, 12, '167'),
	('2023-12-22','348', 2040, 4, 13, '187'),
	('2023-12-22','234', 2041, 1002, 14, '200'),
	('2023-12-22','568', 2042, 1003, 15, '112'),
	('2023-12-22','499', 2043, 1004, 16, '172'),
	('2023-12-22','453', 2044, 1005, 17, '182'),
	('2023-12-22','230', 2045, 1006, 18, '112'),
	('2023-12-22','290', 2046, 1007, 19, '212'),
	('2023-12-22','440', 2047, 1008, 20, '212'),
	('2023-12-22','570', 2048, 1009, 21, '112'),
	('2023-12-22','340', 2049, 1010, 22, '412'),
	('2023-12-22','320', 2050, 1011, 23, '512'),
	('2023-12-22','590', 2051, 1012, 24, '312')

DECLARE @TimeCardID INT;
SET @TimeCardID = SCOPE_IDENTITY(); -- Get the last identity value inserted 


--==--------------------------------------------------------------------------------------------------------
--==--------------------------------------------------------------------------------------------------------	


INSERT INTO ProjectDetails.TimeCardExpenses
	(ExpenseDate, ExpenseDescription, ExpenseAmount, ProjectID, ExpenseID, TimeCardID)
VALUES
	('2021/05/10','Utilities', '2500', 1015, 111, 1117)  


INSERT INTO ProjectDetails.TimeCardExpenses
	(ExpenseDate, ExpenseDescription, ExpenseAmount, ProjectID, ExpenseID, TimeCardID)
VALUES
	('2019/01/10','Utilities', '5500', 2038, 111, 1121), 
	('2019/01/01','Utilities', '5500', 2039, 112, 1122),
	('2019/01/04','Utilities', '4500', 2040, 113, 1123),
	('2019/01/07','Utilities', '5600', 2041, 114, 1124),
	('2021/03/10','Utilities', '8900', 2042, 115, 1125),
	('2021/01/10','Utilities', '2500', 2043, 116, 1126),
	('2019/01/01','Utilities', '2300', 2044, 117, 1127),
	('2021/01/10','Utilities', '2400', 2045, 118, 1129),
	('2021/02/11','Utilities', '4500', 2046, 119, 1130),
	('2021/02/10','Utilities', '8900', 2047, 120, 1131),
	('2019/01/09','Utilities', '5600', 2048, 121, 1132),
	('2021/01/10','Utilities', '3400', 2049, 122, 1133),
	('2021/02/10','Utilities', '2200', 2050, 123, 1134)

DECLARE @TimeCardExpenseID INT;
SET @TimeCardExpenseID = SCOPE_IDENTITY(); -- Get the last identity value inserted 






