SELECT * FROM ViewProduct

CREATE TRIGGER TriggerViewProductInsteadOfInsert
ON ViewProduct
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @ProductId INT
	DECLARE @ProductName VARCHAR(50)
	DECLARE @CostPrice Float
	DECLARE @SellingPrice Float
	DECLARE @Unit VARCHAR(10)
	DECLARE @CategoryId INT
	DECLARE @CategoryName VARCHAR(50)
	DECLARE @Created DATETIME
	DECLARE @Updated DATETIME
	SET @Created = GETDATE()
	SET @Updated = GETDATE()

	SELECT @ProductId = i.ProductId,
			@ProductName = i.ProductName,
			@CategoryName = i.CategoryName,
			@CostPrice = i.CostPrice,
			@SellingPrice = i.SellingPrice,
			@Unit = i.Unit
	FROM inserted i

	SELECT @CategoryId = CategoryId 
	FROM Category
	WHERE CategoryName = @CategoryName

	INSERT INTO Product VALUES
	(@ProductId,@ProductName,@CategoryId,@CostPrice,@SellingPrice,
		@Unit,@Created,@Updated)
END

INSERT INTO ViewProduct VALUES
(1001,'Fanta','Lincoln',2000,3000,'UNIT')