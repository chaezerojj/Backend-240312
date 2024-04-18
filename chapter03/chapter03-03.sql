-- D:\dev\database\workspace\chapter03\chapter03-03.sql

-- select문 예제
-- 기본 검색
-- 모든 도서의 이름과 가격을 검색하시오.
select bookname, price
from book;

-- sql문은 대소문자를 구분하지 않음
-- sql예약어(키워드)는 대문자로, 테이블이나 속성이름은 소문자로 작성
-- 작성규칙은 아주 엄격하지 않음

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
select bookid, bookname, publisher, price
from book;