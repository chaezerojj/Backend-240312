-- D:\dev\database\workspace\chapter07\chapter07-01.sql

-- ! commit문과 rollback문

select * from customer;

-- 고객 테이블에서 5번 고객을 삭제
delete from customer where custid = 5;
select * from customer;

-- 일시적으로 반영된 데이터 복원 -> rollback 명령어 사용
rollback;
select * from customer;

-- 다시 고객 테이블에서 5번 고객을 삭제함
delete from customer where custid = 5;

-- commit 명령어로 데이터베이스에 삭제 작업을 반영시키기
commit;

-- 다시 rollback 명령어 사용
rollback;
select * from customer;
-- >> 삭제한 5번이 복원되지 않음

-- ? commit
-- : 이전 commit지점에서 적용되었던 sql문을 완전히 적용하는 명령어
-- - rollback 이전의 commit 명령어 전까지 되돌리는 명령어

insert into customer values(5, '박세리', '대한민국 서울', null);














