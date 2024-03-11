ALTER PROC GetSaleByEmployeeIdAndCustomerId
			@EmployeeId int,
			@Amount float = 10
AS
BEGIN
	SELECT *
	FROM Sale
	WHERE EmployeeId = @EmployeeId
	AND Amount > @Amount
END

EXEC GetSaleByEmployeeIdAndCustomerId 24,100