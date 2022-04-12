drop table member;
drop table checking;
drop table menu;
drop table food_rec;
drop table board;
select * from board;
insert into board values(2,'안녕하세요','선생님');
select * from member;
select * from checking order by checkday;
insert into checking values('1','2022-01-11',110,120,110,175,29,2);
select * from MENU;
create sequence user_seq
	start with 1
	increment by 1
	maxvalue 999999
	nocycle 
	nocache
	select * from checking where id = '1' order by checkday ;
create table member(
seq number(10),
id varchar2(100),
pw varchar2(100) not null,
nick varchar2(100) not null,
constraint user_seq primary key(seq),
constraint id unique(id),
constraint nick unique(nick));
	
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
dietday varchar2(100),
fname varchar2 (100),
cal number(38),
pro number(38),
car number(38),
fat number(38),
constraint menu_id_fk foreign key(id) references member(id)
);

insert into MENU values('123',2,'2022년4월9일','과자',10.0,1.888,5.0,6.3);


create table food_rec(
fname varchar2(60),
cal number(38, 13),
pro number(38, 14),
car number(38, 15),
fat number(38, 15),
sug number(38, 16)
constraint food_rec_fname primary key(seq)
);
create table board(
	num number(20),
	title varchar2(100),
	data varchar2(4000)
);

CREATE SEQUENCE  num_seq
 START WITH  1
INCREMENT BY 1;


select * from food_rec;

select * from food_rec order by cal desc;
select * from food_rec order by pro desc;
select * from food_rec order by car desc;
select * from food_rec order by fat desc;
select * from food_rec order by sug desc;



