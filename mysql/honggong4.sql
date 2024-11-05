use market_db;

create table hongong1(
	toy_id int,
    toy_name char(4),
    age int
);

select * from hongong1;

insert into hongong1 values(1, '우디', 25);

insert into hongong1(toy_id, toy_name) values(2, '버즈');

insert into hongong1(toy_name, age, toy_id) values('제시', 20, 3);


create table hongong2(
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);


drop table hongong2;

select * from hongong2;

insert into hongong2(toy_name, age) values('보핍', 25);
insert into hongong2(toy_name, age) values('슬링키', 22);
insert into hongong2(toy_name, age) values('렉스', 21);

delete from hongong2 where toy_id = 1;

alter table hongong2 auto_increment=100;

insert into hongong2(toy_name, age) values('재남', 35);


create table hongong3(
	toy_id int auto_increment primary key,
    toy_name char(4),
    age int);

    
alter table hongong3 auto_increment=1000;
set @@auto_increment_increment = 3;

show global variables;


select @@auto_increment_increment;

select * from hongong3;

select count(*) from world.

insert into hongong3(toy_name, age) values('토마스', 20);
insert into hongong3(toy_name, age) values('제임스', 23);
insert into hongong3(toy_name, age) values('고든', 23);

select * from city_popul where city_name='Seoul';

update city_popul
set city_name = '서울'
where city_name='Seoul';

select * from city_popul where city_name = '서울';

update city_popul
set city_name = '뉴욕', population = 0
where city_name='New York';

select * from city_popul where city_name = '뉴욕';

