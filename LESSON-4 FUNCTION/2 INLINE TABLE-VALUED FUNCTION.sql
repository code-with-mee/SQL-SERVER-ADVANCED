CREATE FUNCTION GetAllProduct()
RETURNS TABLE
AS
	RETURN (SELECT Id,Name,Unit FROM Product)

CREATE FUNCTION GetAllProductByCategoryId(@CategoryId INT)
RETURNS TABLE
AS
	RETURN (SELECT Id,Name,Unit 
			FROM Product
			WHERE CategoryId = @CategoryId)

SELECT * FROM dbo.GetAllProduct()
SELECT * FROM dbo.GetAllProductByCategoryId(4)