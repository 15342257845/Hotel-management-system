use master
go

if exists(select * from sysdatabases where name='HotelManager')
drop database HotelManager
go

create database HotelManager 
go

use HotelManager
go

--��1��Ա���� Employee 
create table Employee(
 EId int primary key identity(1,1),--����������	Ա�����
 EName varchar(20) not null,--�ǿ�	�˺�
 EPwd varchar(32) not null,--�ǿ�	����
 EType bit not null,--�ǿ�	0������1��Ա��
)
go

insert into Employee(EName,EPwd,EType) values('Сǿ','123456',0)
insert into Employee(EName,EPwd,EType) values('С��','123457',1)
insert into Employee(EName,EPwd,EType) values('С��','123458',1)
insert into Employee(EName,EPwd,EType) values('С��','123459',1)
insert into Employee(EName,EPwd,EType) values('С��','1234510',1)
go

--��2����Ա�ȼ��� MemberType
create table MemberType(
 MTypeId int primary key identity(10,1),--����������	��Ա�ȼ����
 MTittle varchar(20),--����ʯ���ƽ�
 MDiscount decimal(3,2) not null,--�ǿ�	�ۿۣ�0.98
 MIsdelete	bit default 0,--�Ƿ�ɾ��0:false  1:true
)
go

insert into MemberType(MTittle,MDiscount)values('שʯ',0.77)
insert into MemberType(MTittle,MDiscount)values('�ƽ�',0.87)
insert into MemberType(MTittle,MDiscount)values('����',0.90)
insert into MemberType(MTittle,MDiscount)values('��ͭ',0.95)
insert into MemberType(MTittle,MDiscount)values('������',0.98)
go

--��3����Ա�� Member
create table Member(
 MId int primary key identity(100,1),--����������	��Ա���
 MName varchar(20),--��Ա����
 MPhone	Varchar(11),--�绰
 MMoney	Decimal(6,2),--�˻����
 MIsdelete	bit default 0,--�Ƿ�ɾ��0:false  1:true
 MTypeId int references MemberType(MTypeId),--���MemberType(MTypeId)	�����Ա�ȼ���
)
go
insert into Member(MName,MPhone,MMoney,MTypeId)values ('����',12345678900,1234.99,10)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('����',12345678901,1874.99,11)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('����',12345678902,1634.99,12)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('����',12345678903,1894.99,13)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('����',12345678904,1234.99,14)
go

--��4����Ʒ����� DishType
create table DishType(
 DTypeId	int primary key identity(101,1),	--����������	��Ʒ���ͱ��
 DTittle	Varchar(20),-- ��Ʒ���
 DIsdelete	bit default 0,		--�Ƿ�ɾ��0:false  1:true
)
go
insert into DishType(DTittle)values('����')
insert into DishType(DTittle)values('����')
insert into DishType(DTittle)values('��ɳ��')
insert into DishType(DTittle)values('�人��')
insert into DishType(DTittle)values('�����')
go

--��5����Ʒ�� Dish
create table Dish(
 DId	int primary key identity(1,1),	--����������	��Ʒ���
 DTittle	Varchar(20),--		������
 DPrice	Decimal(5,2),--		�۸�
 DChar	Varchar(10),--		����ĸ
 DIsdelete	bit default 0,		--�Ƿ�ɾ��0:false  1:true
 DTypeId	int references DishType(DTypeId),--  ���DishType(DTypeId)

)
go

insert into Dish(DTittle,DPrice,DChar,DTypeId)values('���',123.66,'H',101)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('������',123.66,'H',102)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('������',123.66,'C',103)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('�ȸ���',123.66,'R',104)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('����',123.66,'Z',105)
go

--��6������ Hall
create table Hall(
 HId	int primary key identity(1,1),	--����������	�����
 HTittle	Varchar(20),--		�Ƶ�����
 HIsdelete	bit default 0,--		�Ƿ�ɾ��0:false  1:true
)
go

insert into Hall(HTittle)values('��԰')
insert into Hall(HTittle)values('����')
insert into Hall(HTittle)values('���')
insert into Hall(HTittle)values('��������')
insert into Hall(HTittle)values('�ٺ�')
go

