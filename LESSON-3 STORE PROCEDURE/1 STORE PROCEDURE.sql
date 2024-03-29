USE [Demo]
GO
/****** Object:  StoredProcedure [dbo].[GetSaleDetail]    Script Date: 11/15/2023 11:49:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[GetSaleDetail]
AS
BEGIN
	SELECT s.InvoiceId ,
			c.Name as CustomerName,
			s.Amount,
			s.Created
	FROM Sale s
	INNER JOIN Customer c
	ON s.CustomerId = c.Id
	WHERE s.Amount > 500
END