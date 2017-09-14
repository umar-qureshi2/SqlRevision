--declare @result varchar(500)

--EXEC ProductsWithSupplier @pid = 9, @supplyInfo = @result output

--select @result

--DECLARE @productsupplier AS ProductSupplierType;

--INSERT INTO @productsupplier (Product, Supplier)
--SELECT 1,1

--declare @result int
--EXEC ValidateProductSupplier @productsupplier, @result output
--SELECT @result

--select * from suppliers

declare @newsuppliers SupplierBasic
insert into @newsuppliers values ('11','11'),('22','22'),('33','33'),('44','44')
exec ImportBasicSuppliers @newsuppliers