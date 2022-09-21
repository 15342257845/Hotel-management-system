use master
go
 -- ���ݿ����ƣ�HotelManager
 if exists(select * from sysdatabases where name='HotelManager')
 drop database HotelManager
 go


 create database HotelManager
 go

 use HotelManager
 go

 --select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId = Dish.DTypeId where DishType.DTittle like '%����%' and Dish.DTittle like '%%'
  --��1��Ա���� Employee 
 create table Employee 
 (
    
--�ֶ�	����	Լ��	��ע
 EId	int primary key  identity(2017001,1) ,       --EId	int	����������	Ա�����
EName	Varchar(20)  not null  ,             --EName	Varchar(20)	�ǿ�	�˺�
EPwd	Varchar(32) not null,               --EPwd	Varchar(32)	�ǿ�	����
EType	bit not null                        --EType	bit	�ǿ�	0������1��Ա��
 )

 --��������
 insert into Employee(EName,EPwd,EType) values(11111,22222,0)
 insert into Employee(EName,EPwd,EType) values(11112,22223,1)
 insert into Employee(EName,EPwd,EType) values(11113,22224,1)
 insert into Employee(EName,EPwd,EType) values(11114,22225,1)
 insert into Employee(EName,EPwd,EType) values(11115,22226,1)
 select EId,EName,EType from Employee
 insert into Employee(EName,EPwd,EType) values(11115,22226,1)

 delete  from Employee where EId=2017002

  select EId'�û����',EName'�û���',EPwd'����','Ա������'=case(EType) when 0 then '����' when 1 then 'Ա��' end from Employee

  update Employee set EName=11121,EPwd=22229,EType=0 where EId=2017004
--��2����Ա�ȼ��� MemberType
create table MemberType
(
 --�ֶ�	����	Լ��	��ע
MTypeId	int primary key identity(1,1),	--����������	��Ա�ȼ����
MTittle	Varchar(20)	,	--����ʯ���ƽ�
MDiscount	Decimal(3,2) not null,	--	�ۿۣ�0.98
MIsdelete	bit,	--�Ƿ�ɾ��--0:false  1:true
)
select MTypeId from MemberType where MTittle='��ǿ����'
  update MemberType set MTittle='��ͭ',MDiscount=0.99 where MTypeId=2
  delete  from MemberType where MTypeId=1
 --��������
insert into MemberType(MTittle,MDiscount,MIsdelete) values('��ʯ',0.88,1)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('����',0.87,0)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('�ƽ�',0.86,1)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('����',0.85,0)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('��ͭ',0.84,1)

select MTypeId,MTittle,MDiscount from MemberType

--select t1.MTittle from Member m1 inner join MemberType t1 on m1.MTypeId=t1.MTypeId where t1.MTittle='����'
--��3����Ա�� Member
create table Member
(
--�ֶ�	����	Լ��	��ע
MId	int	primary key identity(10001,1),        --3����������	��Ա���
MName	Varchar(20)	,	--��Ա����
MPhone	Varchar(11)	,	--�绰
MMoney	Decimal(6,2),	--�˻����
MTypeId	int	references MemberType(MTypeId),       --���MemberType(MTypeId)	�����Ա�ȼ���
MIsdelete	bit	 ,	--�Ƿ�ɾ��0:false  1:true
)
update Member set MMoney=MMoney+20 where MId=10001
select MId'���',MName'����',MMoney'���' from Member where MId=10001
--�������� 
select MId'���',MName'����',MPhone'�ֻ���',MMoney'���',mt1.MTittle'��Ա����' from Member m1 inner join MemberType mt1 on m1.MTypeId=mt1.MTypeId
select MId,MName,MPhone,MMoney,MTypeId  from Member
select MId'���',MName'����',MPhone'�ֻ���',MMoney'���'from Member where  MName like'%��%' and MPhone like'%1357%'
 
 update Member set MName = '��ĳ', MPhone = 454545242, MMoney =80, MTypeId = 1 where MId = 10002
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('�ܴ��',13556566656,20,1,0)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('�����',13556586656,40,2,1)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('�����',13556596656,600,3,0)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('��С��',13555447776,30,3,0)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('����',13556126656,900,1,1)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('����',13575757576,900,1,1)

--��4����Ʒ����� DishType
create table DishType
(
--�ֶ�	����	Լ��	��ע
DTypeId	int primary key identity(301,1)	,--����������	��Ʒ���ͱ��
DTittle	Varchar(20)	,	 --��Ʒ���
DIsdelete	bit	 ,	--�Ƿ�ɾ��0:false  1:true

)
select DTypeId from DishType where DTittle='����'

