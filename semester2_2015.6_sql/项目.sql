//* ���������ϵͳ
��Ҫ��
��˾���̵�Ľ��������ۡ���������һ���ǳ����ӵ����飬�˹������ʱ�����������׳���
���������ϵͳ����ƣ����������Ч�ʣ���ʡ������������ʱ����Դ�����Ҳ��׳���
��ΪIT�����Ŷӵ�һԱ���㱻Ҫ�󴴽�һ�����ڽ�����ĸ���ҵ���ܵ����ݿ⡣
�����׶ε�ϸ�ڣ�
1. ϵͳ��Ҫά����Ʒ����Ϣ��������Ʒ���ơ����������������ۡ�������ȡ�
2. ϵͳ��Ҫά����Ʒ�����Ϣ��
3. ϵͳ��Ҫά��Ա������Ϣ������Ա���������Ա����䡢���ŵȡ�
4. ϵͳ��Ҫά�����ŵ���Ϣ�������������ơ����������ܵȡ�
5. ϵͳ��Ҫά���ͻ�����Ϣ�������ͻ����������䡢�Ա𡢵�ַ���绰������ȡ�
6. ϵͳ��Ҫά����Ӧ�̵���Ϣ��������Ӧ�����ơ���ַ���绰��������Ʒ�ȡ�
7. ϵͳ��Ҫά���ֿ����Ϣ�������ֿ����ơ����������������ַ������Ա�ȡ�
8. ϵͳ��Ҫά����������Ϣ��������Ʒ���ơ������ɱ������ۼ۸񡢽����������������ڡ�
   ��Ӧ�̡��ɹ���Ա����Ųֿ�ȡ�
9. ϵͳ��Ҫά�����۵���Ϣ��������Ʒ��š����ۼ۸������������������ڡ�����Ա�����ͻ��ȡ�
��Ҫ���
1. ����ʵ��-��ϵͼ��
2. ʹ��SQL Server��ƺͿ������ݿ⡣
3. ����PPTչʾ��Ŀ��
ָ�����룺
1. ����ȷ��û���κ��ظ���¼
2. ��ȷʵ������������
3. ȷ��ҵ��Լ���ڱ������ȷ����
4. ��ѯ�������Ч��
NIITQDU07
Project Synopsis 2
ҵ��Լ����
1. ��Ʒ��Ա�����ͻ�����Ӧ�̡��ֿ⡢������Ҫ��Ψһ��ʶ��
2. ��ֵ������ȷ�������ָ�����
3. �绰���롢e-mail��ʽ��ȷ��
4. ���ڸ�ʽ��ȷ�����Ҳ��ܳ�����ǰ���ڡ�
��Ҫ���Ĳ�ѯ
1. ���Բ鿴ĳ����Ʒ����ϸ��Ϣ��
2. ���Բ鿴ĳ�ֹ���������Ʒ�����ơ�
3. ���Բ鿴ָ����λ�ڵ���Ʒ��ϸ��Ϣ��
4. ���Բ鿴ĳ����Ʒ����ϸ��Ϣ��
5. ���Բ鿴ĳ���ͻ�����ϸ��Ϣ��
6. ���Բ鿴�������ŵ�Ա������ϸ��Ϣ��
7. ���Բ鿴ĳ��Ա���Ĳ����쵼��������
8. ���Բ鿴ĳ����Ʒ�����й�Ӧ�̵���ϸ��Ϣ��
9. ���Բ鿴ÿ���ֿ�Ŀ����Ʒ��������
10. ���Բ鿴ָ��ʱ�����ĳԱ�������۶
11. ���Բ鿴ĳ�ͻ�������������Ϣ��
12. ���Բ鿴��������ͻ�����ϸ��Ϣ��
13. ���Բ鿴ĳ��Ʒ�ĵ�������
14. ���Բ鿴ĳ��Ӧ�̵���ʷ������Ϣ��
15. ���Բ鿴����������ϸ��Ϣ��������Ӧ�̡�����Ա�����ͻ��ȡ�
16. ���Բ鿴��������Ӧ�̵���ϸ��Ϣ��
17. ���Բ鿴ÿ�µĴ�����
18. ���Բ鿴ĳ��Ʒ�Ŀ���ַ��
19. ���Բ鿴ĳ�ֿ�Ĺ���Ա��Ϣ��
20. ���Բ鿴ĳ�ֿ����Ա������ܿ�������
�ͻ�������Ҫ��
��˾��Ϊ��Ʒ��Ϣ�ǳ���Ҫ����Ҫ���ⲿ�ķ���������һ�����ݣ�
������Ҫ��֤������Ϣ�������µģ��������������⡣*//
go

create database Project

