use webdb;

create table member(
	member_id char(8) not null,
    member_name char(5) not null,
    member_addr char(20) not null
);
alter table member add primary key (member_id);

drop table webdb.product;

create table webdb.product(
	product_name char(4) not null,
    cost int not null,
    make_date date,
    company char(5),
    amount int not null,
    primary key (product_name)
);

select * from member;

insert into member(member_id,  member_name, member_addr) 
	values('tess', '나훈아', '경기도 부천시 중동');
insert into member(member_id,  member_name, member_addr) 
	values('hero', '임영웅', '서울 은평구 증산동');
insert into member(member_id,  member_name, member_addr) 
	values('iyou', '아이유', '인천 남구 주안동');
insert into member(member_id,  member_name, member_addr) 
	values('jpy', '박진영', '경기 고양시 장향동');
    
insert into member(member_id,  member_name, member_addr) 
	values('carry', '머라이어', '미국 텍사스 사막');

-- 주소 변경    
UPDATE member
SET member_addr = '영국 런던 먹자골목'  -- 새로운 주소로 변경
WHERE member_id = 'carry';        -- member_id가 'carry'인 행을 지정 
    
-- carry 삭제
DELETE FROM member
WHERE member_id = 'carry';

    
-----------------------------------------------------------------

create table item(
	item_id char(8) not null,
    item_price int not null,
    item_day date not null,
    item_name char(5) not null,
    item_account int not null
);

select * from item;

insert into item(item_id, item_price, item_day, item_name, item_account) 
	values('바나나', '1500', '2021-07-01', '델몬트', '17');
insert into item(item_id, item_price, item_day, item_name, item_account) 
	values('카스', '2500', '2022-03-01', 'OB', '3');
insert into item(item_id, item_price, item_day, item_name, item_account) 
	values('삼각김밥', '800', '2023-09-01', 'CJ', '22');
    
show tables;

----------------------------------------------
drop table webdb.product2;

CREATE TABLE webdb.product2 (
    product_name CHAR(4) NOT NULL,
    cost INT NOT NULL,
    make_date DATE DEFAULT (CURRENT_DATE),  -- 현재 날짜로 기본값 설정
    company CHAR(5),
    amount INT NOT NULL,
    PRIMARY KEY (product_name)
);

select * from product2;
    

insert into webdb.product2(product_name, cost, company, amount) 
	values('바나나', 1500, '델몬트', 17);
insert into product2(product_name, cost, make_date, company, amount) 
	values('카스', 2500, '2022-03-01', 'OB', 3);
    