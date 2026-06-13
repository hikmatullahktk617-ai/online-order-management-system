USE OnlineOrderDB;
GO

CREATE VIEW vw_ComplexOrderAnalytics AS
with cte_product_sale as (
select productid,sum(Quantity)as total_product_sold
from OrderDetails   
GROUP BY ProductID 
),
cte_base_date as (
SELECT
o.orderid,
c.customerid,
CONCAT('FirstName', ' ','lastname') as full_name,
c.email,
c.phone,
CAST(o.orderdate AS DATE) AS order_only_date,
o.orderstatus,

p.paymentmethod,
p.paymentstatus,
p.paymentdate,

pr.productid,
pr.productname,
cat.categoryname,

od.quantity,
od.unitprice,
od.linetotal,

pr.stock_quantity AS current_stock,
ps.total_product_sold,

CASE
WHEN pr.stock_quantity = 0 THEN 'Out of Stock'
WHEN pr.stock_quantity < 10 THEN 'Low Stock'
ELSE 'Available'
END AS stock_status
FROM Orders o
JOIN Customers c
ON o.customerid = c.customerid
JOIN OrderDetails od
ON o.orderid = od.orderid
JOIN Products pr
ON od.productid = pr.productid
LEFT JOIN Categories cat
ON pr.categoryid = cat.categoryid
LEFT JOIN Payments p
ON o.orderid = p.orderid
left join cte_product_sale ps
on pr.ProductID= ps.ProductID)

SELECT *,

SUM(linetotal) OVER (PARTITION BY orderid) AS order_total_amount,

COUNT(productid) OVER (PARTITION BY orderid) AS total_items_in_order,

SUM(quantity) OVER (PARTITION BY customerid) AS customer_total_quantity_purchased,

SUM(linetotal) OVER (PARTITION BY customerid) AS customer_lifetime_value,

RANK() OVER (
PARTITION BY categoryname
ORDER BY total_product_sold  DESC
) AS product_rank_in_category
from cte_base_date;


GO