--��7��������Ĳ��� HallTable
create table HallTable(
 TId	int primary key identity(1,1),--	����������	�������
 TTittle Varchar(20),--		��������
 TIsFree bit default 0,--�ǿ�	�Ƿ����0���� ��1���ǿ���
 TIsdelete bit default 0,--�Ƿ�ɾ�� 0:false  1:true
 HId int references Hall(HId), 	--��� Hall��HId��	���Hall ����HId
)
go

insert into HallTable(TTittle,HId)values('����',1)
insert into HallTable(TTittle,HId)values('������',1)
insert into HallTable(TTittle,HId)values('С����',1)
insert into HallTable(TTittle,HId)values('����',2)
insert into HallTable(TTittle,HId)values('������',2)
insert into HallTable(TTittle,HId)values('С����',2)
insert into HallTable(TTittle,HId)values('����',3)
insert into HallTable(TTittle,HId)values('������',3)
insert into HallTable(TTittle,HId)values('С����',3)
insert into HallTable(TTittle,HId)values('����',4)
insert into HallTable(TTittle,HId)values('������',4)
insert into HallTable(TTittle,HId)values('С����',4)
insert into HallTable(TTittle,HId)values('����',5)
insert into HallTable(TTittle,HId)values('������',5)
insert into HallTable(TTittle,HId)values('С����',5)
insert into HallTable(TTittle,TIsFree,HId)values('��',1,3)
insert into HallTable(TTittle,TIsFree,HId)values('����',1,4)
insert into HallTable(TTittle,TIsFree,HId)values('����',1,5)
go

--��8�������� Order
create table [Order](
 OId int primary key identity(1,1),--	����������	�������
 ODate datetime,--	Ĭ�ϵ�ǰʱ��	����ʱ��
 OMoney	float default 0,--	�ǿ�	�����۸�
 OIsPay	bit not null,--	�ǿ�	�����Ƿ�֧��0��֧�� 1��δ֧��
 ODiscount	Decimal(3,2),--һ��3λ����С������λ
 TId int references HallTable(TId),--���HallTable(TId)	���HallTable���е�TId
)
go

insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.77,1)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.80,2)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.88,3)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.90,4)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.99,5)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.77,6)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.80,7)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.88,8)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.90,9)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.99,10)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.77,11)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.80,12)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.88,13)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.90,14)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.99,15)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.80,16)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.88,17)
insert  into [Order](ODate,OMoney,OIsPay,ODiscount,TId)values(getdate(),123,0,0.90,18)

go

--��9�������� OrderDetail
create table OrderDetail(
 ODId int	primary key identity(1,1),--����������	����������
 ODCount int default 1,--	�ǿ�	���㱾�����۸�
 OId Int references [Order](OId),--	��� Order(OId)	���Order���е�OId
 DishId	Int references Dish(DId),--	���Dish��DId��	���Dish���е�DId
 OIsdelete bit default 0,--�Ƿ�ɾ�� 0:false  1:true
)
go



insert into OrderDetail(OId,DishId)values(1,1)


--Ա���� Employee 
select * from Employee
select EName,EPwd,EType from Employee where EName='Сǿ'and EPwd='123456'
select EId'ID',EName'�˺�',EPwd'����','ְλ'=case(EType) when '0' then '����' when '1' then 'Ա��' end from Employee 
--delete from Employee where EId=2
--update Employee set EName='122122',EPwd='123456',EType=0 where EId=4
--��Ա�ȼ��� MemberType
select * from MemberType
select MTypeId,MTittle,MDiscount,MIsdelete from MemberType
select MTypeId'ID',MTittle'�ȼ�',MDiscount'�ۿ�','ɾ��'=case(MIsdelete) when '0' then '��' when '1' then '��' end from MemberType where MIsdelete=0
--update MemberType set MTittle='שʯ',MDiscount='0.99' where MTypeId=11
--update MemberType set MIsdelete='1' where MTypeId=12

