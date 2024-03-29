--CALL INLINE FUNCTION WITH JOIN

ALTER FUNCTION [dbo].[GetAllProduct]()
RETURNS TABLE
AS
	RETURN (SELECT Id,Name,Unit FROM Product)

SELECT p.Id,
		p.Name,
		sd.Quantity,
		sd.TotalPrice
FROM GetAllProduct() p
INNER JOIN SaleDetail sd
ON p.Id = sd.ProductId

ALTER FUNCTION [dbo].[GetAllProductByCategoryId](@CategoryId INT)
RETURNS TABLE
AS
	RETURN (SELECT Id,Name,Unit 
			FROM Product
			WHERE CategoryId = @CategoryId)

SELECT p.Id,
		p.Name,
		pod.Quantity,
		pod.TotalPrice
FROM GetAllProductByCategoryId(10) p
INNER JOIN PurchaseOrderDetail pod
ON p.Id = pod.ProductId
ORDER BY p.Id ASC