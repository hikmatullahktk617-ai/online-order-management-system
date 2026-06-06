USE OnlineOrderDB;

INSERT INTO Customers (firstname, lastname, email, Phone) VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-1234'),
('Bob', 'Brown', 'bob.brown@example.com', '555-5678'),
('Charlie', 'Davis', 'charlie.davis@example.com', '555-9012');


INSERT INTO Categories (CategoryName) VALUES 
('Electronics'), 
('Books'), 
('Clothing'), 
('Home & Kitchen'), 
('Sports & Outdoors');


Insert INTO Products (ProductName, Price, Stock_QUANTITY, CategoryID) VALUES 
('Smartphone', 699.99, 50, 1),
('Laptop', 999.99, 30, 1),
('Headphones', 199.99, 100, 1),
('Fiction Book', 14.99, 200, 2),
('Non-Fiction Book', 24.99, 150, 2),
('T-Shirt', 19.99, 300, 3),
('Jeans', 49.99, 100, 3),
('Blender', 89.99, 80, 4),
('Coffee Maker', 79.99, 60, 4),
('Yoga Mat', 29.99, 120, 5);


Insert into Orders (CustomerID, OrderDate, Orderstatus, TotalAmount) VALUES 
(1, '2024-06-01', 'Pending', 699.99),
(2, '2024-06-02', 'Completed', 999.99),
(3, '2024-06-03', 'Pending', 199.99),
(4, '2024-06-04', 'Completed', 14.99),
(5, '2024-06-05', 'Pending', 24.99);


Insert into OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES 
(1, 1, 1, 699.99),
(2, 2, 1, 999.99),
(3, 3, 1, 199.99),
(4, 4, 1, 14.99),
(5, 5, 1, 24.99);


Insert into Payments (OrderID, PaymentDate, Amount, PaymentMethod, paymentStatus) VALUES 
(1, '2024-06-01', 699.99, 'Credit Card', 'Unpaid'),
(2, '2024-06-02', 999.99, 'PayPal', 'Paid'),
(3, '2024-06-03', 199.99, 'Credit Card', 'Unpaid'),
(4, '2024-06-04', 14.99, 'Debit Card', 'Paid'),
(5, '2024-06-05', 24.99, 'PayPal', 'Unpaid');



Select * from Customers;
Select * from Categories;
Select * from Products;
Select * from Orders;
Select * from OrderDetails;
Select * from Payments;
