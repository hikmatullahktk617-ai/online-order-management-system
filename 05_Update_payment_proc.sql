Use OnlineOrderDB;
GO

CREATE OR ALTER PROCEDURE Update_payment_proc
   @ORDERID INT,
   @PAYMENTstatus VARCHAR(20)
AS
BEGIN
   UPDATE Payments
   SET PaymentStatus = @PAYMENTstatus,
    PaymentDate = CASE WHEN @PAYMENTstatus = 'Paid' THEN GETDATE() 
        ELSE NULL 
    END
    WHERE OrderID = @ORDERID;

    if @PAYMENTstatus = 'Paid'
    BEGIN
        UPDATE Orders
        SET OrderStatus = 'Completed'
        WHERE OrderID = @ORDERID;
    END
END;
GO


Exec Update_payment_proc @ORDERID = 1, @PAYMENTstatus = 'Paid';

Select PaymentStatus, PaymentDate from Payments where OrderID = 1;
Select * from Orders where OrderID = 1;