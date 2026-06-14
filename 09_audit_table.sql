Use OnlineOrderDB;
Go

Create table OrderAudit
(
    AuditID int identity(1,1) primary key,
    OrderID int not null,
    oldStatus varchar(50),
    newStatus varchar(50),
    ChangeAt datetime not null default getdate(),
    Remarks varchar(255)
);
GO