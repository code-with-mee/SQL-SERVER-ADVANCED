--INDEX
--Unique | Non-Unique Indexes

--Unique Nonclusterd Index
CREATE UNIQUE NONCLUSTERED INDEX IX_UQ_NExpenseName
ON Expense (Name)

--Unique		| Non-Unique
--Clusterd		| Nonclusterd
--Unique Index	| Unique Constraint

ALTER TABLE Expense
ADD CONSTRAINT UQExpenseName UNIQUE CLUSTERED (Name)
