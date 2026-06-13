USE ONlineOrderDB;
Go

Create VIEW vw_ProductSalesReport AS
SELECT 
    p.ProductName,
    SUM(oi.Quantity) AS TotalQuantitySold,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalSalesAmount
    FROM
    OrderDetails oi
JOIN 
    Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName;
Go