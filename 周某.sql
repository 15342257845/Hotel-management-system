use master
go
 -- 数据库名称：HotelManager
 if exists(select * from sysdatabases where name='HotelManager')
 drop database HotelManager
 go


 create database HotelManager
 go

 use HotelManager
 go

 --select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId = Dish.DTypeId where DishType.DTittle like '%汉菜%' and Dish.DTittle like '%%'
  --表1：员工表 Employee 
 create table Employee 
 (
    
--字段	类型	约束	备注
 EId	int primary key  identity(2017001,1) ,       --EId	int	主键、自增	员工编号
EName	Varchar(20)  not null  ,             --EName	Varchar(20)	非空	账号
EPwd	Varchar(32) not null,               --EPwd	Varchar(32)	非空	密码
EType	bit not null                        --EType	bit	非空	0：经理，1：员工
 )

 --插入数据
 insert into Employee(EName,EPwd,EType) values(11111,22222,0)
 insert into Employee(EName,EPwd,EType) values(11112,22223,1)
 insert into Employee(EName,EPwd,EType) values(11113,22224,1)
 insert into Employee(EName,EPwd,EType) values(11114,22225,1)
 insert into Employee(EName,EPwd,EType) values(11115,22226,1)
 select EId,EName,EType from Employee
 insert into Employee(EName,EPwd,EType) values(11115,22226,1)

 delete  from Employee where EId=2017002

  select EId'用户编号',EName'用户名',EPwd'密码','员工类型'=case(EType) when 0 then '经理' when 1 then '员工' end from Employee

  update Employee set EName=11121,EPwd=22229,EType=0 where EId=2017004
--表2：会员等级表 MemberType
create table MemberType
(
 --字段	类型	约束	备注
MTypeId	int primary key identity(1,1),	--主键、自增	会员等级编号
MTittle	Varchar(20)	,	--如钻石、黄金
MDiscount	Decimal(3,2) not null,	--	折扣：0.98
MIsdelete	bit,	--是否删除--0:false  1:true
)
select MTypeId from MemberType where MTittle='最强王者'
  update MemberType set MTittle='青铜',MDiscount=0.99 where MTypeId=2
  delete  from MemberType where MTypeId=1
 --插入数据
insert into MemberType(MTittle,MDiscount,MIsdelete) values('钻石',0.88,1)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('铂金',0.87,0)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('黄金',0.86,1)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('白银',0.85,0)
insert into MemberType(MTittle,MDiscount,MIsdelete) values('青铜',0.84,1)

select MTypeId,MTittle,MDiscount from MemberType

--select t1.MTittle from Member m1 inner join MemberType t1 on m1.MTypeId=t1.MTypeId where t1.MTittle='白银'
--表3：会员表 Member
create table Member
(
--字段	类型	约束	备注
MId	int	primary key identity(10001,1),        --3主键、自增	会员编号
MName	Varchar(20)	,	--会员姓名
MPhone	Varchar(11)	,	--电话
MMoney	Decimal(6,2),	--账户余额
MTypeId	int	references MemberType(MTypeId),       --外键MemberType(MTypeId)	外键会员等级表
MIsdelete	bit	 ,	--是否删除0:false  1:true
)
update Member set MMoney=MMoney+20 where MId=10001
select MId'编号',MName'姓名',MMoney'余额' from Member where MId=10001
--插入数据 
select MId'编号',MName'姓名',MPhone'手机号',MMoney'余额',mt1.MTittle'会员类型' from Member m1 inner join MemberType mt1 on m1.MTypeId=mt1.MTypeId
select MId,MName,MPhone,MMoney,MTypeId  from Member
select MId'编号',MName'姓名',MPhone'手机号',MMoney'余额'from Member where  MName like'%冯%' and MPhone like'%1357%'
 
 update Member set MName = '周某', MPhone = 454545242, MMoney =80, MTypeId = 1 where MId = 10002
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('周大哥',13556566656,20,1,0)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('刘大哥',13556586656,40,2,1)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('汤大哥',13556596656,600,3,0)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('陈小姐',13555447776,30,3,0)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('冯大哥',13556126656,900,1,1)
insert into Member(MName,MPhone,MMoney,MTypeId,MIsdelete) values('冯大哥',13575757576,900,1,1)

