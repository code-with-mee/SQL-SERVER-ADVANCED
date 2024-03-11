--INDEX
--Clustered
--Nonclusterd
--Unique
--Filtered
--XML
--Full Text
--Spatial
--Columnstore
--Index with included column
--Index on computed columns



--INDEX
--Clustered
--Nonclusterd
SELECT * FROM Expense
DELETE Expense

INSERT INTO Expense VALUES
(35,'Delivery',100,'Note')
INSERT INTO Expense VALUES
(31,'Renting',100,'Note')
INSERT INTO Expense VALUES
(32,'Driver',100,'Note')
INSERT INTO Expense VALUES
(34,'Fix',100,'Note')
INSERT INTO Expense VALUES
(33,'Move',100,'Note')

CREATE CLUSTERED INDEX IX_ExpenseBackup
ON ExpenseBackup (Amount DESC,Name ASC)

SELECT * FROM ExpenseBackup

