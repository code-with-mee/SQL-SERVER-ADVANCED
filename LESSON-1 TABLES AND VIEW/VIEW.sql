--VIEW
--create view
CREATE VIEW ViewProductDetail
as
	SELECT * FROM Product

-- call view
SELECT * FROM ViewProductDetail

ALTER VIEW VIEWProductWithCategory
as
	SELECT p.ProductId ,
			p.ProductName as ProductName,
			c.CategoryName as Category,
			p.SellingPrice
	FROM Product p
	INNER JOIN Category c
	ON p.CategoryId =c.CategoryId

SELECT * FROM VIEWProductWithCategory

SELECT ProductName,
		SellingPrice 
		FROM VIEWProductWithCategory

DROP VIEW VIEWProductWithCategory

