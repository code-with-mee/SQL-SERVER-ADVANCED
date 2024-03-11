--backup full
BACKUP DATABASE Demo
TO DISK = 'C:\backups\Demo.bak';

--backup differential
BACKUP DATABASE Demo
TO DISK = 'C:\backups\Demo.bak'
WITH DIFFERENTIAL;

--backup log
BACKUP LOG Demo
TO DISK = 'C:\backups\Demo.bak'

DECLARE @Path VARCHAR(50) = 'C:\backups\'
--DECLARE @Name VARCHAR(50) = CONVERT(VARCHAR, GETDATE(),112)
DECLARE @Name VARCHAR(50)
SELECT @Name = 
      RIGHT('00'   + CAST(DATEPART(day,    GETDATE()) AS varchar(2)),2) + '-' +
      RIGHT('00'   + CAST(DATEPART(month,  GETDATE()) AS varchar(2)),2) + '-' +
      RIGHT('0000' + CAST(DATEPART(year,   GETDATE()) AS varchar(4)),4) + '-' +
      RIGHT('00'   + CAST(DATEPART(hour,   GETDATE()) AS varchar(2)),2) + '-' +
      RIGHT('00'   + CAST(DATEPART(minute, GETDATE()) AS varchar(2)),2) + '-' +
      RIGHT('00'   + CAST(DATEPART(second, GETDATE()) AS varchar(2)),2)
DECLARE @Extension VARCHAR(10)= '.bak'
DECLARE @FullPath VARCHAR(500) = CONCAT(@Path,@Name,@Extension)
PRINT(@FullPath)
BACKUP DATABASE Demo
TO DISK = @FullPath


--Restore
RESTORE DATABASE Demo from disk = 'C:\backups\28-12-2023-11-41-23.bak' with replace
