drop table member;
drop table checking;
drop table menu;
drop table dignosis;
drop table food_rec;

select * from member;
select * from checking;
create sequence user_seq
	start with 1
	increment by 1
	maxvalue 999999
	nocycle 
	nocache
	
create table member(
seq number(10),
id varchar2(100),
pw varchar2(100) not null,
nick varchar2(100) not null,
constraint user_seq primary key(seq),
constraint id unique(id));
	
create table checking(
id varchar2(100),
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
id varchar2(100),
meal number(1),
dietday date default sysdate,
foodid varchar(10),
fname varchar(10),
cal number(20),
pro number(20),
car number(20),
fat number(20),
constraint menu_foodid primary key(foodid),
constraint menu_id_fk foreign key(id) references member(id)
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

select * from food_rec;

select * from food_rec order by cal desc;
select * from food_rec order by pro desc;
select * from food_rec order by car desc;
select * from food_rec order by fat desc;
select * from food_rec order by sug desc;



