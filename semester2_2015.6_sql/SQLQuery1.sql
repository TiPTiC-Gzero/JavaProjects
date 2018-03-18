create database Project
go

use Project
go

--�ֿ���Ϣ��Warehouse��
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

--��Ʒ���ͱ�(ProductCategory)	
drop table ProductCategory
create table ProductCategory
(
CategoryID	Int	Not null identity(1,1) primary key,	
CategoryName	Nvarchar(30) Not null,	
CategoryDesc	Nvarchar(50)
)
go

--��Ʒ��Ϣ��(Products)	
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

--�ͻ�������Ϣ(UserInfo)		
create table UserInfo
(
UID	int Not null,	
UGender	Nvarchar(4)	Not null default N'��',
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

--������Ϣ��Department��
create table Department
(
DID	Int	Not null identity(1,1) primary key,
DName	Nvarchar(20)	Not null,
DManager	Nvarchar(20)	Not null,
DPost	Nvarchar(50)	Not null
)
go

--Ա����Ϣ��(Employee)
create table Employee
(
EID	Int	Not null,
EName	Nvarchar(20)	Not null,
EGender	Nvarchar(4)	Not null default N'��',
EAge	Char(2)	Not null,
EDepartmentID	Int foreign key references Department(DID)
)
go

--��Ӧ����Ϣ��Suppliers��
create table Suppliers
(
SID	Int	Not null,
SName	Nvarchar(20)	Not null,
SAddress	Nvarchar(200)	Not null,	
STelephoneN	Char(11),	
SProductsID  Int foreign key references Products(PID)
)
go

--������Ϣ��(Purchase)
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

--������Ϣ��Sale��
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


--�����������





--��ѯ����

--��ѯĳ����Ʒ����ϸ��Ϣ
select * from Products where PID='����Ҫ�˽����Ʒ���'


--��ѯĳ������������Ʒ������
select PName from Products where PSpecifications='����Ҫ��ѯ����Ʒ���'

--��ѯָ����λ����Ʒ��ϸ��Ϣ
select * from Products where PPrice>='��λ����' and PPrice<='��λ����'

--��ѯĳ����Ʒ����ϸ��Ϣ
select * from Products where PCategoryID='����Ҫ�˽����Ʒ��ID'

--��ѯĳ���ͻ�����ϸ��Ϣ
select * from UserInfo where UID='����Ҫ�˽�Ŀͻ����'

--��ѯ�������ŵ�Ա����ϸ��Ϣ
select * from Employee where EDepartmentID='Ա�����ڲ��ű��'

--��ѯĳ��Ա�������쵼������
select DManager from Department where DID=(select EDepartmentID from Employee where EName='Ա������')

--��ѯĳ����Ʒ���ڹ�Ӧ�̵���ϸ��Ϣ
select * from Suppliers where SProductsID=(select PID from Products where PName='��Ʒ����')

--��ѯÿ���ֿ������Ʒ����
select WCapacity from Warehouse where WID='�ֿ���'

--��ѯָ��ʱ�����ĳԱ�������۶�
select SPrice from Sale where SDate>='ʱ��' and SDate<='ʱ��' and  SEmployee='����'

--��ѯĳ�ͻ�������������Ϣ
select * from Sale where SUser='�ͻ���'

--