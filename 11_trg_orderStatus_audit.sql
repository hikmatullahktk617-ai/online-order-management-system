USE OnlineOrderDB;
GO

Create OR ALTER trigger trg_orderStatus_audit
ON Orders
AFTER UPDATE
AS
BEGIN
    INSERT INTO OrderAudit (OrderID, OldStatus, NewStatus, Remarks)
    SELECT 
        i.OrderID,
        d.OrderStatus AS OldStatus,
        i.OrderStatus AS NewStatus,
        'Order status has been updated' AS Remarks
    FROM inserted i
    INNER JOIN deleted d ON i.OrderID = d.OrderID
    WHERE i.OrderStatus <> d.OrderStatus;
END;