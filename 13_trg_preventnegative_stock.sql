use OnlineOrderDB;
select * from products;


create or alter trigger preventnegative_stock
on products
after update,insert
AS
BEGIn
  if exists (select 1 from inserted where Stock_QUANTITY < 0)
  begin
  RAISERROR('stock quantity can not be negative',16,1)
  ROLLBACK TRANSACTION;
  END
end;

select * from StockAlert;

update Products
set Stock_QUANTITY= -1
where Productid= 1
insert into Products values('micro sd card',15.99,-2,1,1);