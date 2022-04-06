drop table member;
drop table checking;
drop table menu;
drop table foodinfo;
drop table dignosis;

create table member(
seq number(10),
id varchar2(100),
pw varchar2(100) not null,
nick varchar2(100) not null,
constraint user_seq primary key(seq),
constraint id unique(id));

select * from member;
select * from checking;
create sequence user_seq
	start with 1
	increment by 1
	maxvalue 999999
	nocycle 
	nocache
	
create table checking(
id varchar2(10),
checkday date default sysdate,
weigth number(10) not null,
blood number(10) not null,
bsugar number(10) not null, 
heigth number(10) not null,
age number(10) not null,
act number(1) not null,
constraint checkdata_id_fk foreign key(id) references member(id)
);

create table menu(
id varchar2(10),
meal number(1),
dietday date default sysdate,
foodid varchar(10),
constraint menu_id_fk1 foreign key(id) references member(id),
constraint menu_foodid_fk2 foreign key(foodid) references foodinfo(foodid)
);

create table foodinfo(
foodid varchar2(10) ,
fname varchar2(10),
cal number(20),
pro number(20),
car number(20),
fat number(20),
sod number(20),
sug number(20),
vit number(20),
fday date default sysdate,
constraint foodinfo_id_pk primary key(foodid)
);

create table dignosis(
id varchar2(10),
nomal number(1),
ob number(1),
bs number(1),
bp number(1),
diaday date default sysdate,
constraint dignosis_id_fk foreign key(id) references member(id)
);
