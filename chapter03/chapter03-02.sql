-- D:\dev\database\workspace\chapter03\chapter03-02.sql

-- 데이터 조작어 - 검색
-- - select문 문법으로 검색
-- sql의 select문은 데이터를 검색하는 기본 문장으로
-- 특별히 질의어(Query)라고 부름
-- select문은 검색한 결과를 테이블 형태로 출력함
-- e.g., 10000원 이상인 도서의 이름과 출판사를 보이시오.
select bookname, publisher from book where price >= 10000;
select bookname, publisher 
from book 
where price >= 10000; -- 파란 키워드를 기준으로 줄바꿈하여 작성

-- select문의 기본 문법
-- select[all|distinct] 속성이름
-- from 테이블이름
-- [where 검색조건]
-- [group by 속성이름]
-- [having 검색조건]
-- [order by 속성이름 [asc|desc]] -- asc:오름차순 / desc:내림차순
-- 대괄호[]안의 sql예약어들은 선택적으로 사용
-- |: 선택 가능한 문법들 중 한개를 사용할 수 있음


