---For Creating the database TimeCard
USE master
GO
CREATE DATABASE TimeCard	
ON PRIMARY
  ( NAME='TimeCard_Primary',
    FILENAME=
       'c:\Data\TimeCard_Prm.mdf',
    SIZE=4MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
FILEGROUP TimeCard_FG1
  ( NAME = 'TimeCard_FG1_Dat1',
    FILENAME =
       'c:\Data\TimeCard_FG1_1.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB),
  ( NAME = 'TimeCard_FG1_Dat2',
    FILENAME =
       'c:\Data\TimeCard_FG1_2.ndf',
    SIZE = 1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB)
LOG ON
( NAME='TimeCard_log',
    FILENAME =
       'c:\Data\TimeCard.ldf',
    SIZE=1MB,
    MAXSIZE=10MB,
    FILEGROWTH=1MB)
GO
