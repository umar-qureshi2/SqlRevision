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

