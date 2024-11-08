drop database if exists naver_db;
create database naver_db;

use naver_db;
drop table if exists member;
create table member -- 회원 테이블
(
	mem_id     char(8),      -- 회원 아이디(PK)
	mem_name   varchar(10),  -- 이름
    mem_number tinyint,      -- 인원수
    addr       char(2),      -- 주소(경기, 서울, 경남 식으로 2글자만 입력)
    phone1     char(3),      -- 연락처의 국번(02, 031, 055 등)
    phone2     char(8),      -- 연락처의 나머지 전화번호(하이픈 제외)
    height     tinyint unsigned,  -- 평균 키
    debut_date date          -- 데뷔일자
);



drop table if exists member;
create table member -- 회원 테이블
(
	mem_id     char(8) not null,      -- 회원 아이디(PK)
	mem_name   varchar(10) not null,  -- 이름
    mem_number tinyint not null,      -- 인원수
    addr       char(2) not null,      -- 주소(경기, 서울, 경남 식으로 2글자만 입력)
    phone1     char(3) null,      -- 연락처의 국번(02, 031, 055 등)
    phone2     char(8) null,      -- 연락처의 나머지 전화번호(하이픈 제외)
    height     tinyint unsigned null,  -- 평균 키
    debut_date date    null      -- 데뷔일자
);



drop table if exists member;
create table member -- 회원 테이블
(
	mem_id     char(8) not null primary key,      -- 회원 아이디(PK)
	mem_name   varchar(10) not null,  -- 이름
    mem_number tinyint not null,      -- 인원수
    addr       char(2) not null,      -- 주소(경기, 서울, 경남 식으로 2글자만 입력)
    phone1     char(3) null,      -- 연락처의 국번(02, 031, 055 등)
    phone2     char(8) null,      -- 연락처의 나머지 전화번호(하이픈 제외)
    height     tinyint unsigned null,  -- 평균 키
    debut_date date    null      -- 데뷔일자
);




drop table if exists buy;   -- 기존에 있으면 삭제
create table buy -- 구매 테이블
(
	num        int auto_increment not null primary key,  -- 순번(PK)
	mem_id     char(8) not null,      -- 아이디(PK)
	prod_name  char(6) not null,      -- 제품 이름
    group_name char(4) null,      -- 분류
    price      int unsigned not null,      -- 가격
    amount     smallint unsigned not null     -- 수량
);



drop table if exists buy;   -- 기존에 있으면 삭제
create table buy -- 구매 테이블
(
	num        int auto_increment not null primary key,  -- 순번(PK)
	mem_id     char(8) not null,      -- 아이디(PK)
	prod_name  char(6) not null,      -- 제품 이름
    group_name char(4) null,      -- 분류
    price      int unsigned not null,      -- 가격
    amount     smallint unsigned not null,     -- 수량
    foreign key(mem_id) references member(mem_id)
);



insert into member 
values('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');
insert into member 
values('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-8-8');
insert into member 
values('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015-1-15');



insert into buy values(null, 'BLK', '지갑', null, 30, 2);
insert into buy values(null, 'BLK', '맥북프로', '디지털', 1000, 1);
insert into buy values(null, 'APN', '아이폰', '디지털', 200, 1);





use naver_db;
drop table if exists buy, member;
create table member
(
	mem_id   char(8) not null primary key,
    mem_name varchar(10) not null,
    height   tinyint  unsigned null
);


describe member;

drop table if exists member;
create table member
(
	mem_id   char(8) not null,
    mem_name varchar(10) not null,
    height   tinyint  unsigned null,
    primary key (mem_id)
);


drop table if exists member;
create table member
(
	mem_id   char(8) not null,
    mem_name varchar(10) not null,
    height   tinyint  unsigned null
);
alter table member
	add constraint
    primary key (mem_id);
    
    
    
drop table if exists buy, member;
create table member
(
	mem_id   char(8) not null  primary key,
    mem_name varchar(10) not null,
    height   tinyint  unsigned null
);
create table buy
(
	num        int auto_increment not null primary key,
    mem_id     char(8) not null,
    prod_name  char(6) not null,
    foreign key(mem_id) references member(mem_id)
);
    

drop table if exists buy;
create table buy
(
	num       int auto_increment not null primary key,
    mem_id    char(8) not null,
    prod_name char(6) not null
);
alter table buy
	add constraint
    foreign key(mem_id)
    references member(mem_id);
    
    
    
