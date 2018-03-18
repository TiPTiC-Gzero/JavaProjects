//* 进销存管理系统
概要：
公司或商店的进货、销售、库存管理是一件非常复杂的事情，人工管理费时、费力又容易出错。
进销存管理系统的设计，将会大大提高效率，节省人力、物力和时间资源，而且不易出错。
作为IT开发团队的一员，你被要求创建一个基于进销存的各种业务功能的数据库。
分析阶段的细节：
1. 系统需要维护商品的信息。包括商品名称、规格、类别、描述、单价、库存量等。
2. 系统需要维护商品类别信息。
3. 系统需要维护员工的信息。包括员工姓名、性别、年龄、部门等。
4. 系统需要维护部门的信息。包括部门名称、描述、主管等。
5. 系统需要维护客户的信息。包括客户姓名、年龄、性别、地址、电话、邮箱等。
6. 系统需要维护供应商的信息。包括供应商名称、地址、电话、所供商品等。
7. 系统需要维护仓库的信息。包括仓库名称、库容量、面积、地址、管理员等。
8. 系统需要维护进货的信息。包括商品名称、进货成本、销售价格、进货数量、进货日期、
   供应商、采购人员、存放仓库等。
9. 系统需要维护销售的信息。包括商品编号、销售价格、销售数量、销售日期、销售员工、客户等。
主要活动：
1. 创建实体-关系图。
2. 使用SQL Server设计和开发数据库。
3. 制作PPT展示项目。
指导方针：
1. 必须确保没有任何重复记录
2. 正确实现引用完整性
3. 确保业务约束在表级别的正确创建
4. 查询必须更有效率
NIITQDU07
Project Synopsis 2
业务约束：
1. 商品、员工、客户、供应商、仓库、订单都要有唯一标识。
2. 数值型数据确保不出现负数。
3. 电话号码、e-mail格式正确。
4. 日期格式正确，并且不能超过当前日期。
需要做的查询
1. 可以查看某个商品的详细信息。
2. 可以查看某种规格的所有商品的名称。
3. 可以查看指定价位内的商品详细信息。
4. 可以查看某类商品的详细信息。
5. 可以查看某个客户的详细信息。
6. 可以查看各个部门的员工的详细信息。
7. 可以查看某个员工的部门领导的姓名。
8. 可以查看某个商品的所有供应商的详细信息。
9. 可以查看每个仓库的库存商品的数量。
10. 可以查看指定时间段内某员工的销售额。
11. 可以查看某客户的所有销售信息。
12. 可以查看历年的最大客户的详细信息。
13. 可以查看某商品的单件利润。
14. 可以查看某供应商的历史供货信息。
15. 可以查看进货单的详细信息，包括供应商、销售员工、客户等。
16. 可以查看历年的最大供应商的详细信息。
17. 可以查看每月的纯利润。
18. 可以查看某商品的库存地址。
19. 可以查看某仓库的管理员信息。
20. 可以查看某仓库管理员管理的总库存面积。
客户的其它要求：
公司认为商品信息非常重要，需要在外部的服务器中做一个备份，
并且需要保证备份信息总是最新的，请帮助解决该问题。*//
go

create database Project

--商品信息：名称，规格，类别，描述，单价，库存量；
create table CommodityInformation
(
TradeName nvarchar(20) not null,
TradeID char(6) not null constraint PK_TradeID primary key constraint CK_TradeID check(TradeID like'IM[0-9][0-9][0-9][0-9]' ),
TSpecification nvarchar(40) not null,/*规格*/
Catagory int not null,/*类别*/
Description nvarchar(50)not null,/*描述*/
UnitPrice money not null constraint CK_UnitPrice check(UnitPrice>0),/*单价*/
Stock int not null constraint CK_Stock check(Stock>0),/*库存量*/
SupplierID char(4) not null constraint CK_SupplierID check(SupplierID like'[0-9][0-9][0-9][0-9]')/*供应商编号*/
)
--插入数据
insert into CommodityInformation values(N'铅笔盒','IM0001',N'帆布',1,N'卡通款式绿色帆布文具盒',20.00,200) ; 
go
--商品类别信息;
create table MerchandiseCategories
(
Catagory int not null constraint CK_Catagory check(Catagory>0)/*类别*/
)
--插入数据
insert into MerchandiseCategories values(1);
go

