use master;
go

-- create
create database PizzaBox;
go

use PizzaBox
go

-- create schema
create schema Pizza;
go

create schema Customer;
go

create schema [Order];
go

create table [Order].[Order]
(
    OrderId int not null identity(1,2)
    ,UserId int not null --foreign key references Customer.UserId
    ,StoreId int not null -- foreign key
    ,TotalCost decimal(3,2) not null --checked
    ,OrderDate datetime2(7) not null --computed
    ,Active bit not null
    ,constraint PK_Order_OrderID primary key (OrderId)
    --,constraint FK_Order_UserId foreign key (UserId) references Account.Customer(UserId)
);

create table [Order].[OrderPizza]
(
    OrderPizzaId int not null identity(1,2)
    ,OrderId int not null
    ,PizzaId int not null
)

create table [Order].[Pizza]
(
    PizzaId int not null identity(1,2)
    ,Price decimal(2,2) not null
    ,SizeId int not null --foreign
    ,CrustId int not null 
    ,Active bit not null
)

--Alter
alter table [Order].[Order]
    add constraint PK_Order_OrderId primary key (OrderId)

alter table [Order].[Order]
    add constraint PK_OrderPizza_OrderPizzaId primary key (OrderPizzaId)

alter table [Order].[Order]
    add constraint PK_Pizza_PizzaId primary key (PizzaId)

alter table [Order].[OrderPizza]
    add constraint FK_OrderPizza_OrderId foreign key (OrderId) references [Order].[Order](OrderId)

alter table [Order].[OrderPizza]
    add constraint FK_OrderPizza_OrderId foreign key (PizzaId) references [Order].[Pizza](PizzaId)


alter table [Order].[Order]
    add constraint DF_Order_Active default (1) for Active;

alter table [Order].[Pizza]
    add constraint DF_Pizza_Active default (1) for Active;

alter table [Order].[Order]
    add constraint CK_Order_TotalCost check (TotalCost < 500);

alter table [Order].[Order]
    add constraint CK_Order_OrderDate check (OrderDate > '2019-11-11');

alter table [Order].[Order]
    drop constraint CK_Order_OrderDate;

alter table [Order].[Order]
    add TipAmount decimal(2,2) null;

alter table [Order].[Order]
   drop column TipAmount;

--drop
drop table [Order].[OrderPizza];

--Truncate
truncate table [Order].[OrderPizza];