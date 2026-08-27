/*
=========================================================
Create Database and Schemas 
=========================================================
Script Purpose:
     This script creats a new datavase named 'DataWarehouse' after checking if it already exists.
     If the database exits, it is dropped and recreated. Additionally, the dcript sets up three schemas 
     within the database: 'bronze', 'silver' and 'gold'

WARNING: 
Running this script will dropp the entire ''DataWarehouse' database if it exits.
All data in the datavase will ve permanently deleted. 
Proceed with caution and ensure uou have proper backups efore running this script.
*/



USE master;
GO

-- Drop and recreate the 'DataWarehouse' database 
IF EXISTS (select 1 from sys.databases where name = 'DataWarehouse') 
BEGIN 
    ALTER Database DataWarehouse set single_user with Rollback immediate 
    Drop database DataWarehouse
END 
GO


-- create and use DataWarehouse
create database DataWarehouse;
GO
use DataWarehouse;
GO


-- create Shemas 
create schema bronze;
GO
create schema Silver;
GO
create schema Gold;
GO


