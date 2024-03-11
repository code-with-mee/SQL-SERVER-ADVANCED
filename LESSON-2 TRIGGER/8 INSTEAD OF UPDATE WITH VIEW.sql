CREATE TRIGGER TriggerViewProductInsteadOfUpdate
ON ViewProduct
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @ProductId INT
	DECLARE @CategoryId INT

	SELECT @ProductId = i.ProductId FROM inserted i

	IF (UPDATE(Category))
	BEGIN
		SELECT @CategoryId = c.CategoryId
		FROM Category c
		INNER JOIN inserted i
		ON c.CategoryName = i.CategoryName

		UPDATE Product SET CategoryId = @CategoryId
		WHERE ProductId = @ProductId
	END
END