/*
=============================================================
Create Database and Schemas
=============================================================
Script Objective:
    This script manages the creation of a database named 'DataWarehouse'. 
    It first checks whether the database already exists. If found, the existing 
    database is dropped and rebuilt. Once recreated, three schemas are established 
    within the database: 'bronze', 'silver', and 'gold'.

Important Notice:
    Executing this script will completely remove the 'DataWarehouse' database 
    if it is present. All existing data will be permanently lost. Ensure that 
    proper backups are in place before proceeding.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO
-- Create New Database "DataWarehouse"
use master;
CREATE Database DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
go

CREATE SCHEMA silver;
go

CREATE SCHEMA gold ;
go
