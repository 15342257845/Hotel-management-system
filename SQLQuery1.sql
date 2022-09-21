use master
go

if exists(select * from sysdatabases where name='HotelManager')
drop database HotelManager
go

create database HotelManager 
go

use HotelManager
go

--表1：员工表 Employee 
create table Employee(
 EId int primary key identity(1,1),--主键、自增	员工编号
 EName varchar(20) not null,--非空	账号
 EPwd varchar(32) not null,--非空	密码
 EType bit not null,--非空	0：经理，1：员工
)
go

insert into Employee(EName,EPwd,EType) values('小强','123456',0)
insert into Employee(EName,EPwd,EType) values('小红','123457',1)
insert into Employee(EName,EPwd,EType) values('小绿','123458',1)
insert into Employee(EName,EPwd,EType) values('小蓝','123459',1)
insert into Employee(EName,EPwd,EType) values('小紫','1234510',1)
go

--表2：会员等级表 MemberType
create table MemberType(
 MTypeId int primary key identity(10,1),--主键、自增	会员等级编号
 MTittle varchar(20),--如钻石、黄金
 MDiscount decimal(3,2) not null,--非空	折扣：0.98
 MIsdelete	bit default 0,--是否删除0:false  1:true
)
go

insert into MemberType(MTittle,MDiscount)values('砖石',0.77)
insert into MemberType(MTittle,MDiscount)values('黄金',0.87)
insert into MemberType(MTittle,MDiscount)values('白银',0.90)
insert into MemberType(MTittle,MDiscount)values('青铜',0.95)
insert into MemberType(MTittle,MDiscount)values('黑铁铁',0.98)
go

--表3：会员表 Member
create table Member(
 MId int primary key identity(100,1),--主键、自增	会员编号
 MName varchar(20),--会员姓名
 MPhone	Varchar(11),--电话
 MMoney	Decimal(6,2),--账户余额
 MIsdelete	bit default 0,--是否删除0:false  1:true
 MTypeId int references MemberType(MTypeId),--外键MemberType(MTypeId)	外键会员等级表
)
go
insert into Member(MName,MPhone,MMoney,MTypeId)values ('张总',12345678900,1234.99,10)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('刘总',12345678901,1874.99,11)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('黄总',12345678902,1634.99,12)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('飞总',12345678903,1894.99,13)
insert into Member(MName,MPhone,MMoney,MTypeId)values ('胡总',12345678904,1234.99,14)
go

--表4：菜品分类表 DishType
create table DishType(
 DTypeId	int primary key identity(101,1),	--主键、自增	菜品类型编号
 DTittle	Varchar(20),-- 菜品类别
 DIsdelete	bit default 0,		--是否删除0:false  1:true
)
go
insert into DishType(DTittle)values('川菜')
insert into DishType(DTittle)values('粤菜')
insert into DishType(DTittle)values('长沙菜')
insert into DishType(DTittle)values('武汉菜')
insert into DishType(DTittle)values('杭帮菜')
go

--表5：菜品表 Dish
create table Dish(
 DId	int primary key identity(1,1),	--主键、自增	菜品编号
 DTittle	Varchar(20),--		菜名称
 DPrice	Decimal(5,2),--		价格
 DChar	Varchar(10),--		首字母
 DIsdelete	bit default 0,		--是否删除0:false  1:true
 DTypeId	int references DishType(DTypeId),--  外键DishType(DTypeId)

)
go

insert into Dish(DTittle,DPrice,DChar,DTypeId)values('火锅',123.66,'H',101)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('红烧肉',123.66,'H',102)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('臭豆腐',123.66,'C',103)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('热干面',123.66,'R',104)
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('肘子',123.66,'Z',105)
go

--表6：餐厅 Hall
create table Hall(
 HId	int primary key identity(1,1),	--主键、自增	厅编号
 HTittle	Varchar(20),--		酒店厅名
 HIsdelete	bit default 0,--		是否删除0:false  1:true
)
go

insert into Hall(HTittle)values('雅园')
insert into Hall(HTittle)values('云厅')
insert into Hall(HTittle)values('风馆')
insert into Hall(HTittle)values('树哒哒哒')
insert into Hall(HTittle)values('嘿嘿')
go

