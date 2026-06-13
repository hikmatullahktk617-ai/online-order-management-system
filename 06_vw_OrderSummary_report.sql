USE OnlineOrderDB;
GO

Create VIEW vw_OrderSummary AS
SELECT 
    o.OrderID,
    Concat(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.Email,
    o.OrderDate,
    O.Orderstatus,
    o.TotalAmount,
    p.PaymentDate,
    p.PaymentMethod
FROM 
    Orders o  
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN 
    payments p ON o.OrderID = p.OrderID;
Go