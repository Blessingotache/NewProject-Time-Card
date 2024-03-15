CREATE LOGIN Sam
WITH PASSWORD = 'kadict#1234'
CREATE LOGIN John
WITH PASSWORD = 'kadict#1234'
CREATE LOGIN Samantha
WITH PASSWORD = 'kadict#1234'

USE TimeCard
GO
CREATE USER Sam FOR LOGIN Sam
GO
CREATE USER John FOR LOGIN John
GO
CREATE USER Samantha FOR LOGIN Samantha
GO

EXEC sp_addsrvrolemember 'Sam', 'sysadmin'
GO
EXEC sp_addrolemember 'db_datawriter','Sam'
GO
EXEC sp_addrolemember 'db_datareader','Sam'
GO
EXEC sp_addrolemember 'db_datawriter','John'
GO
EXEC sp_addrolemember 'db_datareader','John'
GO
EXEC sp_addrolemember 'db_datawriter','Samantha'
GO
EXEC sp_addrolemember 'db_datareader','Samantha'
GO
