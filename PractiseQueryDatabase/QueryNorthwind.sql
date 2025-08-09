use NORTHWND

select *
from Employees
where City like'L%'

select e.EmployeeID , e.FirstName
from Orders o
inner join Employees e on e.EmployeeID = o.EmployeeID
where city like'London'
order by e.EmployeeID

-- Câu 3 : Hiển thị mã nhà cung cấp , tên nhà cung cấp , địa chỉ , số lượng sản phẩm đã cung cấp 
-- kết quả được sắp xếp theo số lượng giảm dần
select sup.SupplierID ,sup.CompanyName , count(sup.supplierId) as SL
from Products p 
inner join Suppliers sup on sup.SupplierID = p.SupplierID
group by sup.SupplierID , sup.CompanyName , sup.Address 
order by SL asc


--EX4
select count(orderid) as 'get all order'
from Orders
where YEAR(OrderDate) = 1997

select *
from orders
--EX5 
select count(*)
from Customers
where ContactTitle Like '%Manage%'

--EX6 
select *
from orders
where orderdate = '1997-05-19'

--EX7 : Create to report for all the orders of 1996 their customer
select *
from orders o
inner join customers cus on cus.CustomerID = o.CustomerID
where year(orderdate) = 1996

--EX8 : Create a report that show 
select emp.City , cus.City , count(emp.city) , count(cus.city)
from customers cus
inner join Employees emp on emp.City = cus.City
group by emp.city , cus.City
--EX9 : Create report that shows the order ids and the associated 
select *
from orders o
inner join Employees emp on emp.EmployeeID = o.EmployeeID and o.ShippedDate > o.RequiredDate


exec sp_helpindex 'orders'

-- Advanced
--1.
select sum(od.unitprice * od.quantity)
from [Order Details] od
inner join products prod on prod.ProductID = od.ProductID
inner join orders o on o.OrderID = od.OrderID
where year(o.OrderDate) = 1997
--2.
select o.CustomerID , sum(od.unitprice * od.quantity)
from [Order Details] od
inner join orders o on o.OrderID = od.OrderID
inner join Customers cus on cus.CustomerID = o.CustomerID
group by o.CustomerID
order by o.CustomerID asc
--3 
--select od.ProductID,count(od.quantity) as countOfProd ,MAX(COUNT(od.Quantity)) AS maxCountOfProd
--from [Order Details] od
--inner join products prod on prod.ProductID = od.ProductID
--group by od.ProductID

with productOfMax as(
	select od.productid, prod.ProductName as nameprod, count(Quantity) as prodCount
	from [Order Details] od
	inner join products prod on prod.ProductID = od.ProductID
	group by od.ProductID , prod.ProductName
)
select top 10 prodcount , nameprod
from productOfMax
order by prodcount desc





--Part 1
--ex5
select *
from customers
--
select count(Discontinued) as count
from Products
where Discontinued = 1

select CompanyName , city , Country , PostalCode 
from Suppliers
where address like '%rue%'
order by CompanyName

select *
from orders 
join Shippers ship on ship.ShipperID = orders.ShipVia

select cus.customerid
from customers cus 
inner join orders o on cus.CustomerID = o.CustomerID

select *
from customers