insert into member values('BLK', '블랙핑크', 163);
insert into buy values(null, 'BLK', '지갑');
insert into buy values(null, 'BLK', '맥북');


select M.mem_id, M.mem_name, B.prod_name
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;


update member set mem_id = 'PINK' where mem_id='BLK';

delete from member where mem_id = 'BLK';



drop table if exists buy;
create table buy
(
	num        int auto_increment not null primary key,
    mem_id     char(8) not null,
    prod_name  char(6) not null
);
alter table buy
	add constraint
    foreign key(mem_id) references member(mem_id)
    on update cascade
    on delete cascade;
    
    
insert into buy values(null, 'BLK', '지갑');
insert into buy values(null, 'BLK', '맥북');
    
    
update member set mem_id = 'PINK' where mem_id = 'BLK';    


select M.mem_id, M.mem_name, B.prod_name
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;
        
delete from member where mem_id = 'PINK';

select * from buy;
    

drop table if exists buy, member;
create table member
(
	mem_id     char(8) not null primary key,
    mem_name   varchar(10) not null,
    height     tinyint unsigned null,
    email      char(30) null unique
);


insert into member values('BLK', '블랙핑크', 163, 'pink@gmail.com');
insert into member values('TWC', '트와이스', 167, null);
insert into member values('APN', '에이핑크', 164, 'pink@gmail.com');


drop table if exists member;
create table member
(
	mem_id   char(8) not null primary key,
    mem_name varchar(10) not null,
    height   tinyint unsigned null check (height >= 100),
    phone1   char(3) null
);



insert into member values('BLK', '블랙핑크', 163, null);
insert into member values('TWC', '트와이스', 99, null);


alter table member
	add constraint
    check (phone1 in ('02', '031', '032', '054', '055', '061' )) ;
    

insert into member values('TWC', '트와이스', 167, '02');
insert into member values('OMY', '오마이걸', 167, '010');


drop table if exists member;
create table member
(
	mem_id   char(8) not null primary key,
    mem_name varchar(10) not null,
    height   tinyint unsigned null default 160,
    phone1   char(3) null
);



alter table member
	alter column phone1 set default '02';
    
    
insert into member values('RED', '레드벨벳', 161, '054');
insert into member values('SPC', '우주소녀', default, default);
select * from member;



use market_db;
create view v_member
as
		select mem_id, mem_name, addr from member;
        


select * from v_member;


select mem_name, addr from v_member
	where addr in ('서울', '경기');
    
create view v_memberbuy
as
select B.mem_id, M.mem_name, B.prod_name, M.addr,
		concat(m.phone1, M.phone2) '연락처'
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;


SELECT * FROM v_memberbuy WHERE mem_name = '블랙핑크';


USE market_db;

-- 뷰 생성
CREATE VIEW v_viewtest1 AS
SELECT 
    B.mem_id AS 'Member ID', 
    M.mem_name AS 'Member Name',
    B.prod_name AS "Product Name",
    CONCAT(M.phone1, M.phone2) AS "Office Phone"
FROM buy B
INNER JOIN member M ON B.mem_id = M.mem_id;

-- v_viewtest1 뷰에서 Member ID와 Member Name의 고유 값 추출
SELECT DISTINCT `Member ID`, `Member Name` FROM v_viewtest1;


alter view v_viewtest1
as
	select B.mem_id '회원 아이디', M.mem_name AS '회원 이름',
		B.prod_name "제품 이름",
        concat(M.phone1, M.phone2) AS "연락처"
	from buy B
		inner join member M
        on B.mem_id = M.mem_id;
        
select distinct '회원 아이디', '회원 이름' from v_viewtest1;

drop view v_viewtest1;



use market_db;
create or replace view v_viewtest2
as
		select mem_id, mem_name, addr from member;


describe v_viewtest2;

describe member;

show create view v_viewtest2;

update v_member set addr = '부산' where mem_id='BLK' ;

insert into v_member(mem_id, mem_name, addr) values('BTS', '방탄소년단', '경기') ;


create view v_height167
as
		select * from member where height >= 167 ;
        
select * from v_height167 ;

delete from v_height167 where height < 167;

insert into v_height167 values('TRA', '티아라', 6, '서울', null, null, 159, '2005-01-01');

select * from v_height167;


alter view v_height167
as
	select * from member where height >= 167
		with check option;
        
insert into v_height167 values('TOB', '텔레토비', 4, '영국', null, null, 140, '1995-01-01');

