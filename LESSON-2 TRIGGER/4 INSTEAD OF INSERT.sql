--1. DML triggers (Data Manipulation Language)
-- INSTEAD OF INSERT
ALTER TRIGGER TriggerCategoryInsteadOfInsert
ON Category
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Id INT
	DECLARE @Name VARCHAR(50)
	DECLARE @Created DATETIME
	DECLARE @Updated DATETIME

	SELECT @Id = i.CategoryId,
			@Name =i.CategoryName,
			@Created = i.Created,
			@Updated = i.Updated
					FROM inserted i
	SET @Name = @Name + '-(NEW)'
	INSERT INTO Category VALUES(@Id,@Name,@Created,@Updated)
END

SELECT * FROM Category

INSERT INTO Category VALUES
		(12,'Drink',GETDATE(),GETDATE())
