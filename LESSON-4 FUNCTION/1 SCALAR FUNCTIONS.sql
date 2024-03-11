CREATE FUNCTION CounQuantityOfProductById(@ProductId INT)
RETURNS INT
AS
BEGIN
	DECLARE @Count INT
	SELECT @Count = COUNT(Quantity)
	FROM SaleDetail
	WHERE ProductId = @ProductId
	RETURN @Count
END

--call function
SELECT dbo.CounQuantityOfProductById(20)