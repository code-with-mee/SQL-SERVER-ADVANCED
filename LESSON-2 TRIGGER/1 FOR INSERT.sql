--1. DML triggers (Data Manipulation Language)
-- FOR INSERT
CREATE TRIGGER TriggerCategoryForInsert
ON Category
FOR INSERT
AS
BEGIN
	DECLARE @Id INT
	DECLARE @Name VARCHAR(50)
	DECLARE @Created DATETIME
	DECLARE @Updated DATETIME
	DECLARE @Status TINYINT
	SET @Status = 1

	SELECT @Id = i.CategoryId,
			@Name = i.CategoryName,
			@Created = i.Created,
			@Updated = i.Updated
				   FROM inserted i
	INSERT INTO CategoryBackup
	VALUES(@Id,@Name,@Status,@Created,@Updated)
END

--Test trigger for insert
INSERT INTO Category VALUES (11,'Drink',GETDATE(),GETDATE())