--update DishType set DTittle=qewqwe where DTypeId=102
select DTypeId,DTittle,DIsdelete from DishType
--��������
insert into DishType(DTittle,DIsdelete) values('����',0)
insert into DishType(DTittle,DIsdelete) values('����',0)
insert into DishType(DTittle,DIsdelete) values('����',1)

insert into DishType(DTittle,DIsdelete) values('q��',0)
--select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId 
--select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId = Dish.DTypeId where Dish.DTittle like'%%' and Dish.DTypeId like'%%'
--delete  from DishType where DTypeId=106
--select Dish.DTypeId from Dish inner join DishType on Dish.DTypeId=DishType.DTypeId where DishType.DTittle like'%��%'
--select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId
--��5����Ʒ�� Dish
create table Dish
(
--�ֶ�	����	Լ��	��ע
DId	int primary key identity(501,1),	--����������	��Ʒ���
DTittle	Varchar(20)	,	--������
DPrice	Decimal(5,2)	,	--�۸�
DChar	Varchar(10)	,	--����ĸ
DTypeId	int	references DishType(DTypeId),--���DishType(DId)	���DishType���DId
DIsdelete	bit	,	--�Ƿ�ɾ��0:false  1:true
)
--��������
 select Dish.DTypeId from Dish inner join DishType on Dish.DTypeId = DishType.DTypeId where DishType.DTittle like'%%'
 select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId = Dish.DTypeId where DishType.DTittle like '%��%' and Dish.DTittle like '%%'
 select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId 
  select DId'���',DTittle'����',DPrice'�۸�',DChar'����ĸ',DTittle'��Ʒ���' from Dish

--��������

insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('������˿',30,'Y',302,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('���λ�ΧϺ',54,'J',303,0)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('�峴ţ��',40,'N',301,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('��������',26,'Z',304,0)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('�ɹ����һ�',30,'Y',302,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('��ΧϺ',54,'J',303,0)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('���ƺ���ΰ',90,'N',304,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('������ʿ��',86,'j',302,0)
--update Dish set DTittle = 'sanxiantang', DPrice = 12, DChar =q, DTypeId = "+ds.DTypeId+" where DId = "+ds.DId+"


--��6������ Hall
create table Hall
(

--�ֶ�	����	Լ��	��ע
HId	int	primary key identity(301,1),--����������	�����
HTittle	Varchar(20)	,	--�Ƶ�����
HIsdelete	bit	,	--�Ƿ�ɾ��0:false  1:true
)
--update Hall set HTittle='llll' where HId='306'
--select HId,HTittle,HIsdelete from Hall where HIsdelete=0 


--select TTittle,TId from HallTable inner join Hall on Hall.HId=HallTable.HId   where Hall.HId=307

--select TTittle,TId from HallTable 

 

--��������
insert into Hall(HTittle,HIsdelete) values('����',0)
insert into Hall(HTittle,HIsdelete) values('����',0)
insert into Hall(HTittle,HIsdelete) values('����',0)
insert into Hall(HTittle,HIsdelete) values('����',0)
insert into Hall(HTittle,HIsdelete) values('��ĩ',0)
select HId,HTittle from Hall where HIsdelete=0
select HId'���',HTittle'����' from Hall where HIsdelete=0
--update Hall set HTittle='��ͭ' where HId=''
--update Hall set HIsdelete=0 where HId=306

--��7��������Ĳ��� HallTable
create table HallTable
(
--�ֶ�	����	Լ��	��ע
TId	int	primary key identity(801,1),--����������	�������
TTittle	Varchar(20),	--	��������
HId	int	 references Hall(HId),--���Hall��HId��	���Hall ����HId
TIsFree	bit	not null,--�ǿ�	�Ƿ����0���� ��1���ǿ���
TIsdelete	bit	 ,	--�Ƿ�ɾ��0:false  1:true
)
select TId from HallTable where TTittle='*����'
select HId,HTittle,HIsdelete from Hall where HIsdelete=0
--�������� 
select TId from HallTable where TTittle='8'
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('һ����',301,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('������',301,1,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('������',301,0,1)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('�ĺ���',302,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('�����',302,1,1)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('6����',303,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('8����',303,1,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('7����',304,0,1)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('*����',304,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('9����',305,1,1)
--update HallTable set TTittle='"++"',HId="++",TIsFree="++" where TId="++"
--update HallTable set TIsdelete=1 where TId="++"
--select HId from HallTable inner join 
--select DId'���',Dish.DTittle'����',DPrice'�۸�',DChar'����ĸ',DishType.DTittle'��Ʒ���' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId 
select TId'���',TTittle'����','�Ƿ����'=case(TIsFree) when 0 then '����' when 1 then '�ǿ���' end,HId'����' from HallTable where  HId like'%0%' and TIsFree like'%%'
--select TId'���',TTittle'����','�Ƿ����'=case(TIsFree) when 0 then '����' when 1 then '�ǿ���' end,HId'����' from HallTable where  HId like'%" + htl.HId+ "%'and TIsFree like'%" + htl.TIsFree + "%'
--select HId,HTittle,case(TIsFree) when 0 then '����'when 1 then '�ǿ���' end from Hall
select TId'���',TTittle'����','�Ƿ����'=case(TIsFree) when 0 then '����' when 1 then '�ǿ���' end,HId'����' from HallTable where  HId like '%0%' and TIsFree like '%%'
--��8�������� Order
create table [Order]
(

--�ֶ�	����	Լ��	��ע
OId	int	primary key identity(2017901,1),--����������	�������
ODate	datetime 	,--Ĭ�ϵ�ǰʱ��	����ʱ��
OMoney	money not null,--	�ǿ�	�����۸�
OIsPay	bit	 not null,--�ǿ�	�����Ƿ�֧��--0��֧�� 1��δ֧��
TId	int	references HallTable(TId),--���HallTable(TId)	���HallTable���е�TId
ODiscount	Decimal(3,2)	--	һ��3λ����С������λ
)
--��������
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),444,0,801,0.97)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),894,1,802,0.88)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),744,0,803,0.7)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),1231,1,804,0.9)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),666,0,805,0.87)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),444,0,806,0.97)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),894,1,807,0.88)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),744,0,808,0.7)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),1231,1,809,0.9)
insert into [Order](ODate,OMoney,OIsPay,TId,ODiscount) values(GetDate(),666,0,810,0.87)




