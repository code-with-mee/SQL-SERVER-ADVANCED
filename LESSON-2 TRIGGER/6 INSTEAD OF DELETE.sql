--1. DML triggers (Data Manipulation Language)
-- INSTEAD OF DELETE
ALTER TRIGGER TriggerCategoryInsteadOfDelete
ON Category
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @Id INT
	SELECT @Id = d.CategoryId FROM deleted d

	DELETE Product WHERE CategoryId = @Id
	DELETE Category WHERE CategoryId = @Id
END

SELECT * FROM Product WHERE CategoryId = 12
SELECT * FROM Category WHERE CategoryId = 12
DELETE Category WHERE CategoryId = 12