--表7：餐厅里的餐桌 HallTable
create table HallTable(
 TId	int primary key identity(1,1),--	主键、自增	餐桌编号
 TTittle Varchar(20),--		餐桌名称
 TIsFree bit default 0,--非空	是否空闲0：空 闲1：非空闲
 TIsdelete bit default 0,--是否删除 0:false  1:true
 HId int references Hall(HId), 	--外键 Hall（HId）	外键Hall 表中HId
)
go

insert into HallTable(TTittle,HId)values('雅桌',1)
insert into HallTable(TTittle,HId)values('大桌子',1)
insert into HallTable(TTittle,HId)values('小桌子',1)
insert into HallTable(TTittle,HId)values('云桌',2)
insert into HallTable(TTittle,HId)values('大桌子',2)
insert into HallTable(TTittle,HId)values('小桌子',2)
insert into HallTable(TTittle,HId)values('风桌',3)
insert into HallTable(TTittle,HId)values('大桌子',3)
insert into HallTable(TTittle,HId)values('小桌子',3)
insert into HallTable(TTittle,HId)values('树桌',4)
insert into HallTable(TTittle,HId)values('大桌子',4)
insert into HallTable(TTittle,HId)values('小桌子',4)
insert into HallTable(TTittle,HId)values('嘿桌',5)
insert into HallTable(TTittle,HId)values('大桌子',5)
insert into HallTable(TTittle,HId)values('小桌子',5)
insert into HallTable(TTittle,TIsFree,HId)values('妞妞',1,3)
insert into HallTable(TTittle,TIsFree,HId)values('哈哈',1,4)
insert into HallTable(TTittle,TIsFree,HId)values('咯咯',1,5)
go

