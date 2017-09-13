USE Northwind
GO

DROP PROCEDURE IF EXISTS AllSuppliers
GO

CREATE PROCEDURE AllSuppliers
--@SupplierID int
AS
BEGIN
Select * from Suppliers --where SupplierID = @SupplierID
END
GO

DROP PROCEDURE IF EXISTS SupplierByID
GO

CREATE PROCEDURE SupplierByID
@SupplierID int
AS
BEGIN
Select * from Suppliers where SupplierID = @SupplierID
END
GO

DROP PROCEDURE IF EXISTS ProductsWithSupplier
GO

CREATE PROCEDURE ProductsWithSupplier
@pid int,
@supplyInfo varchar(500) OUTPUT
AS
BEGIN
select @supplyInfo = Suppliers.ContactName + ' supplies ' + Products.ProductName
from Products inner join Suppliers 
on Products.SupplierID = Suppliers.SupplierID
and Products.ProductID = @pid
END
GO


IF type_id('[ProductSupplierType]') IS NULL
CREATE TYPE ProductSupplierType AS TABLE
(Product int,
Supplier int);
GO

DROP PROCEDURE IF EXISTS ValidateProductSupplier
GO

CREATE PROCEDURE ValidateProductSupplier
@productSupplier ProductSupplierType READONLY,
@valid int OUTPUT
AS
BEGIN
DECLARE @supplierId int
SELECT @supplierId = Supplier FROM @productSupplier;

DECLARE @productId int
SELECT @productId = Product FROM @productSupplier;

DECLARE @target int
SELECT @target = SupplierID FROM Products where ProductID = @productId

IF (@target = @supplierId)
	SELECT @valid = 1
ELSE
	SELECT @valid = 0

END
GO
