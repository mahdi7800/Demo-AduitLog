/*
===========================================================
 File Name : auditlog_products.sql
 Purpose   : Audit logging for Products table in Northwind
 Database  : Northwind
 Author    : Mahdi Davoudi
===========================================================

 This script contains:
 1) Creation of audit log database and table
 2) Table structure with default system values
 3) Trigger to log all INSERT, UPDATE, DELETE operations
*/


-----------------------------------------------------------
-- 1) Create Audit Database
-----------------------------------------------------------

CREATE DATABASE Northwind_AduitLog;
GO 

-----------------------------------------------------------
-- 2) Create Audit Table in Audit Database
-----------------------------------------------------------


USE Northwind;
GO 


-- Create empty structure of Products table in audit DB
SELECT ProductID , ProductName , CategoryID , Discontinued , UnitPrice , SupplierID
INTO [Northwind_AduitLog].[dbo].Products
FROM Products
WHERE  1 = 2 

GO 