drop table if exists buy, member;

select * from v_height167;

check table v_height167;


use market_db;
create table table1 (
	col1 int primary key,
    col2 int,
    col3 int
);


show index from table1;



create table table2 (
	col1 int primary key,
    col2 int unique,
    col3 int unique
);
show index from table2;


use market_db;
drop table if exists buy, member;
create table member
(
	mem_id       char(8),
    mem_name     varchar(10),
    mem_number   int,
    addr         char(2)
);



insert into member values('TWC', '트와이스', 9, '서울');
insert into member values('BLK', '블랙핑크', 4, '경남');
insert into member values('WMN', '여자친구', 6, '경기');
insert into member values('OMY', '오마이걸', 7, '서울');
select * from member;

alter table member
	add constraint
    primary key (mem_id);
select * from member;


alter table member drop primary key;
alter table member
	add constraint
    primary key(mem_name);
select * from member;

insert into member values('GRL', '소녀시대', 8, '서울');
select * from member;


drop table if exists member;
create table member
(
	mem_id       char(8),
    mem_name     varchar(10),
    mem_number   int,
    addr         char(2)
);


insert into member values('TWC', '트와이스', 9, '서울');
insert into member values('BLK', '블랙핑크', 4, '경남');
insert into member values('WMN', '여자친구', 6, '경기');
insert into member values('OMY', '오마이걸', 7, '서울');
select * from member;


alter table member
		add constraint
        unique (mem_id);
select * from member;


alter table member
		add constraint
        unique (mem_name);
select * from member;


insert into member values('GRL', '소녀시대', 8, '서울');
select * from member;



use market_db;
create table cluster    -- 클러스터형 인덱스를 테스트하기 위한 테이블
(
	mem_id        char(8),
    mem_name      varchar(10)
);
insert into cluster values('TWC', '트와이스');
insert into cluster values('BLK', '블랙핑크');
insert into cluster values('WMN', '여자친구');
insert into cluster values('OMY', '오마이걸');
insert into cluster values('GRL', '소녀시대');
insert into cluster values('ITZ', '잇지');
insert into cluster values('RED', '레드벨벳');
insert into cluster values('APN', '에이핑크');
insert into cluster values('SPC', '우주소녀');
insert into cluster values('MMU', '마마무');


select * from cluster;

alter table cluster
		add constraint
        primary key (mem_id);
        
        
select * from cluster;




use market_db;
create table second    -- 보조 인덱스를 테스트하기 위한 테이블
(
	mem_id        char(8),
    mem_name      varchar(10)
);
insert into second values('TWC', '트와이스');
insert into second values('BLK', '블랙핑크');
insert into second values('WMN', '여자친구');
insert into second values('OMY', '오마이걸');
insert into second values('GRL', '소녀시대');
insert into second values('ITZ', '잇지');
insert into second values('RED', '레드벨벳');
insert into second values('APN', '에이핑크');
insert into second values('SPC', '우주소녀');
insert into second values('MMU', '마마무');

alter table second
		add constraint
        unique (mem_id);
select * from second;


use market_db;
select * from member;


show index from member;

show table status like 'member';

create index idx_member_addr
	on member (addr);
    
    
show index from member;

show table status like 'member';


analyze table member;
show table status like 'member';

create unique index idx_member_mem_number
on member (mem_number);

create unique index idx_member_mem_name
	on member (mem_name);
    
show index from member;

insert into member values('MOO', '마마무', 2, '태국', '001', '12341234', 155, '2020.10.10');

analyze table member;
show index from member;

select * from member;

select mem_id, mem_name, addr from member;

select mem_id, mem_name, addr
	from member
    where mem_name = '에이핑크';
    
create index idx_member_mem_number
	on member (mem_number);
analyze table member;

select mem_name, mem_number
	from member
    where mem_number >= 7;
    
select mem_name, mem_number
	from member
    where mem_number >= 1;
    
select mem_name, mem_number
	from member
    where mem_number*2 >= 14;
    
select mem_name, mem_number
	from member
    where mem_number  >= 14/2;
    
    
drop index idx_member_mem_name on member;
drop index idx_member_addr on member;
drop index idx_member_mem_number on member;
    
    
alter table member
	drop primary key;
    
select table_name, constraint_name
	from information_schema.referential_constraints
    where constraint_schema = 'market_db';
    
alter table buy
	drop foreign key buy_idfk_1;
alter table member
	drop primary key;