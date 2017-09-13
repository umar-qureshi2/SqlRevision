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
@pid int
AS
BEGIN
select Suppliers.ContactName + ' supplies ' + Products.ProductName AS SupplyInfo 
from Products inner join Suppliers 
on Products.SupplierID = Suppliers.SupplierID
and Products.ProductID = @pid
END
GO