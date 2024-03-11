--1. DML triggers (Data Manipulation Language)
-- INSTEAD OF UPDATE
CREATE TRIGGER TriggerCategoryInsteadOfUpdate
ON Category
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @Id INT
	DECLARE @Name VARCHAR(50)
	DECLARE @Updated DATETIME
	SET @Updated = GETDATE()

	SELECT @Id = i.CategoryId,@Name = i.CategoryName
	FROM inserted i

	UPDATE Category SET CategoryName = @Name,
					Updated = @Updated
	WHERE CategoryId= @Id
END

SELECT * FROM Category

UPDATE Category SET CategoryName = 'Noodle'
WHERE CategoryId = 12
