create database Project
go

use Project
go

--仓库信息表（Warehouse）
create table Warehouse
(
WID Int	Not null identity(1,1) primary key,
WName	Nvarchar(20) Not null,
WCapacity	Int	Not null,
WArea	Nvarchar(10) Not null,
WAddress	Nvarchar(20) Not null,
WAdministrator	Nvarchar(20)
)
go

--商品类型表(ProductCategory)	
drop table ProductCategory
create table ProductCategory
(
CategoryID	Int	Not null identity(1,1) primary key,	
CategoryName	Nvarchar(30) Not null,	
CategoryDesc	Nvarchar(50)
)
go

--商品信息表(Products)	
drop table Products
create table Products
(
PID	Int	Not null identity(1,1) primary key,		
PName	Nvarchar(20)	Not null,	
PPrice	Decimal(18,2)	Not null,
PSpecifications	Nvarchar(10)	Not null,	
PNum	Int	Not null,	
PImagePath	Nvarchar(100)	,	
PCategoryID	Int foreign key references ProductCategory(CategoryID),
PWarehouseID Int foreign key references Warehouse(WID)
)
go

--客户基本信息(UserInfo)		
create table UserInfo
(
UID	int Not null,	
UGender	Nvarchar(4)	Not null default N'男',
UProvince	NVarchar(20)	Not null,	
UCity	Nvarchar(20)	Not null,	
UContact	Nvarchar(20)	Not null,	
UName	Nvarchar(20)	Not null,	
UAddress	Nvarchar(200)	Not null,	
UZipCode	Char(6)	,	
UTelephoneN	Char(11),	
UEmail	NVarchar(100),	
UIdentityType	Nvarchar(10)	Not null,	
UIdentityNumber	Nvarchar(50)	Not null,	
)
go

--部门信息表（Department）
create table Department
(
DID	Int	Not null identity(1,1) primary key,
DName	Nvarchar(20)	Not null,
DManager	Nvarchar(20)	Not null,
DPost	Nvarchar(50)	Not null
)
go

--员工信息表(Employee)
create table Employee
(
EID	Int	Not null,
EName	Nvarchar(20)	Not null,
EGender	Nvarchar(4)	Not null default N'男',
EAge	Char(2)	Not null,
EDepartmentID	Int foreign key references Department(DID)
)
go

--供应商信息表（Suppliers）
create table Suppliers
(
SID	Int	Not null,
SName	Nvarchar(20)	Not null,
SAddress	Nvarchar(200)	Not null,	
STelephoneN	Char(11),	
SProductsID  Int foreign key references Products(PID)
)
go

--进货信息表(Purchase)
create table Purchase
(
PProduct	Nvarchar(20) Not null,
PCost	Decimal(18,2) Not null,
PNumber Nvarchar(20),
PDate	Datetime Not null,
PSupplierN	Nvarchar(20),
PPerson	Nvarchar(20),
PWarehouseID Int foreign key references Warehouse(WID)
)
go

--销售信息表（Sale）
create table Sale
(
SProductID Int Not null identity(1,1) primary key,
SPrice	Decimal(18,2) Not null,
SNumber Nvarchar(20),
SDate	Datetime Not null,
SEmployee	Nvarchar(20),
SUser	Nvarchar(20)
)
go


--插入各种数据





--查询功能

--查询某个商品的详细信息
select * from Products where PID='你想要了解的商品编号'


--查询某个规格的所有商品的名称
select PName from Products where PSpecifications='你想要查询的商品规格'

--查询指定价位的商品详细信息
select * from Products where PPrice>='价位下线' and PPrice<='价位上线'

--查询某类商品的详细信息
select * from Products where PCategoryID='你想要了解的商品类ID'

--查询某个客户的详细信息
select * from UserInfo where UID='你想要了解的客户编号'

--查询各个部门的员工详细信息
select * from Employee where EDepartmentID='员工所在部门编号'

--查询某个员工部门领导的姓名
select DManager from Department where DID=(select EDepartmentID from Employee where EName='员工姓名')

--查询某个商品所在供应商的详细信息
select * from Suppliers where SProductsID=(select PID from Products where PName='商品名字')

--查询每个仓库库存的商品数量
select WCapacity from Warehouse where WID='仓库编号'

--查询指定时间段内某员工的销售额
select SPrice from Sale where SDate>='时间' and SDate<='时间' and  SEmployee='名字'

--查询某客户的所有销售信息
select * from Sale where SUser='客户名'

--