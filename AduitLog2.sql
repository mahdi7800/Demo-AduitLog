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
-- 2) Create Audit Table in Audit Database
-----------------------------------------------------------

-- Create empty structure of Products table in audit DB

USE [Northwind_AduitLog]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 1/21/2026 8:15:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Discontinued] [bit] NOT NULL,
	[SupplierID] [int] NULL,
	[OP_Type] [nchar](1) NOT NULL,
	[OP_DateTime] [datetime] NOT NULL,
	[OP_Login] [nvarchar](100) NOT NULL,
	[OP_APP] [nvarchar](260) NOT NULL,
	[OP_HostName] [nvarchar](50) NOT NULL,
	[OP_IPAddres] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [OP_DateTime]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT (suser_sname()) FOR [OP_Login]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT (app_name()) FOR [OP_APP]
GO

ALTER TABLE [dbo].[Products] ADD  DEFAULT (host_name()) FOR [OP_HostName]
GO


