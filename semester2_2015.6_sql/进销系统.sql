create database Project
go
drop database Project
use Project

--仓库信息表（Warehouse)

create table Warehouse
(
WarehouseID int identity(1,1) primary key,--仓库编号
WarehouseName	varchar(20) Not null,--仓库名称
WarehouseNum int Not null,--库存量
WarehouseArea int Not null,--仓库面积
WarehouseAddress varchar(20) Not null,--仓库地址
WarehouseAdministrator	varchar(20)not null --管理员
)
go

insert into Warehouse values('TTA',100089,1000,'Tstreet','Tix')
insert into Warehouse values('TTB',132423,9223,'Tstreet','Pfent')
insert into Warehouse values('TTC',10349,13234,'Tstreet','Yth')
insert into Warehouse values('TTE',12349,122,'Tstreet','Yrf')
insert into Warehouse values('TTF',12389,1234,'Tstreet','Yasdf')

select * from Warehouse

--商品类别表(ProductCategory)
create table ProductCategory
(
CategoryID  int identity(1,1) primary key,--商品类别编号
CategoryName nvarchar(30) Not null,--商品类别名称
CategoryDesc nvarchar(100) not null,--商品描述
)
go

--商品信息表(Products) 自己插入数据

create table Products
(
PID	int	Not null identity(1,1) primary key,--商品编号
PName	nvarchar(20)	Not null,--商品名称
PSpecifications	varchar(20)	Not null,--商品规格
PCategory varchar(20)not null,--商品类别
PDesc	varchar(100) not null,--商品描述
PPrice decimal(18,2)  Not null,--商品单价
PNum int Not null,--商品库存
)
go
insert into Products values('iphone4s','16G','1','smartphone',600,100)
insert into Products values('iphone6','32G','1','smartphone',800,887)
insert into Products values('macbook','500G','2','laptop',1100,10000)
insert into Products values('iphone4','8G','1','smartphone',100,99)
select * from Products

--客户基本信息(UserInfo) 自己插入数据

create table UserInfo
(
UserInfoID	int identity(1,1) Not null,--客户编号
UserInfoName	varchar(20)	Not null,--客户姓名
UAge int not null,--客户年龄
UGender	varchar(4)	Not null default N'F',--客户性别
UAddress	varchar(200)	Not null,--客户地址
UTelephone	char(11)not null constraint CK_UTelephone check(UTelephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') ,--客户电话
UEmail	varchar(30) constraint CK_UEmail check(UEmail like'%@%.%'),--客户邮箱
)
go
insert into UserInfo values('Jack',20,'F','Tstreet 10','17841241241','Jack@163.com')
insert into UserInfo values('Dyrad',48,'F','Ystreet 9','17809445278','Dyrad@163.com')
insert into UserInfo values('Surprise',32,'F','Qstreet 10','17805615489','Surprise@163.com')
insert into UserInfo values('Don',34,'F','Pstreet 40','17804937561','Jay@163.com')
insert into UserInfo values('Jarry',35,'F','Ostreet 7','17845629872','Jarry@163.com')
insert into UserInfo values('Tim',21,'F','Mstreet 99','17812461245','Tim@163.com')

select * from UserInfo
--部门信息表（Department）自己插入数据
create table Department
(
DepartmentID	Int	 identity(1,1) Not null primary key,--部门编号
DepartmentName	Nvarchar(20)	Not null,--部门名称
DepartmentManager	Nvarchar(20)	Not null,--部门主管
Departdescription	Nvarchar(100)	Not null--部门描述
)
go

--员工信息表(Employee) 自己插入数据
create table Employee
(
DepartmentID	int foreign key references Department(DepartmentID),--员工所属的部门
EmployeeID	int identity(1,1)	Not null primary key,--员工编号
EmployeeName	nvarchar(20)	Not null,--员工姓名
EmployeeGender	nvarchar(4)	Not null default N'男',--员工性别
EmployeeAge	char(2)	Not null,--员工年龄
)
go
--供应商信息表（Suppliers）--自己插入数据
create table Suppliers
(
SupplierID int identity(1,1) not null primary key,--供应商编号
SupplierName	nvarchar(20)	Not null,--供应商名称
SupplierAddress	nvarchar(200)	Not null,--供应商地址
SupplierTelephone char(11)not null constraint CK_STelephone check(SupplierTelephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),--供应商电话
ProductID  int foreign key references Products(PID)--供应商提供商品的编号
)
go

--进货信息表(Purchase)
create table Purchase
(
PID int identity(1,1) not null,--进货编号
PPID int not null,--商品编号
PProduct nvarchar(20) Not null,--商品名称
PCost	decimal(18,2) Not null,--商品进货成本
PNumber nvarchar(20),--商品进货数量
PDate	datetime Not null,--商品进货日期
PSupplierID	int references Suppliers(SupplierID),--商品供应商
PPersonID int not null references Employee(EmployeeID),--采购人员
PWarehouseID Int foreign key references Warehouse(WarehouseID)--商品存放仓库的编号
)
go

--销售信息表（Sale）
create table Sale
(
SID int not null identity(1,1),--销售编号
ProductID int references Products(PID),--商品编号
ProductPrice decimal(18,2)   Not null,--商品单价  
SaleNumber Nvarchar(20),--商品销售数量
SaleDate	Datetime Not null,--商品销售日期
SaleEmployee	Nvarchar(20),--商品销售员工
SaleUser Nvarchar(20)--客户
)
go


--插入各种数据



select * from Products
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
select * from UserInfo where UserInfoID='你想要了解的客户编号'

--查询各个部门的员工详细信息
select * from Employee where DepartmentID='员工所在部门编号'

--查询某个员工部门领导的姓名
select DepartmentManager from Department where DepartmentID=(select DepartmentID from Employee where EmployeeName='员工姓名')

--查询某个商品所在供应商的详细信息
select * from Suppliers where ProductID=(select PID from Products where PName='商品名字')

--查询每个仓库库存的商品数量
select WCapacity from Warehouse where WID='仓库编号'

--查询指定时间段内某员工的销售额
select SPrice from Sale where SDate>='时间' and SDate<='时间' and  SEmployee='名字'

--查询某客户的所有销售信息
select * from Sale where SUser='客户名'

--查询历年的最大客户的详细资料
select 
--查询某商品的单件利润
select 

--查询某供应商的历史供货信息
--查询进货单的详细信息（包括供应商，销售员工，客户等）
--查询历年的最大供应商的详细信息
--查询每月的纯利润
--查询某商品的库存地址
--查询某仓库的管理员信息
--查询某仓库管理员管理的总库存面积



--云端备份部分

merge backup as t 
Using source as s ON (t.column =s.column)
when matched  and t.column1 <> s.column 1 or t.column2 <>s.column2
then update set t.column1 =s.column1,set t.column2 =s.column2
when not matched by target
then insert values (s.columen1,s.column2)
when not matched by source
then delete

