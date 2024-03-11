--Index 
	--Clustered
	--Nonclustered
--Constraint
	--Not null
	--Unique
	--Primary Key
	--Foreign Key
	--Check
	--Default
	--Create Index
--Constraint Create Index
	--Primary Key (Clustered Index)
	--Unique (Nonclusterd Index)
-- Clustered vs Nonclustered
-- Unique vs Nonunique

CREATE TABLE PhoneBook(
		Id int NOT NULL,
		FirstName varchar(50) NOT NULL,
		LastName varchar(50) NOT NULL,
		PhoneNumber varchar(20) NOT NULL)

DROP TABLE PhoneBook

INSERT INTO PhoneBook VALUES (1,'FirstName1','LastName1','090909091')
INSERT INTO PhoneBook VALUES (3,'FirstName3','LastName3','090909093')
INSERT INTO PhoneBook VALUES (5,'FirstName5','LastName5','090909095')
INSERT INTO PhoneBook VALUES (4,'FirstName4','LastName4','090909094')
INSERT INTO PhoneBook VALUES (2,'FirstName2','LastName2','090909092')

SELECT * FROM PhoneBook 
SELECT * FROM PhoneBook WHERE Id =1
DELETE PhoneBook

INSERT INTO PhoneBook VALUES (6,'FirstName6','LastName6','090909095')

--INDEX
--unique clustered index
CREATE CLUSTERED INDEX IX_PhoneBook_Id
ON PhoneBook(Id ASC)

--unique clustered index
CREATE UNIQUE CLUSTERED INDEX IX_PhoneBook_Id
ON PhoneBook(Id ASC)

--nonunique nonclustered index
CREATE INDEX IX_PhoneBook_FirstName
ON PhoneBook(FirstName ASC)

--nonunique nonclustered index
CREATE NONCLUSTERED INDEX IX_PhoneBook_LastName
ON PhoneBook(LastName DESC)

--unique nonclustered index
CREATE UNIQUE INDEX IX_PhoneBook_PhoneNumber
ON PhoneBook(PhoneNumber ASC)

--constraint
--nonclustered index
ALTER TABLE PhoneBook
	ADD CONSTRAINT PK_PhoneBook_Id
	PRIMARY KEY NONCLUSTERED(Id)
ALTER TABLE PhoneBook
	DROP CONSTRAINT PK_PhoneBook_Id

--clustered index
ALTER TABLE PhoneBook
	ADD CONSTRAINT UC_PhoneNumber
	UNIQUE CLUSTERED(PhoneNumber)
ALTER TABLE PhoneBook
	DROP CONSTRAINT UC_PhoneNumber

--noncluster index
ALTER TABLE PhoneBook
	ADD CONSTRAINT UCPhone
	UNIQUE(PhoneNumber)
ALTER TABLE PhoneBook
	DROP CONSTRAINT UCPhone

--clusterd index
ALTER TABLE PhoneBook
	ADD CONSTRAINT PK_PhoneBook
	PRIMARY KEY(Id)
ALTER TABLE PhoneBook
	DROP CONSTRAINT PK_PhoneBook
