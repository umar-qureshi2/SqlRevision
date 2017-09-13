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

DROP PROCEDURE IF EXISTS SupplierByID
GO

CREATE PROCEDURE SupplierByID
@SupplierID int
AS
BEGIN
Select * from Suppliers where SupplierID = @SupplierID
END

DROP PROCEDURE IF EXISTS ProductsWithSupplier
GO

CREATE PROCEDURE ProductsWithSupplier
--@SupplierID int
AS
BEGIN
select Suppliers.ContactName + ' supplies ' + Products.ProductName from Products inner join Suppliers on Products.SupplierID = Suppliers.SupplierID
END