select HId,HTittle from Hall

select OId from [Order] where TId=802
--��9�������� OrderDetail
create table OrderDetail
(

--�ֶ�	����	Լ��	��ע
ODId	int	primary key identity(4001,1),--����������	����������
OId	Int	references [Order](OId),--���Order(OId)	���Order���е�OId
DishId	Int references  Dish(DId),	--���Dish��DId��	���Dish���е�DId
ODCount	int	 ,--�ǿ�	���㱾�����۸�
)
select ODId,OId,DishId,ODCount from OrderDetail
--��������
insert into OrderDetail(OId,DishId,ODCount) values(2017901,501,5)
insert into OrderDetail(OId,DishId,ODCount) values(2017902,502,6)
insert into OrderDetail(OId,DishId,ODCount) values(2017903,503,4)
insert into OrderDetail(OId,DishId,ODCount) values(2017904,504,2)

----��3����Ա�� Member
--create table Member
--(
----�ֶ�	����	Լ��	��ע
--MId	int	primary key identity(10001,1),        --3����������	��Ա���
--MName	Varchar(20)	,	--��Ա����
--MPhone	Varchar(11)	,	--�绰
--MMoney	Decimal(6,2),	--�˻����
--MTypeId	int	references MemberType(MTypeId),       --���MemberType(MTypeId)	�����Ա�ȼ���
--MIsdelete	bit	 ,	--�Ƿ�ɾ��0:false  1:true
--)


----�����ѯ
--select ODId,DTittle,ODCount,DPrice from Dish d1 inner join OrderDetail o1 on d1.DId=o1.DishId where OId=2017903

----��ģ����ѯ
--select TId'���',TTittle'����','�Ƿ����'=case(TIsFree) when 0 then '����' when 1 then '�ǿ���' end,HId'����' from HallTable where  HId like'%0%' and TIsFree like'%%'

----�޸����
-- update Member set MName = '������ʿ��', MPhone = 454545242, MMoney =80, MTypeId = 1 where MId = 10002



delete  from OrderDetail where ODId=4006

select * from Employee
select * from MemberType
select * from Member


select * from DishType
select * from DishType where DIsdelete=0

--update OrderDetail set ODCount=2 where OId=2017903

select * from Dish





select * from Hall
select * from HallTable
select * from [Order]
select * from OrderDetail