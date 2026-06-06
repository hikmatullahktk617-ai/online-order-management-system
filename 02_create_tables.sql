USE OnlineOrderDB;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Phone NVARCHAR(20), 
    created_at DATETIME DEFAULT GETDATE()
);

Create table Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_QUANTITY INT NOT NULL,
    isActive BIT DEFAULT 1,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Orderstatus NVARCHAR(50) Default 'Pending',
    TotalAmount DECIMAL(10, 2) Default 0.00,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

Create Table OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    LineTotal AS (Quantity * UnitPrice),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,
    paymentStatus NVARCHAR(50) DEFAULT 'Unpaid',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);