--��Ա�� Member
select * from Member
select MId,MName,MPhone,MMoney,MIsdelete,MTypeId from Member
select MId'ID',MName'����',MPhone'�绰',MMoney'���',MTittle'�ȼ�','ɾ��'=case(m2.MIsdelete) when '0' then '��' when '1' then '��' end from MemberType m1,Member m2 where m1.MTypeId=m2.MTypeId 
select MId'ID',MName'����',MPhone'�绰',MMoney'���','ɾ��'=case(MIsdelete) when '0' then '��' when '1' then '��' end from Member where MName like '%��%'
select MId'ID',MName'����',MPhone'�绰',MMoney'���','ɾ��'=case(MIsdelete) when '0' then '��' when '1' then '��' end from Member where MPhone like '%1%'
--delete from Member where MId=100
--update Member set MName='dada',MPhone='121231321',MMoney=2222.33,MTypeId=12 where MId=104

--��Ʒ����� DishType
select * from DishType
select DTypeId'ID',DTittle'��Ʒ','ɾ��'=case(DIsdelete) when '0' then '��' when'1' then '��' end  from DishType where DIsdelete = 0
--update DishType set DIsdelete = 1 where DTypeId =106
--update DishType set DTittle ='����ǽ' where DTypeId=108
----��Ʒ�� Dish
select * from DishType
select * from Dish

select DId'ID',d2.DTittle'��Ʒ',d1.DTittle'��Ʒ���',DPrice'�۸�',DChar'����ĸ' from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId
select DId'ID',d2.DTittle'��Ʒ',d1.DTittle'��Ʒ���',DPrice'�۸�',DChar'����ĸ'  from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d2.DTittle like'%��%'
select DId'ID',d2.DTittle'��Ʒ',d1.DTittle'��Ʒ���',DPrice'�۸�',DChar'����ĸ'  from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d1.DTittle like'%��%'
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('����',123.66,'Z',105)
--update Dish set DTittle='��Ϻ',DPrice=123.66,DChar='D',DTypeId=101 where DId=6
--delete from Dish where DId=6

--��6������ Hall
select * from Hall
select HId'ID',HTittle'��������','�Ƿ�ɾ��'=case(HIsdelete) when '0' then '��' when '1' then '��' end from Hall where HIsdelete=0
--update Hall set HTittle='����' where HId=4
--insert into Hall(HTittle)values('�ٺ�')
--update Hall set HIsdelete=1 where HId=8

--������Ĳ��� HallTable
select * from Hall
select * from HallTable where HId=1
select TId'ID',TTittle'��������',TIsFree,TIsdelete,HId from HallTable
select TId,TTittle'��������' from Hall h1,HallTable h2 where h1.HId=h2.HId and h1.HId=1 and TIsFree =0

--select TId'ID',TTittle'��������',HTittle'����', '�Ƿ����'=case(TIsFree) when '0' then '����' when '1' then 'ʹ����' end  from Hall h1,HallTable h2 where h1.HId=h2.HId  and HTittle like'%��%'

select TId 'ID',TTittle '��������',HTittle '����',case(TIsFree) when 0 then '����' when 1 then 'ʹ����' end as '�Ƿ����' ,case(TIsdelete) when 0 then '��' when 1 then '��' end as '�Ƿ�ɾ��'  
from Hall h1,HallTable h2 where h1.HId=h2.HId  and TIsdelete = 0

select TId'ID','�Ƿ����'=case(TIsFree) when '0' then '����' when '1' then 'ʹ����' end  from HallTable
--update HallTable set TIsdelete=1 where TId=5
--update HallTable set TTittle = '�ٺٺ�',TIsFree=0,TIsdelete=0,HId=5 where TId=8



--��8�������� Order
select * from [Order]
select OId,ODate,OMoney,OIsPay,ODiscount,TId from [Order]

select OId from [Order] where TId=9

select DId'ID',d2.DTittle'��Ʒ',d1.DTittle'��Ʒ���',DPrice'�۸�',DChar'����ĸ' from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d2.DTittle like '%��%'
select DId'ID',d2.DTittle'��Ʒ',d1.DTittle'��Ʒ���',DPrice'�۸�',DChar'����ĸ' from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d1.DTittle like '%��%'


--��9�������� OrderDetail

select * from OrderDetail
select ODId,ODCount,OId,DishId from OrderDetail

insert OrderDetail(OId,DishId) values (1,1)

update OrderDetail set ODCount=2 where ODId =1

update OrderDetail set OIsdelete=1 where ODId =1

select ODId,DTittle,DPrice,ODCount,OIsdelete from Dish d1,OrderDetail o1 where o1.DishId=d1.DId and OIsdelete = 0





