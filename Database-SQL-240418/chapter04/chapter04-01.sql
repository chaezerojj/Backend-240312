-- D:\dev\database\workspace\chapter04\chapter04-01.sql

-- 고급 sql 작성

-- 01. 내장함수
-- ? sql 내장함수
-- - select절과 where절, update절 등에서 모두 사용 가능
-- * 함수 형태
-- - select 함수명(인자1, 인자2, ...) from 테이블 이름;
-- - where 열이름=함수명(인자1, 인자2, ...);
-- - update 테이블이름;
-- - set 열이름=함수명(인자1, 인자2, ...);

-- ? 오라클에서 제공하는 내장함수
-- * 숫자 함수
-- - sql문에서는 수학의 기본적인 사칙 연산자(+, -, *, /)와 나머지(%)연산자 기호를 그대로 사용
-- - 사칙 연산자 외에도 여러 연산자 존재
-- - 사용 빈도가 높은 연산자들은 내장함수 형태로 제공됨

-- 1. abs 함수
-- : 숫자의 절대값 계산
-- ? -78과 +78의 절댓값을 구하시오.
select abs(-78), abs(+78)
from dual;
-- from절에서 dual 테이블 -> 실제로 존재하는 테이블이 아닌 
--                         오라클에서 일시적인 연산작업을 위해 만든 가상의 테이블

-- 2. round 함수
-- : m자리를 기준으로 숫자를 반올림
-- 형태 - (숫자, m)
-- ? 4.87를 숫자 첫째자리까지 반올림한 값을 구하시오.
select round(4.875, 1) from dual;

-- - 숫자 함수의 연산
--   >> 인자에 숫자 대신 열이름도 사용 가능, 여러 함수 복합 사용 가능
-- ? 고객별 평균 주문 금액의 백 원 단위로 반올림한 값을 구하시오.
select custid "고객 번호", round(sum(saleprice)/count(*), -2)  "평균 금액"
from orders 
group by custid;

-- * 문자 함수
-- : 문자 데이터 타입을 가공한 결과를 반환

-- 1. replace 함수
-- replace(s1, s2, s3)
-- - 함수 대상문자열(s1)의 지정한 문자(s2)를 원하는 문자(s3)로 변경
-- ? 도서 제목에 야구가 포함된 도서를 '농구'로 변경한 후 도서 목록을 보이시오.
select bookid, replace(bookname, '야구', '농구') bookname, publisher, price
from book;

-- 2. length 함수
-- length(s)
-- - 대상 문자열의 글자 수를 반환
-- - length: 문자의 수
-- - lengthb: 바이트 단위로 반환
-- ? 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 보이시오.
select bookname, length(bookname) "제목 글자 수", lengthb(bookname) "제목 바이트 수" 
from book
where publisher = '굿스포츠';

-- 3. substr 함수
-- substr(s, n, k)
-- - 대상 문자열의 지정된 자리에서부터 지정된 길이만큼 잘라서 반환
-- ? 마당서점의 고객 중에서 같은 성(last name)을 가진 사람이 
--   몇명이나 되는지 성별 인원수를 구하시오.
select * from customer;
insert into customer values (5, '박세리', '대한민국 서울', null);
-- 박씨 두명 출력되는지 확인
select substr(name, 1, 1) "성(last name)", count(*)
from customer
group by substr(name, 1, 1);

-- 4. 날짜 시간 함수
-- * 날짜 시간 함수의 종류
-- (1) to_date(char, datetime)
-- : 문자형 데이터(char)를 date형으로 반환
-- char: 문자나 문자열을 나타냄
-- datetime: 날짜와 시간을 나타내는 인수

-- (2) to_char(date, datetime)
-- : date형 데이터를 문자열(varchar2)로 반환

-- (3) add_months(date, 숫자)
-- : 날짜에 지정한 달을 더해 date형으로 반환(1: 다음달, -1: 이전달)

-- (4) last_day(date)
-- : 날짜에 달의 마지막 날을 date형으로 반환

-- (5) sysdate
-- : dbms 시스템 상의 당일 날짜를 date형으로 반환하는 인자가 없는 함수

-- ? 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderid, orderdate, orderdate+10 "주문확정일자" 
from orders;
-- 날짜형 데이터는 -와 +를 사용하여 원하는 날짜로부터 이전과 이후를 계산 가능

-- ? dbms 서버에 설정된 현재 날짜와 시간, 요일을 확인하시오.
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss')
from dual;
-- 'yyyy/mm/dd dy hh24:mi:ss' = '연도/월/일 요일 시:분:초'

select * from orders;
insert into orders values (11, 1, 1, 6000, sysdate);

-- * null 값 처리
-- - null 값에 대한 연산과 집계 함수
-- - 집계 함수를 사용할 때 null값이 포함된 행에 대한 주의사항
-- - 1. null + 숫자 연산의 결과는 null임
-- - 2. 집계 함수를 계산할 때 null이 포함된 행은 집계에서 빠짐
-- - 3. 집계 함수에 적용되는 행이 하나도 없으면 sum, avg 함수의 결과는 null
--      , count함수의 결과는 0임
create table mybook (
    bookid number primary key,
    price number
);

insert into mybook values (1, 10000);
insert into mybook values (2, 20000);
insert into mybook values (3, null);
select * from mybook;

-- 1. null + 숫자 연산의 결과는 null임
select price+100 from mybook where bookid = 3;
-- 2. 집계 함수를 계산할 때 null이 포함된 행은 집계에서 빠짐
select count(*), count(price), sum(price), avg(price) from mybook;
-- 3. 집계 함수에 적용되는 행이 하나도 없으면 sum, avg 함수의 결과는 null, count함수의 결과는 0임
select sum(price), avg(price), count(*)
from mybook where bookid>=4;

-- null 값 확인하는 방법
-- - is null, is not null
-- mybook테이블의 price가 null인 값 찾기
select * from mybook where price is null;
-- mybook테이블의 price가 null이 아닌 값 찾기
select * from mybook where price is not null;

-- nvl 함수
-- nvl(속성, 값)
-- : null값을 다른 값으로 대치하여 연산하거나 다른 값으로 출력
-- - null값을 임의의 다른 값으로 변경 가능
-- - 속성이 null값이면 값으로 대치함
-- ? 이름, 전화번호가 포함된 고객목록을 보이시오.
--   단, 전화번호가 없는 고객은 '연락처없음'으로 표시하시오.
select * from customer;
select name, nvl(phone, '연락처없음') "PHONE" from customer;

-- rownum 문법
-- : 오라클 내부적으로 생성되는 가상 컬럼으로 sql 조회결과의 순번을 나타냄
-- ? 고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
select rownum, custid, name, phone 
from customer
where rownum <= 2;

-- rownum 사용시 주의사항
-- 가나다순으로 정리된 고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
select rownum, custid, name, phone
from customer
where rownum <= 2
order by name;
-- 오라클의 select문 처리순서
-- 1. from customer : customer테이블을 읽음
-- 2. where rownum <= 2 : 오라클이 데이터를 읽은 순서대로 2개 투플을 선택
-- 3. select rownum, custid, name, phone : 속성열 선택
-- 4. order by name : 이름순으로 정렬

-- 부속질의를 사용
select rownum 순번, custid, name, phone
from (select custid, name, phone
        from customer order by name)
where rownum <= 2;

