--表8：订单表 Order
create table [Order](
 OId int primary key identity(1,1),--	主键、自增	订单编号
 ODate datetime,--	默认当前时间	定单时间
 OMoney	float default 0,--	非空	订单价格
 OIsPay	bit not null,--	非空	订单是否支付0：支付 1：未支付
 ODiscount	Decimal(3,2),--一共3位数，小数点两位
 TId int references HallTable(TId),--外键HallTable(TId)	外键HallTable表中的TId
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

--表9：订单表 OrderDetail
create table OrderDetail(
 ODId int	primary key identity(1,1),--主键、自增	订单详情编号
 ODCount int default 1,--	非空	计算本订单价格
 OId Int references [Order](OId),--	外键 Order(OId)	外键Order表中的OId
 DishId	Int references Dish(DId),--	外键Dish（DId）	外键Dish表中的DId
 OIsdelete bit default 0,--是否删除 0:false  1:true
)
go



insert into OrderDetail(OId,DishId)values(1,1)


--员工表 Employee 
select * from Employee
select EName,EPwd,EType from Employee where EName='小强'and EPwd='123456'
select EId'ID',EName'账号',EPwd'密码','职位'=case(EType) when '0' then '经理' when '1' then '员工' end from Employee 
--delete from Employee where EId=2
--update Employee set EName='122122',EPwd='123456',EType=0 where EId=4
--会员等级表 MemberType
select * from MemberType
select MTypeId,MTittle,MDiscount,MIsdelete from MemberType
select MTypeId'ID',MTittle'等级',MDiscount'折扣','删除'=case(MIsdelete) when '0' then '否' when '1' then '是' end from MemberType where MIsdelete=0
--update MemberType set MTittle='砖石',MDiscount='0.99' where MTypeId=11
--update MemberType set MIsdelete='1' where MTypeId=12

--会员表 Member
select * from Member
select MId,MName,MPhone,MMoney,MIsdelete,MTypeId from Member
select MId'ID',MName'姓名',MPhone'电话',MMoney'余额',MTittle'等级','删除'=case(m2.MIsdelete) when '0' then '否' when '1' then '是' end from MemberType m1,Member m2 where m1.MTypeId=m2.MTypeId 
select MId'ID',MName'姓名',MPhone'电话',MMoney'余额','删除'=case(MIsdelete) when '0' then '否' when '1' then '是' end from Member where MName like '%张%'
select MId'ID',MName'姓名',MPhone'电话',MMoney'余额','删除'=case(MIsdelete) when '0' then '否' when '1' then '是' end from Member where MPhone like '%1%'
--delete from Member where MId=100
--update Member set MName='dada',MPhone='121231321',MMoney=2222.33,MTypeId=12 where MId=104

--菜品分类表 DishType
select * from DishType
select DTypeId'ID',DTittle'菜品','删除'=case(DIsdelete) when '0' then '否' when'1' then '是' end  from DishType where DIsdelete = 0
--update DishType set DIsdelete = 1 where DTypeId =106
--update DishType set DTittle ='佛跳墙' where DTypeId=108
----菜品表 Dish
select * from DishType
select * from Dish

select DId'ID',d2.DTittle'菜品',d1.DTittle'菜品类别',DPrice'价格',DChar'首字母' from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId
select DId'ID',d2.DTittle'菜品',d1.DTittle'菜品类别',DPrice'价格',DChar'首字母'  from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d2.DTittle like'%臭%'
select DId'ID',d2.DTittle'菜品',d1.DTittle'菜品类别',DPrice'价格',DChar'首字母'  from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d1.DTittle like'%川%'
insert into Dish(DTittle,DPrice,DChar,DTypeId)values('肘子',123.66,'Z',105)
--update Dish set DTittle='大虾',DPrice=123.66,DChar='D',DTypeId=101 where DId=6
--delete from Dish where DId=6

--表6：餐厅 Hall
select * from Hall
select HId'ID',HTittle'餐厅名称','是否删除'=case(HIsdelete) when '0' then '否' when '1' then '是' end from Hall where HIsdelete=0
--update Hall set HTittle='树宁' where HId=4
--insert into Hall(HTittle)values('嘿嘿')
--update Hall set HIsdelete=1 where HId=8

--餐厅里的餐桌 HallTable
select * from Hall
select * from HallTable where HId=1
select TId'ID',TTittle'餐桌名称',TIsFree,TIsdelete,HId from HallTable
select TId,TTittle'餐桌名称' from Hall h1,HallTable h2 where h1.HId=h2.HId and h1.HId=1 and TIsFree =0

--select TId'ID',TTittle'餐桌名称',HTittle'厅包', '是否空闲'=case(TIsFree) when '0' then '空闲' when '1' then '使用中' end  from Hall h1,HallTable h2 where h1.HId=h2.HId  and HTittle like'%雅%'

select TId 'ID',TTittle '餐桌名称',HTittle '厅包',case(TIsFree) when 0 then '空闲' when 1 then '使用中' end as '是否空闲' ,case(TIsdelete) when 0 then '否' when 1 then '是' end as '是否删除'  
from Hall h1,HallTable h2 where h1.HId=h2.HId  and TIsdelete = 0

select TId'ID','是否空闲'=case(TIsFree) when '0' then '空闲' when '1' then '使用中' end  from HallTable
--update HallTable set TIsdelete=1 where TId=5
--update HallTable set TTittle = '嘿嘿嘿',TIsFree=0,TIsdelete=0,HId=5 where TId=8



--表8：订单表 Order
select * from [Order]
select OId,ODate,OMoney,OIsPay,ODiscount,TId from [Order]

select OId from [Order] where TId=9

select DId'ID',d2.DTittle'菜品',d1.DTittle'菜品类别',DPrice'价格',DChar'首字母' from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d2.DTittle like '%火%'
select DId'ID',d2.DTittle'菜品',d1.DTittle'菜品类别',DPrice'价格',DChar'首字母' from DishType d1,Dish d2 where d1.DTypeId=d2.DTypeId and d1.DTittle like '%川%'


--表9：订单表 OrderDetail

select * from OrderDetail
select ODId,ODCount,OId,DishId from OrderDetail

insert OrderDetail(OId,DishId) values (1,1)

update OrderDetail set ODCount=2 where ODId =1

update OrderDetail set OIsdelete=1 where ODId =1

select ODId,DTittle,DPrice,ODCount,OIsdelete from Dish d1,OrderDetail o1 where o1.DishId=d1.DId and OIsdelete = 0