--��Ʒ��Ϣ�����ƣ����������������ۣ��������
create table CommodityInformation
(
TradeName nvarchar(20) not null,
TradeID char(6) not null constraint PK_TradeID primary key constraint CK_TradeID check(TradeID like'IM[0-9][0-9][0-9][0-9]' ),
TSpecification nvarchar(40) not null,/*���*/
Catagory int not null,/*���*/
Description nvarchar(50)not null,/*����*/
UnitPrice money not null constraint CK_UnitPrice check(UnitPrice>0),/*����*/
Stock int not null constraint CK_Stock check(Stock>0),/*�����*/
SupplierID char(4) not null constraint CK_SupplierID check(SupplierID like'[0-9][0-9][0-9][0-9]')/*��Ӧ�̱��*/
)
--��������
insert into CommodityInformation values(N'Ǧ�ʺ�','IM0001',N'����',1,N'��ͨ��ʽ��ɫ�����ľߺ�',20.00,200) ; 
go
--��Ʒ�����Ϣ;
create table MerchandiseCategories
(
Catagory int not null constraint CK_Catagory check(Catagory>0)/*���*/
)
--��������
insert into MerchandiseCategories values(1);
go

--���inner��ѯ(inner��Only give the column which is common in both table)
select a.Catagory,b.Catagory  from CommodityInformation a inner join MerchandiseCategories b on a.Catagory=b.Catagory
go

