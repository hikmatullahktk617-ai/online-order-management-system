USE OnlineOrderDB;
GO

Create table StockAlert
(
    AlertID int identity(1,1) primary key,
    ProductID int not null,
    productName varchar(255),
    currentStock int,
    AlertMessage varchar(255),
    CreatedAt datetime not null default getdate()
);