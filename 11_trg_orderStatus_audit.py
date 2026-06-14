Use OnlineOrderDB;
Go

Create trigger trg_orderStatus_audit
ON dbo.Orders
AFTER UPDATE
AS
BEGIN
    Insert into dbo.OrderAudit(OrderID, OldStatus, NewStatus, remarks)
    Select i.OrderID, d.OrderStatus, i.OrderStatus, 'Order status has been changed'
    from inserted i
    inner join deleted d on i.OrderID = d.OrderID
    where i.OrderStatus <> d.OrderStatus
END
GO