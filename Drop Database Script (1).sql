--To fix 
--Msg 3702, Level 16, State 4, Line 2
--Cannot drop database "TimeCard" because it is currently in use.


---(A)Disconnect Users and Close Connections

USE master;
GO
-- Find active connections to the TimeCard database
SELECT 
    session_id, 
    login_name, 
    host_name, 
    program_name
FROM 
    sys.dm_exec_sessions
WHERE 
    database_id = DB_ID('TimeCard');

--(B)
USE master;
GO

-- Terminate active connections to the TimeCard database
ALTER DATABASE TimeCard
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

---------------------------------------------------------------------------------------------------
--(C)
USE master;
GO

-- Drop the TimeCard database
DROP DATABASE TimeCard;
