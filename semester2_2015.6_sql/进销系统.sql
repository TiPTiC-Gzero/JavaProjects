create database Project
go
drop database Project
use Project

--�ֿ���Ϣ��Warehouse)

create table Warehouse
(
WarehouseID int identity(1,1) primary key,--�ֿ���
WarehouseName	varchar(20) Not null,--�ֿ�����
WarehouseNum int Not null,--�����
WarehouseArea int Not null,--�ֿ����
WarehouseAddress varchar(20) Not null,--�ֿ��ַ
WarehouseAdministrator	varchar(20)not null --����Ա
)
go

insert into Warehouse values('TTA',100089,1000,'Tstreet','Tix')
insert into Warehouse values('TTB',132423,9223,'Tstreet','Pfent')
insert into Warehouse values('TTC',10349,13234,'Tstreet','Yth')
insert into Warehouse values('TTE',12349,122,'Tstreet','Yrf')
insert into Warehouse values('TTF',12389,1234,'Tstreet','Yasdf')

select * from Warehouse

--��Ʒ����(ProductCategory)
create table ProductCategory
(
CategoryID  int identity(1,1) primary key,--��Ʒ�����
CategoryName nvarchar(30) Not null,--��Ʒ�������
CategoryDesc nvarchar(100) not null,--��Ʒ����
)
go

--��Ʒ��Ϣ��(Products) �Լ���������

create table Products
(
PID	int	Not null identity(1,1) primary key,--��Ʒ���
PName	nvarchar(20)	Not null,--��Ʒ����
PSpecifications	varchar(20)	Not null,--��Ʒ���
PCategory varchar(20)not null,--��Ʒ���
PDesc	varchar(100) not null,--��Ʒ����
PPrice decimal(18,2)  Not null,--��Ʒ����
PNum int Not null,--��Ʒ���
)
go
insert into Products values('iphone4s','16G','1','smartphone',600,100)
insert into Products values('iphone6','32G','1','smartphone',800,887)
insert into Products values('macbook','500G','2','laptop',1100,10000)
insert into Products values('iphone4','8G','1','smartphone',100,99)
select * from Products

--�ͻ�������Ϣ(UserInfo) �Լ���������

create table UserInfo
(
UserInfoID	int identity(1,1) Not null,--�ͻ����
UserInfoName	varchar(20)	Not null,--�ͻ�����
UAge int not null,--�ͻ�����
UGender	varchar(4)	Not null default N'F',--�ͻ��Ա�
UAddress	varchar(200)	Not null,--�ͻ���ַ
UTelephone	char(11)not null constraint CK_UTelephone check(UTelephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') ,--�ͻ��绰
UEmail	varchar(30) constraint CK_UEmail check(UEmail like'%@%.%'),--�ͻ�����
)
go
insert into UserInfo values('Jack',20,'F','Tstreet 10','17841241241','Jack@163.com')
insert into UserInfo values('Dyrad',48,'F','Ystreet 9','17809445278','Dyrad@163.com')
insert into UserInfo values('Surprise',32,'F','Qstreet 10','17805615489','Surprise@163.com')
insert into UserInfo values('Don',34,'F','Pstreet 40','17804937561','Jay@163.com')
insert into UserInfo values('Jarry',35,'F','Ostreet 7','17845629872','Jarry@163.com')
insert into UserInfo values('Tim',21,'F','Mstreet 99','17812461245','Tim@163.com')

select * from UserInfo
--������Ϣ��Department���Լ���������
create table Department
(
DepartmentID	Int	 identity(1,1) Not null primary key,--���ű��
DepartmentName	Nvarchar(20)	Not null,--��������
DepartmentManager	Nvarchar(20)	Not null,--��������
Departdescription	Nvarchar(100)	Not null--��������
)
go

--Ա����Ϣ��(Employee) �Լ���������
create table Employee
(
DepartmentID	int foreign key references Department(DepartmentID),--Ա�������Ĳ���
EmployeeID	int identity(1,1)	Not null primary key,--Ա�����
EmployeeName	nvarchar(20)	Not null,--Ա������
EmployeeGender	nvarchar(4)	Not null default N'��',--Ա���Ա�
EmployeeAge	char(2)	Not null,--Ա������
)
go
--��Ӧ����Ϣ��Suppliers��--�Լ���������
create table Suppliers
(
SupplierID int identity(1,1) not null primary key,--��Ӧ�̱��
SupplierName	nvarchar(20)	Not null,--��Ӧ������
SupplierAddress	nvarchar(200)	Not null,--��Ӧ�̵�ַ
SupplierTelephone char(11)not null constraint CK_STelephone check(SupplierTelephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),--��Ӧ�̵绰
ProductID  int foreign key references Products(PID)--��Ӧ���ṩ��Ʒ�ı��
)
go

--������Ϣ��(Purchase)
create table Purchase
(
PID int identity(1,1) not null,--�������
PPID int not null,--��Ʒ���
PProduct nvarchar(20) Not null,--��Ʒ����
PCost	decimal(18,2) Not null,--��Ʒ�����ɱ�
PNumber nvarchar(20),--��Ʒ��������
PDate	datetime Not null,--��Ʒ��������
PSupplierID	int references Suppliers(SupplierID),--��Ʒ��Ӧ��
PPersonID int not null references Employee(EmployeeID),--�ɹ���Ա
PWarehouseID Int foreign key references Warehouse(WarehouseID)--��Ʒ��Ųֿ�ı��
)
go

--������Ϣ��Sale��
create table Sale
(
SID int not null identity(1,1),--���۱��
ProductID int references Products(PID),--��Ʒ���
ProductPrice decimal(18,2)   Not null,--��Ʒ����  
SaleNumber Nvarchar(20),--��Ʒ��������
SaleDate	Datetime Not null,--��Ʒ��������
SaleEmployee	Nvarchar(20),--��Ʒ����Ա��
SaleUser Nvarchar(20)--�ͻ�
)
go


--�����������



select * from Products
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
select * from UserInfo where UserInfoID='����Ҫ�˽�Ŀͻ����'

--��ѯ�������ŵ�Ա����ϸ��Ϣ
select * from Employee where DepartmentID='Ա�����ڲ��ű��'

--��ѯĳ��Ա�������쵼������
select DepartmentManager from Department where DepartmentID=(select DepartmentID from Employee where EmployeeName='Ա������')

--��ѯĳ����Ʒ���ڹ�Ӧ�̵���ϸ��Ϣ
select * from Suppliers where ProductID=(select PID from Products where PName='��Ʒ����')

--��ѯÿ���ֿ������Ʒ����
select WCapacity from Warehouse where WID='�ֿ���'

--��ѯָ��ʱ�����ĳԱ�������۶�
select SPrice from Sale where SDate>='ʱ��' and SDate<='ʱ��' and  SEmployee='����'

--��ѯĳ�ͻ�������������Ϣ
select * from Sale where SUser='�ͻ���'

--��ѯ��������ͻ�����ϸ����
select 
--��ѯĳ��Ʒ�ĵ�������
select 

--��ѯĳ��Ӧ�̵���ʷ������Ϣ
--��ѯ����������ϸ��Ϣ��������Ӧ�̣�����Ա�����ͻ��ȣ�
--��ѯ��������Ӧ�̵���ϸ��Ϣ
--��ѯÿ�µĴ�����
--��ѯĳ��Ʒ�Ŀ���ַ
--��ѯĳ�ֿ�Ĺ���Ա��Ϣ
--��ѯĳ�ֿ����Ա������ܿ�����



--�ƶ˱��ݲ���

merge backup as t 
Using source as s ON (t.column =s.column)
when matched  and t.column1 <> s.column 1 or t.column2 <>s.column2
then update set t.column1 =s.column1,set t.column2 =s.column2
when not matched by target
then insert values (s.columen1,s.column2)
when not matched by source
then delete