--Ա����Ϣ���������Ա����䣬���ţ�
create table StaffInformation
(
Name nvarchar(10) not null,
EmployeeID char(6) not null constraint PK_EmployeeID primary key constraint CK_EmployeeID check(EmployeeID like 'Emp[0-9][0-9][0-9]'),
Gender char(2) not null,
Age int not null constraint CK_Age check(Age>0),
Department nvarchar(10) not null,
DepartmentID char(6) not null constraint CK_DepartmentID check(DepartmentID like'Dep[0-9][0-9]')

)
--��������
insert into StaffInformation values('Mark','Emp001',N'��','24',N'���¹�����','Dep01');
go
--������Ϣ���������ƣ����������ܣ�
create table DepartmentInformation
(
DepartmentName nvarchar(10) not null,
DepartmentID char(6) not null constraint CK_DepartmentID check(DepartmentID like'Dep[0-9][0-9]'),
Description nvarchar(max) not null,
Manager nvarchar(10) not null, /*����*/
ManagerID char(6) not null constraint PK_ManagerID primary key constraint CK_ManagerID check(ManagerID like 'Emp[0-9][0-9][0-9]')
)
--��������
insert into DepartmentInformation values(N'���¹�����','Dep01',N'���ڽ��й�˾������Դ����Ĳ���','John','Emp010');
go
--�ͻ���Ϣ���ͻ����������䣬�Ա𣬵�ַ���绰�����䣻
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
--��������
insert into CustomerInformation values('Lucy','Gue001','24',N'Ů',N'�ൺ���������˴��20��','13000000000','12345@163.com');
go
--��Ӧ�̣���Ӧ�����ƣ���ַ���绰����Ӧ��Ʒ
create table Supplier
(
Supplier nvarchar(20) not null,
SupplierID char(4) not null constraint PK_SupplierID primary key constraint CK_SupplierID check(SupplierID like'Sp[0-9][0-9]'),
Address nvarchar(20) not null,
SupplierTelephone char(11) not null constraint CK_SupplierTelephone check(SupplierTelephone like'1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
SuppliedGoods nvarchar(10)not null,
SuppliedGoodsID char(6) not null constraint CK_SuppliedGoodsID check(SuppliedGoodsID like'IM[0-9][0-9][0-9][0-9]' ),
)
--��������
insert into Supplier values(N'�ɿڿ��ֹ�˾','Sp01','�����пɿڿ������޹�˾','13222222222','�ɿڿ���','IM0002');
go
--�ֿ⣺�ֿ����ƣ����������������ַ������Ա��
create table Storage
(
StorageName nvarchar(10) not null,
StorageID char(3) not null constraint PK_StorageID primary key constraint CK_StorageID check(StorageID like 'S[0-9][0-9]'),
StorageCapacity int not null constraint CK_StorageCapacity check(StorageCapacity>0),/*������*/
Area int not null,
Address nvarchar(20) not null,
StorageManager nvarchar(10) not null,
StorageManagerID char(6) not null  constraint CK_StorageManagerID check(StorageManagerID like 'Emp[0-9][0-9][0-9]')
)
--��������
insert into Storage values('һ�Ųֿ�','S01','1000','200','�ൺ����ɽ��һ�Ųֿ�','Jim','Emp003')
go
--������Ϣ����Ʒ���ƣ������ɱ������ۼ۸񣬽����������������ڣ���Ӧ�̣��ɹ���Ա����Ųֿ�
create table PurchaseInformation
(
PurchaseID char(5) not null constraint PK_PurchaseID primary key constraint CK_PurchaseID check(PurchaseID like'Pur[0-9][0-9][0-9]'),
TradeName nvarchar(10) not null,
Cost money not null check(Cost>0),/*�����ɱ�*/
Price money not null,/*���ۼ۸�*/
Quantity int not null,/*��������*/
PurchaseDate date not null constraint CK_PurchaseDate check(PurchaseDate <getdate() and PurchaseDate >'1900-01-01'),
Supplier nvarchar(20) not null,
SupplierID char(4) not null constraint CK_SupplierID check(SupplierID like'[0-9][0-9][0-9][0-9]'),
Buyer nvarchar(20) not null,
BuyerID char(4) not null constraint CK_BuyerID check(BuyerID like'By[0-9][0-9]'),
StoreHouseName nvarchar(10) not null,
StoreHouseID char(3) not null constraint CK_StoreHouseID check(StoreHouseID like 'S[0-9][0-9]')
)
--��������
insert into PurchaseInformation values
('Pur001','�ʼǱ�','1000000','5000','3000','2001-07-16','Dell','Sp02','Tom','By01','�ڶ��ֿ�','S02');
go
--������Ϣ����Ʒ��ţ����ۼ۸������������������ڣ�����Ա�����ͻ�
create table SaleInformation
(
OrderID char(5) not null constraint PK_OrderID primary key constraint CK_OrderID check(OrderID like'Ord[0-9][0-9][0-9]'),
TradeID char(6) not null constraint CK_TradeID check(TradeID like'IM[0-9][0-9][0-9][0-9]' ),/*��Ʒ���*/
Price money not null,/*���ۼ۸�*/
SaleQuantity int not null,
SaleDate date not null constraint CK_SaleDate check(SaleDate <getdate() and SaleDate >'1900-01-01'),
Saler nvarchar(10)not null,
SalerID char(6) not null constraint CK_EmployeeID check(SalerID like 'Emp[0-9][0-9][0-9]'),
CustomerName nvarchar(10) not null,
CustomerID char(6) not null constraint CK_CustomerID check(CustomerID like 'Gue[0-9][0-9][0-9]')
)
--��������
insert into SaleInformation values('Ord001','IM0001','20','100','2002-01-31','Jimm','Emp003','Con','Gue002');
go


��Ҫ���Ĳ�ѯ
1. ���Բ鿴ĳ����Ʒ����ϸ��Ϣ��

select * from CommodityInformation where  TradeID='��ƷID'
2. ���Բ鿴ĳ�ֹ���������Ʒ�����ơ�
select TradeName from  CommodityInformation where TSpecification ='���'
3. ���Բ鿴ָ����λ�ڵ���Ʒ��ϸ��Ϣ��
select * from CommodityInformation where UnitPrice between '�۸�'and'�۸�' 
4. ���Բ鿴ĳ����Ʒ����ϸ��Ϣ��
select * from CommodityInformation where Catagory='���'
5. ���Բ鿴ĳ���ͻ�����ϸ��Ϣ��
select * from CustomerInformation where CustomerID='�ͻ�ID'
6. ���Բ鿴�������ŵ�Ա������ϸ��Ϣ��
select * from StaffInformation where DepartmentID='����ID'

7. ���Բ鿴ĳ��Ա���Ĳ����쵼��������
select Manager from DepartmentInformation where DepartmentID=(select DepartmentID from StaffInformation where EmployeeID='Ա��ID')

8. ���Բ鿴ĳ����Ʒ�����й�Ӧ�̵���ϸ��Ϣ��

select * from Supplier where SupplierID=(select SupplierID  from CommodityInformation where TradeID='��ƷID')
9. ���Բ鿴ÿ���ֿ�Ŀ����Ʒ��������

10. ���Բ鿴ָ��ʱ�����ĳԱ�������۶
11. ���Բ鿴ĳ�ͻ�������������Ϣ��
12. ���Բ鿴��������ͻ�����ϸ��Ϣ��
13. ���Բ鿴ĳ��Ʒ�ĵ�������
14. ���Բ鿴ĳ��Ӧ�̵���ʷ������Ϣ��
15. ���Բ鿴����������ϸ��Ϣ��������Ӧ�̡�����Ա�����ͻ��ȡ�
16. ���Բ鿴��������Ӧ�̵���ϸ��Ϣ��
17. ���Բ鿴ÿ�µĴ�����
18. ���Բ鿴ĳ��Ʒ�Ŀ���ַ��
19. ���Բ鿴ĳ�ֿ�Ĺ���Ա��Ϣ��
20. ���Բ鿴ĳ�ֿ����Ա������ܿ�������
�ͻ�������Ҫ��
��˾��Ϊ��Ʒ��Ϣ�ǳ���Ҫ����Ҫ���ⲿ�ķ���������һ�����ݣ�
������Ҫ��֤������Ϣ�������µģ��������������⡣