--类别inner查询(inner：Only give the column which is common in both table)
select a.Catagory,b.Catagory  from CommodityInformation a inner join MerchandiseCategories b on a.Catagory=b.Catagory
go

--员工信息：姓名，性别，年龄，部门；
create table StaffInformation
(
Name nvarchar(10) not null,
EmployeeID char(6) not null constraint PK_EmployeeID primary key constraint CK_EmployeeID check(EmployeeID like 'Emp[0-9][0-9][0-9]'),
Gender char(2) not null,
Age int not null constraint CK_Age check(Age>0),
Department nvarchar(10) not null,
DepartmentID char(6) not null constraint CK_DepartmentID check(DepartmentID like'Dep[0-9][0-9]')

)
--插入数据
insert into StaffInformation values('Mark','Emp001',N'男','24',N'人事管理部门','Dep01');
go
--部门信息：部门名称，描述，主管；
create table DepartmentInformation
(
DepartmentName nvarchar(10) not null,
DepartmentID char(6) not null constraint CK_DepartmentID check(DepartmentID like'Dep[0-9][0-9]'),
Description nvarchar(max) not null,
Manager nvarchar(10) not null, /*主管*/
ManagerID char(6) not null constraint PK_ManagerID primary key constraint CK_ManagerID check(ManagerID like 'Emp[0-9][0-9][0-9]')
)
--插入数据
insert into DepartmentInformation values(N'人事管理部门','Dep01',N'用于进行公司人力资源管理的部门','John','Emp010');
go
--客户信息：客户姓名，年龄，性别，地址，电话，邮箱；
create table CustomerInformation
(
Name nvarchar(10) not null,
CustomerID char(6) not null constraint PK_CustomerID primary key constraint CK_CustomerID check(CustomerID like 'Gue[0-9][0-9][0-9]'),
Age int not null constraint CK_Age check(Age>0),
Gender char(2) not null,
Address nvarchar(20) not null,
Telephone char(11) not null constraint CK_Telephone check(Telephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
EMail varchar(30) not null constraint CK_EMail check(EMail like '%@%')
)
--插入数据
insert into CustomerInformation values('Lucy','Gue001','24',N'女',N'青岛市市南区八大关20号','13000000000','12345@163.com');
go
--供应商：供应商名称，地址，电话，供应商品
create table Supplier
(
Supplier nvarchar(20) not null,
SupplierID char(4) not null constraint PK_SupplierID primary key constraint CK_SupplierID check(SupplierID like'Sp[0-9][0-9]'),
Address nvarchar(20) not null,
SupplierTelephone char(11) not null constraint CK_SupplierTelephone check(SupplierTelephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
SuppliedGoods nvarchar(10)not null,
SuppliedGoodsID char(6) not null constraint CK_SuppliedGoodsID check(SuppliedGoodsID like'IM[0-9][0-9][0-9][0-9]' ),
)
--插入数据
insert into Supplier values(N'可口可乐公司','Sp01','北京市可口可乐有限公司','13222222222','可口可乐','IM0002');
go
--仓库：仓库名称，库容量，面积，地址，管理员；
create table Storage
(
StorageName nvarchar(10) not null,
StorageID char(3) not null constraint PK_StorageID primary key constraint CK_StorageID check(StorageID like 'S[0-9][0-9]'),
StorageCapacity int not null constraint CK_StorageCapacity check(StorageCapacity>0),/*库容量*/
Area int not null,
Address nvarchar(20) not null,
StorageManager nvarchar(10) not null,
StorageManagerID char(6) not null  constraint CK_StorageManagerID check(StorageManagerID like 'Emp[0-9][0-9][0-9]')
)
--插入数据
insert into Storage values('一号仓库','S01','1000','200','青岛市崂山区一号仓库','Jim','Emp003')
go
--进货信息：商品名称，进货成本，销售价格，进货数量，进货日期，供应商，采购人员，存放仓库
create table PurchaseInformation
(
PurchaseID char(5) not null constraint PK_PurchaseID primary key constraint CK_PurchaseID check(PurchaseID like'Pur[0-9][0-9][0-9]'),
TradeName nvarchar(10) not null,
Cost money not null check(Cost>0),/*进货成本*/
Price money not null,/*销售价格*/
Quantity int not null,/*进货数量*/
PurchaseDate date not null constraint CK_PurchaseDate check(PurchaseDate <getdate() and PurchaseDate >'1900-01-01'),
Supplier nvarchar(20) not null,
SupplierID char(4) not null constraint CK_SupplierID check(SupplierID like'[0-9][0-9][0-9][0-9]'),
Buyer nvarchar(20) not null,
BuyerID char(4) not null constraint CK_BuyerID check(BuyerID like'By[0-9][0-9]'),
StoreHouseName nvarchar(10) not null,
StoreHouseID char(3) not null constraint CK_StoreHouseID check(StoreHouseID like 'S[0-9][0-9]')
)
--插入数据
insert into PurchaseInformation values
('Pur001','笔记本','1000000','5000','3000','2001-07-16','Dell','Sp02','Tom','By01','第二仓库','S02');
go
--销售信息：商品编号，销售价格，销售数量，销售日期，销售员工，客户
create table SaleInformation
(
OrderID char(5) not null constraint PK_OrderID primary key constraint CK_OrderID check(OrderID like'Ord[0-9][0-9][0-9]'),
TradeID char(6) not null constraint CK_TradeID check(TradeID like'IM[0-9][0-9][0-9][0-9]' ),/*商品编号*/
Price money not null,/*销售价格*/
SaleQuantity int not null,
SaleDate date not null constraint CK_SaleDate check(SaleDate <getdate() and SaleDate >'1900-01-01'),
Saler nvarchar(10)not null,
SalerID char(6) not null constraint CK_EmployeeID check(SalerID like 'Emp[0-9][0-9][0-9]'),
CustomerName nvarchar(10) not null,
CustomerID char(6) not null constraint CK_CustomerID check(CustomerID like 'Gue[0-9][0-9][0-9]')
)
--插入数据
insert into SaleInformation values('Ord001','IM0001','20','100','2002-01-31','Jimm','Emp003','Con','Gue002');
go


需要做的查询
1. 可以查看某个商品的详细信息。

select * from CommodityInformation where  TradeID='商品ID'
2. 可以查看某种规格的所有商品的名称。
select TradeName from  CommodityInformation where TSpecification ='规格'
3. 可以查看指定价位内的商品详细信息。
select * from CommodityInformation where UnitPrice between '价格'and'价格' 
4. 可以查看某类商品的详细信息。
select * from CommodityInformation where Catagory='规格'
5. 可以查看某个客户的详细信息。
select * from CustomerInformation where CustomerID='客户ID'
6. 可以查看各个部门的员工的详细信息。
select * from StaffInformation where DepartmentID='部门ID'

7. 可以查看某个员工的部门领导的姓名。
select Manager from DepartmentInformation where DepartmentID=(select DepartmentID from StaffInformation where EmployeeID='员工ID')

8. 可以查看某个商品的所有供应商的详细信息。

select * from Supplier where SupplierID=(select SupplierID  from CommodityInformation where TradeID='商品ID')
9. 可以查看每个仓库的库存商品的数量。

10. 可以查看指定时间段内某员工的销售额。
11. 可以查看某客户的所有销售信息。
12. 可以查看历年的最大客户的详细信息。
13. 可以查看某商品的单件利润。
14. 可以查看某供应商的历史供货信息。
15. 可以查看进货单的详细信息，包括供应商、销售员工、客户等。
16. 可以查看历年的最大供应商的详细信息。
17. 可以查看每月的纯利润。
18. 可以查看某商品的库存地址。
19. 可以查看某仓库的管理员信息。
20. 可以查看某仓库管理员管理的总库存面积。
客户的其它要求：
公司认为商品信息非常重要，需要在外部的服务器中做一个备份，
并且需要保证备份信息总是最新的，请帮助解决该问题。