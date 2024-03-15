-- Create login for Sam (Database Administrator)
CREATE LOGIN SAMS WITH PASSWORD = 'SAMS';
ALTER SERVER ROLE sysadmin ADD MEMBER SAMS;

-- Create login for John (Read/Write permissions)
CREATE LOGIN John WITH PASSWORD = 'John';

-- Create login for Samantha (Read/Write permissions)
CREATE LOGIN Samantha WITH PASSWORD = 'Samantha';
--------------------------------------------------------
---------------------------------------------------------


-- Create user for Sam in the TimeCard database
USE TimeCard;
CREATE USER Sam FOR LOGIN Sam;

-- Create user for John in the TimeCard database
CREATE USER John FOR LOGIN John;

-- Create user for Samantha in the TimeCard database
CREATE USER Samantha FOR LOGIN Samantha;



--------------------------------------------------------
--------------------------------------------------------

-- Grant read/write permissions to John
GRANT INSERT, UPDATE, DELETE, SELECT ON SCHEMA::ProjectDetails TO John;

-- Grant read/write permissions to Samantha
GRANT INSERT, UPDATE, DELETE, SELECT ON SCHEMA::ProjectDetails TO Samantha;


