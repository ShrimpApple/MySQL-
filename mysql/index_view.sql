use webdb;
select * from member;

select member_name, member_addr from member;

select * from member where member_name='아이유';

create index idx_member_name on member(member_name);

select * from member where member_addr LIKE '경기%';

create index idx_member_addr on member(member_addr);


create view member_view
as
select member_id, member_name, member_addr from member;

select * from member_view;

create view member_name_view
as
select member_id, member_name from member;

select * from member_name_view;