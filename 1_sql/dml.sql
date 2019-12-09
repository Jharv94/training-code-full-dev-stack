use AdventureWorks2017;
GO

select 1 + 1;
select *
from Person.Person;

select firstname, lastname, middlename
from Person.Person;

select firstname, lastname, middlename
from Person.Person
where FirstName = 'robert';

select firstname, lastname, middlename
from Person.Person
where FirstName = 'robert' or FirstName = 'john';

select firstname, lastname, middlename
from Person.Person
where FirstName <> 'robert' or FirstName <> 'john';

select firstname, lastname, middlename
from Person.Person
where FirstName like '%robert%' or FirstName like 'robert_' or FirstName like 'r[aeiou]%';

select count(*), firstname, lastname, middlename
from Person.Person
where FirstName = 'robert' or FirstName = 'john'
group by FirstName, LastName;

select count(*) as "amount of", firstname, lastname
from Person.Person
where FirstName = 'robert' or FirstName = 'john'
group by FirstName, LastName;

select count(*) as "amount of", firstname, lastname
from Person.Person
where FirstName = 'robert' or FirstName = 'john'
group by FirstName, LastName
having count(*) > 1;

select count(*) as "amount of", firstname, lastname
from Person.Person
where FirstName = 'robert' or FirstName = 'john'
group by FirstName, LastName
having count(*) > 1
order by lastname asc, firstname desc;

--mode of execution
/*
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/

-- insert
select * 
from Person.Address
where AddressLine1 = 'UT';

insert into Person.Address(AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation, rowguid, ModifiedDate)
values ('UT', NULL, 'Arlingtons', 79, 76010, 0xE6100000010CAE8BFC28BCE4474067A89189898A5EC0, '9aadcb0d-36cf-483f-84d8-585c2d4ec6e9', 2019-11-08);

insert into Person.Address
select AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation, rowguid, ModifiedDate
from AdventureWorks2017.Person.Address
where AddressLine1 = 'UT';

bulk insert Person.Address from 'data.csv' with (rowterminator ='\n', fieldterminator = ',');

--update

update Person.Person
set firstname = 'john'
from Person.Person
where FirstName = 'robert';

update pp
set firstname = 'robert'
from Person.Person as pp
where pp.FirstName = 'john'

-- delete
delete
from Person.Person
where MiddleName is null and FirstName = 'xavier';

--join
select pp.firstname, pp.lastname, pa.addressline1, pa.city, pa.Postalcode
from Person.Person as pp
inner join Person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join Person.Address as pa on pa.AddressID = pbea.AddressID
where pp.FirstName ='jimmy';

select pp.firstname, pp.lastname, ppt.Name, ssoh.OrderDate
from Person.Person as pp
inner join Person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join Person.Address as pa on pa.AddressID = pbea.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join Sales.SalesOrderHeader as ssoh on ssoh.CustomerID = sc.CustomerID
inner join Sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join Production.Product as ppt on ppt.ProductID = ssod.ProductID
where pp.FirstName = 'jimmy' and ppt.Name like '%Tire'
and datepart(month, ssoh.OrderDate) = 7 and month(ssoh.OrderDate) = 7;

select pp.firstname, pp.lastname, ppt.Name
from Person.Person as pp
inner join Person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join Person.Address as pa on pa.AddressID = pbea.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join 
(
    select salesorderid, customerid
    from sales.SalesOrderHeader
    where datepart(month, OrderDate) = 7
) as ssoh on ssoh.CustomerID = sc.CustomerID
inner join Sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join 
(
    select productid, name
    from Production.Product
    where Name like '%tire%'
) as ppt on ppt.ProductID = ssod.ProductID
where pp.FirstName = 'jimmy';

with OrderHeader as 
(
    select salesorderid, customerid
    from sales.SalesOrderHeader
    where datepart(month, OrderDate) = 7
),
Product as
(
    select productid, name
    from Production.Product
    where Name like '%tire%'
)
select pp.firstname, pp.lastname, ppt.Name
from Person.Person as pp
inner join Person.BusinessEntityAddress as pbea on pbea.BusinessEntityID = pp.BusinessEntityID
inner join Person.Address as pa on pa.AddressID = pbea.AddressID
inner join Sales.Customer as sc on sc.CustomerID = pp.BusinessEntityID
inner join Orderheader as ssoh on ssoh.CustomerID = sc.CustomerID
inner join Sales.SalesOrderDetail as ssod on ssod.SalesOrderID = ssoh.SalesOrderID
inner join Product as ppt on ppt.ProductID = ssod.ProductID
where pp.FirstName = 'jimmy';

--union
select distinct pp1.firstname, pp2.lastname
from Person.Person as pp1
inner join Person.Person as pp2 on pp2.LastName = pp1.FirstName;

select firstname
from Person.Person
intersect
select lastname
from Person.Person
