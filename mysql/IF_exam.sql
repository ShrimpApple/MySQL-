-- IF문
Drop procedure if exists ifProc1;

delimiter $$
create procedure ifProc1()
begin
	if 100 = 100 then
		select '100은 100과 같습니다.';
        end if;
end $$
delimiter ;

call ifProc();


-- IF문 2번째

Drop procedure if exists ifProc2;

delimiter $$
create procedure ifProc2()
begin
	declare myNum INT;
    set myNum = 200;
	if myNum = 100 then
		select '100입니다.';
	else
		select '100이 아닙니다.';
	end if;
end $$
delimiter ;

call ifProc2();

-- IF문 3번째

Drop procedure if exists ifProc3;

delimiter $$
create procedure ifProc3()
begin
	declare debutDate date;   -- 데뷔일자
    declare curDate date;  -- 오늘
    declare days INT;  -- 활동한 일수
    select debut_Date into debutDate
    from market_db.member
    where mem_id = 'APN';
    
    set curDate = current_date();  -- 현재 날짜
    set days = datediff(curDate, debutDate);
    
	if (days/365) >= 5 then -- 5년이 지났다면
		select concat('데뷔한 지', days, '일이나 지났습니다. 핑순 축하');
	else
		select concat('데뷔한 지', days, '일밖에 안되었네요. 핑순 화이팅');
	end if;
end $$
delimiter ;

call ifProc3();