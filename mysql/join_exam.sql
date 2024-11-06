-- 내부조인
select *
from buy
	inner join member
	on buy.mem_id = member.mem_id
where buy.mem_id = 'BLK';

-- 내부조인 간결하게
select member.mem_id, mem_name, prod_name, addr, concat(phone1, phone2) 연락처
from buy
	inner join member
	on buy.mem_id = member.mem_id;
    
-- 테이블 명을 약호로
select B.mem_id, M.mem_name, B.prod_name, M.addr, concat(M.phone1, M.phone2) 연락처
from buy B
	inner join member M
    on B.mem_id = M.mem_id;

-- 내부 조인 중복 불허
select distinct M.mem_id, M.mem_name, M.addr
from buy B
	inner join member M
    on B.mem_id = M.mem_id
order by M.mem_id;

-- 왼쪽 기준 아웃조인
select M.mem_id, M.mem_name, B.prod_name, M.addr
from member M
	left outer join buy B
    on M.mem_id = B.mem_id
order by M.mem_id;

-- 오른쪽 기준 아웃조인
select M.mem_id, M.mem_name, B.prod_name, M.addr
from buy B
	right outer join member M
    on M.mem_id = B.mem_id
order by M.mem_id;

-- full 조인 생략(left, right 모두 포함)

create table emp_table (
	emp char(4),
    manager char(4),
    phone varchar(8)
);
select * from emp_table;
insert into emp_table values('대표', null, '0000');
insert into emp_table values('영업이사', '대표', '1111');
insert into emp_table values('관리이사', '대표', '2222');
insert into emp_table values('정보이사', '대표', '3333');
insert into emp_table values('영업과장', '영업이사', '1111-1');
insert into emp_table values('경리부장', '관리이사', '2222-1');
insert into emp_table values('인사부장', '관리이사', '2222-2');
insert into emp_table values('개발팀장', '정보이사', '3333-1');
insert into emp_table values('개발주임', '정보이사', '3333-1-1');

select A.emp '직원', B.emp '직속상관', B.phone '직속상관연락처'
from emp_table A
	inner join emp_table B
	on A.manager = B.emp
where A.emp = '경리부장';

