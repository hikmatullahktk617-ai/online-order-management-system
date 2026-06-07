USE OnlineOrderDB;
GO

CREATE OR ALTER PROC PlaceOrderProc
    @CustomerID INT,
    @productID INT,
    @quantity INT,
    @OrderID INT
AS
BEGIN 
    DECLARE @UnitPrice DECIMAL(10, 2);
    DECLARE @TotalAmount DECIMAL(10, 2);
    Declare @stock INT;

    Select @UnitPrice = Price, @stock = Stock_QUANTITY FROM Products
    WHERE ProductID = @productID AND isactive = 1;

    if @UnitPrice IS NULL
    BEGIN
        RAISERROR('Product ID %d is not available', 16, 1, @productID);
        RETURN;
    END

    -- Check if there is enough stock
    IF @stock < @quantity
    BEGIN
        RAISERROR('Insufficient stock for product ID %d', 16, 1, @productID);
        RETURN;
    END

    -- Calculate the total amount
    SET @TotalAmount = @UnitPrice * @quantity;

    
    Insert into OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
    VALUES (@OrderID, @productID, @quantity, @UnitPrice);


    Update Products
    SET Stock_QUANTITY = Stock_QUANTITY - @quantity
    WHERE ProductID = @productID;

    Insert into payments (OrderID, PaymentMethod,PaymentStatus, Amount)
    VALUES (@OrderID, 'Credit Card', 'Unpaid', @TotalAmount);

    Print 'Order placed successfully';

END;
GO

--testing store procedure
Exec PlaceOrderProc @CustomerID = 1, @productID = 1, @quantity = 30, @OrderID = 1;


--verify the results
Select * from OrderDetails;
Select * from Products;
Select * from payments;