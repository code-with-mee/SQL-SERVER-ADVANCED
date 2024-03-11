--1. DML triggers (Data Manipulation Language)
-- FOR DELETE
CREATE TRIGGER TriggerCategoryForDelete
ON Category
FOR DELETE
AS
BEGIN
	DECLARE @Id INT
	DECLARE @Updated DATETIME
	SET @Updated = GETDATE()

	SELECT @Id = d.CategoryId FROM deleted d

	UPDATE CategoryBackup
	SET Status = 0,
	Updated = @Updated
	WHERE CategoryId = @Id
END

DELETE Category WHERE CategoryId = 11