--表4：菜品分类表 DishType
create table DishType
(
--字段	类型	约束	备注
DTypeId	int primary key identity(301,1)	,--主键、自增	菜品类型编号
DTittle	Varchar(20)	,	 --菜品类别
DIsdelete	bit	 ,	--是否删除0:false  1:true

)
select DTypeId from DishType where DTittle='冰菜'

--update DishType set DTittle=qewqwe where DTypeId=102
select DTypeId,DTittle,DIsdelete from DishType
--插入数据
insert into DishType(DTittle,DIsdelete) values('川菜',0)
insert into DishType(DTittle,DIsdelete) values('汉菜',0)
insert into DishType(DTittle,DIsdelete) values('冰菜',1)

insert into DishType(DTittle,DIsdelete) values('q菜',0)
--select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId 
--select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId = Dish.DTypeId where Dish.DTittle like'%%' and Dish.DTypeId like'%%'
--delete  from DishType where DTypeId=106
--select Dish.DTypeId from Dish inner join DishType on Dish.DTypeId=DishType.DTypeId where DishType.DTittle like'%冰%'
--select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId
--表5：菜品表 Dish
create table Dish
(
--字段	类型	约束	备注
DId	int primary key identity(501,1),	--主键、自增	菜品编号
DTittle	Varchar(20)	,	--菜名称
DPrice	Decimal(5,2)	,	--价格
DChar	Varchar(10)	,	--首字母
DTypeId	int	references DishType(DTypeId),--外键DishType(DId)	外键DishType表的DId
DIsdelete	bit	,	--是否删除0:false  1:true
)
--插入数据
 select Dish.DTypeId from Dish inner join DishType on Dish.DTypeId = DishType.DTypeId where DishType.DTittle like'%%'
 select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId = Dish.DTypeId where DishType.DTittle like '%汉%' and Dish.DTittle like '%%'
 select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId 
  select DId'编号',DTittle'菜名',DPrice'价格',DChar'首字母',DTittle'菜品类别' from Dish

--插入数据

insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('鱼香肉丝',30,'Y',302,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('椒盐基围虾',54,'J',303,0)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('清炒牛肉',40,'N',301,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('油焖茄子',26,'Z',304,0)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('干锅刘家辉',30,'Y',302,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('基围虾',54,'J',303,0)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('油闷胡景伟',90,'N',304,1)
insert into Dish(DTittle,DPrice,DChar,DTypeId,DIsdelete) values('爆炒汤士林',86,'j',302,0)
--update Dish set DTittle = 'sanxiantang', DPrice = 12, DChar =q, DTypeId = "+ds.DTypeId+" where DId = "+ds.DId+"


--表6：餐厅 Hall
create table Hall
(

--字段	类型	约束	备注
HId	int	primary key identity(301,1),--主键、自增	厅编号
HTittle	Varchar(20)	,	--酒店厅名
HIsdelete	bit	,	--是否删除0:false  1:true
)
--update Hall set HTittle='llll' where HId='306'
--select HId,HTittle,HIsdelete from Hall where HIsdelete=0 


--select TTittle,TId from HallTable inner join Hall on Hall.HId=HallTable.HId   where Hall.HId=307

--select TTittle,TId from HallTable 

 

--插入数据
insert into Hall(HTittle,HIsdelete) values('春起',0)
insert into Hall(HTittle,HIsdelete) values('夏凉',0)
insert into Hall(HTittle,HIsdelete) values('秋收',0)
insert into Hall(HTittle,HIsdelete) values('冬至',0)
insert into Hall(HTittle,HIsdelete) values('寒末',0)
select HId,HTittle from Hall where HIsdelete=0
select HId'编号',HTittle'名称' from Hall where HIsdelete=0
--update Hall set HTittle='青铜' where HId=''
--update Hall set HIsdelete=0 where HId=306

--表7：餐厅里的餐桌 HallTable
create table HallTable
(
--字段	类型	约束	备注
TId	int	primary key identity(801,1),--主键、自增	餐桌编号
TTittle	Varchar(20),	--	餐桌名称
HId	int	 references Hall(HId),--外键Hall（HId）	外键Hall 表中HId
TIsFree	bit	not null,--非空	是否空闲0：空 闲1：非空闲
TIsdelete	bit	 ,	--是否删除0:false  1:true
)
select TId from HallTable where TTittle='*号桌'
select HId,HTittle,HIsdelete from Hall where HIsdelete=0
--插入数据 
select TId from HallTable where TTittle='8'
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('一号桌',301,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('二号桌',301,1,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('三号桌',301,0,1)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('四号桌',302,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('五号桌',302,1,1)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('6号桌',303,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('8号桌',303,1,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('7号桌',304,0,1)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('*号桌',304,0,0)
insert into HallTable(TTittle,HId,TIsFree,TIsdelete) values('9号桌',305,1,1)
--update HallTable set TTittle='"++"',HId="++",TIsFree="++" where TId="++"
--update HallTable set TIsdelete=1 where TId="++"
--select HId from HallTable inner join 
--select DId'编号',Dish.DTittle'菜名',DPrice'价格',DChar'首字母',DishType.DTittle'菜品类别' from Dish inner join DishType on DishType.DTypeId=Dish.DTypeId 
select TId'编号',TTittle'类型','是否空闲'=case(TIsFree) when 0 then '空闲' when 1 then '非空闲' end,HId'厅包' from HallTable where  HId like'%0%' and TIsFree like'%%'
--select TId'编号',TTittle'类型','是否空闲'=case(TIsFree) when 0 then '空闲' when 1 then '非空闲' end,HId'厅包' from HallTable where  HId like'%" + htl.HId+ "%'and TIsFree like'%" + htl.TIsFree + "%'
--select HId,HTittle,case(TIsFree) when 0 then '空闲'when 1 then '非空闲' end from Hall
select TId'编号',TTittle'类型','是否空闲'=case(TIsFree) when 0 then '空闲' when 1 then '非空闲' end,HId'厅包' from HallTable where  HId like '%0%' and TIsFree like '%%'
--表8：订单表 Order
create table [Order]
(

--字段	类型	约束	备注
OId	int	primary key identity(2017901,1),--主键、自增	订单编号
ODate	datetime 	,--默认当前时间	定单时间
OMoney	money not null,--	非空	订单价格
OIsPay	bit	 not null,--非空	订单是否支付--0：支付 1：未支付
TId	int	references HallTable(TId),--外键HallTable(TId)	外键HallTable表中的TId
ODiscount	Decimal(3,2)	--	一共3位数，小数点两位
)
--插入数据
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
--表9：订单表 OrderDetail
create table OrderDetail
(

--字段	类型	约束	备注
ODId	int	primary key identity(4001,1),--主键、自增	订单详情编号
OId	Int	references [Order](OId),--外键Order(OId)	外键Order表中的OId
DishId	Int references  Dish(DId),	--外键Dish（DId）	外键Dish表中的DId
ODCount	int	 ,--非空	计算本订单价格
)
select ODId,OId,DishId,ODCount from OrderDetail
--插入数据
insert into OrderDetail(OId,DishId,ODCount) values(2017901,501,5)
insert into OrderDetail(OId,DishId,ODCount) values(2017902,502,6)
insert into OrderDetail(OId,DishId,ODCount) values(2017903,503,4)
insert into OrderDetail(OId,DishId,ODCount) values(2017904,504,2)

----表3：会员表 Member
--create table Member
--(
----字段	类型	约束	备注
--MId	int	primary key identity(10001,1),        --3主键、自增	会员编号
--MName	Varchar(20)	,	--会员姓名
--MPhone	Varchar(11)	,	--电话
--MMoney	Decimal(6,2),	--账户余额
--MTypeId	int	references MemberType(MTypeId),       --外键MemberType(MTypeId)	外键会员等级表
--MIsdelete	bit	 ,	--是否删除0:false  1:true
--)


----联表查询
--select ODId,DTittle,ODCount,DPrice from Dish d1 inner join OrderDetail o1 on d1.DId=o1.DishId where OId=2017903

----多模糊查询
--select TId'编号',TTittle'类型','是否空闲'=case(TIsFree) when 0 then '空闲' when 1 then '非空闲' end,HId'厅包' from HallTable where  HId like'%0%' and TIsFree like'%%'

----修改语句
-- update Member set MName = '爆炒汤士林', MPhone = 454545242, MMoney =80, MTypeId = 1 where MId = 10002



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