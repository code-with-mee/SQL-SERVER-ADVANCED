
--MULTISTATEMENT TABLED-VALUED FUNCTIONS

CREATE FUNCTION GetEmployee()
RETURNS @Table TABLE(Id int,Name varchar(50),Salary float)
AS
BEGIN
	INSERT INTO @Table 
	SELECT Id,
			Name,
			Salary
	FROM Employee
	RETURN
END

--call function
SELECT * FROM GetEmployee()

CREATE FUNCTION GetSaleDetailSummary(@ProductId INT)
RETURNS @Table TABLE(InvoiceId INT,
						ProductName varchar(50),
						Quantity INT,
						Average Float,
						TotalQty INT)
AS
BEGIN
	DECLARE @Average Float
	DECLARE @Quantity INT

	SELECT @Average = AVG(TotalPrice),
			@Quantity = SUM(Quantity)
	FROM SaleDetail 
	WHERE ProductId = @ProductId

	INSERT INTO @Table
	SELECT sd.InvoiceId,
			p.Name as ProductName,
			sd.Quantity,
			@Average,
			@Quantity
	FROM SaleDetail sd
	INNER JOIN Product p
	ON sd.ProductId = p.Id
	WHERE sd.ProductId = @ProductId
	RETURN
END

--call function
SELECT * FROM GetSaleDetailSummary(20)