-- D:\dev\database\workspace\chapter06\chapter06-01.sql

-- summer 테이블 생성하고 데이터 삽입

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100, 'fortran', 20000);
insert into summer values(150, 'pascal', 15000);
insert into summer values(200, 'c', 10000);
insert into summer values(250, 'fortran', 20000);

select * from summer;

-- select 문을 이용한 조회 작업
-- 학생의 학번 sid, 수강하는 과목은 class, 수강 과목의 수강료는 price
-- 계절학기를 듣는 학생의 학번과 수강하는 과목은?
select sid, class from summer;
-- 수강료가 가장 비싼 과목은?
select distinct class from summer
where price = (select max(price) from summer);

-- ! 삭제 이상
-- 만약 200번 학생의 계절학기 수강신청을 취소하시오.
delete summer where sid = 200;
select * from summer;

-- c강좌 수강료를 조회
select price "c 수강료" from summer
where class = "C"; -- error: 조회 불가

-- 200번 학생이 수강신청을 취소하여 관련 투플을 삭제했음
-- 200번 학생의 수강신청은 잘 취소되었음
-- >> c강좌의 수강료 조회 불가
--    학생의 수강신청을 취소하면서 수강료도 함께 삭제하였기 때문
--    삭제 이상 발생

-- 다음 실습을 위해 200번 학생의 자료 다시 입력
insert into summer values(200, 'C', 10000);

-- ! 삽입이상
-- 계절학기에 새로운 자바 강좌를 개설하시오.
-- 자바 강좌 삽입
insert into summer values (null, 'java', 25000);
-- 전체 데이터 조회
select * from summer;
-- 수강한 학생의 총 수를 구하시오.
select count(*) from summer; -- 5
-- 수강한 학생의 총 수가 4명인데 5명이라는 결과가 나옴
-- 테이블의 데이터가 많을 때 전체 데이터를 세세하게 파악하여 sql문을 만들어야 하는 단점
select count(sid) from summer;
-- >> 삽입 이상
-- 자바 강좌가 새로 개설됨
-- 수강료는 25000원이고 아직 신청한 학생 X
-- 자바 강좌 추가를 위해 insert문 사용
-- 신청한 학생이 없어 학번에는 null값이 입력되었음
-- null값은 집계 함수 사용 시 원하지 않은 결과를 만들어냄

-- fortran 강좌의 수강료를 20000원에서 15000원으로 수정하시오.
update summer set price = 15000 where class = "fortran" and sid = 100;

-- fortran 수강료를 조회
select price from summer where class = 'fortran';
-- >> 2건이 조회되어 데이터 불일치 문제 발생(수정 이상)

-- 수정 이상
-- fortran 강좌의 수강료가 20000원에서 15000원으로 변경되어 
-- update문을 이용하여 수정.
-- update문은 조건에 맞는 값을 일괄 수정하지만, 조건을 잘못 주면 데이터 불일치 문제 발생

-- 수정된 계절학기 수강 테이블
-- 테이블 구조를 수정하여 이상현상이 발생하지 않도록 만들기
-- summer 테이블은 summer_price와 summer_enroll 테이블로 분리함
-- summer_price테이블은 과목에 대한 수강료 정보를 저장함
-- summer_enroll테이블은 학생들의 수강신청 정보를 저장
create table summerprice (
    class varchar(20),
    price INTEGER
);
insert into summerprice values ('fortran', 20000);
insert into summerprice values ('pascal', 15000);
insert into summerprice values ('C', 10000);

select * from summerprice;

-- (새로운 단어가 조합될 때 일반적으로 테이블이나 속성이름은 _를 삽입함)
-- e.g., summer_price, summer_enroll

-- summerenroll테이블 생성
create table summerenroll(
    sid integer,
    class varchar(20)
);
insert into summerenroll values (100, 'fortran');
insert into summerenroll values (150, 'pascal');
insert into summerenroll values (100, 'c');
insert into summerenroll values (250, 'fortran');
select * from summerenroll;

-- 200번 학생의 계절학기 수강신청을 취소하시오.
-- C 강좌 수강료 조회
select price from summerprice where class = 'C';
-- 수강취소
delete from summerenroll where sid = 200;
select * from summerenroll;
-- C강좌 수강료 조회
select price from summerprice where class = 'C' or class = 'c';
-- 삭제 이상 없음
-- 200번 학생 수강신청 취소 처리 완료, 연쇄 삭제 현상 X, C 강좌 수강료 조회 가능

-- 계절학기에 새로운 자바 강좌를 개설하시오.
insert into summerprice values ('java', 25000);
select * from summerprice;
-- >> 삽입 이상 없음
-- 아직 자바 강좌를 신청한 학생은 없지만, null값을 입력할 필요 없어 삽입이상 발생 X

-- fortran강좌의 수강료를 20000원에서 15000원으로 수정하시오.
update summerprice set price=15000 where class = 'fortran';
select price from summerprice where class = 'fortran';
-- 수정이상 없음
-- fortran과목 수강료는 하나만 저장되어 있기에 수정 후 데이터의 불일치를 우려할 필요 X

-- 테이블 분리를 통해 이상현상 해결 가능












