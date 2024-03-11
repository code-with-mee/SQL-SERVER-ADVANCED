--1. DML triggers (Data Manipulation Language)
-- FOR UPDATE
CREATE TRIGGER TriggerCategoryForUpdate
ON Category
FOR UPDATE
AS
BEGIN
	DECLARE @Id INT
	DECLARE @Name VARCHAR(50)
	DECLARE @Updated DATETIME
	SET @Updated = GETDATE();
	SELECT @Id = i.CategoryId,
			@Name = i.CategoryName
				FROM inserted i

	UPDATE CategoryBackup 
	SET CategoryName = @Name,
		Updated = @Updated
	WHERE Id = @Id
END

UPDATE Category SET CategoryName = 'Bakery'
WHERE CategoryId = 11