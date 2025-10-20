
/*
===============================================================

Create Database and Schemas

===============================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionaly, the scripts sets up threee 
    schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it already exists.
    All data in the database will be permanently deleted. Proceed with caution and ensure
    you have proper backups before running this script.
*/



USE master;
GO


-- Drop and recreate the 'DataWarehouse' databse
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO


-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;


-- use the newly created database "DataWarehouse"
USE DataWarehouse;


-- Create schemas (the 3 medallion architecture layers)
CREATE SCHEMA bronze;
GO


CREATE SCHEMA silver;
GO


CREATE SCHEMA gold;