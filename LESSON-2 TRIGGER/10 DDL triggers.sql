--2. DDL triggers (Data Definition Language)
-- CREATE,ALTER,DROP (Table,Function,Index,Store Procedure...)

CREATE TRIGGER TriggerDBFirst
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	PRINT('CREATE NEW TABLE')
END

CREATE TABLE DD (Id INT NOT NULL,
					Name VARCHAR(50) NOT NULL)

CREATE TRIGGER TriggerDBSecond
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
	PRINT('TABLE HAS BEEN DROPED')
END

DROP TABLE DD

CREATE TRIGGER TriggerDBThird
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	PRINT('TABLE HAS BEEN DROPED')
END

CREATE TRIGGER TriggerDBPreventAction
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	ROLLBACK
	PRINT('YOU CAN NOT MODILFIED OR CREATE TABLE')
END