-- D:\dev\database\workspace\chapter03\chapter03-05.sql

-- 연습문제
-- 1
-- (1) 도서 번호가 1인 도서의 이름
select bookname
from book
where bookid = 1;
-- (2) 가격이 20000원 이상인 도서의 이름
select bookname
from book
where price >= 20000;
-- (3) 박지성의 총구매액 (박지성의 custid=1)
select * from customer;
select sum(saleprice)
from orders
where custid=1;
-- (4) 박지성이 구매한 도서의 수
select count(*)
from orders
where custid=1;
-- (5) 박지성이 구매한 도서의 출판사 수
-- 박지성이 구매한 도서의 아이디 1, 2, 3
select count(distinct publisher)
from book
where bookid in (1, 2, 3);
-- (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select sum(price)
from book
where bookid in (1, 2, 3); -- 42000원
select sum(saleprice)
from orders
where custid=1; -- 39000원

-- 2
-- (1)
select count(*)
from book;
-- (2)
select count(distinct publisher)
from imported_book;
-- (3)
select name, address
from customer;
-- (4)
select bookid
from orders
where orderdate between '2020/07/03' and '2020/07/07';
-- (5)
select bookid
from orders
where orderdate not between '2020/07/03' and '2020/07/07';
--(6)
select name, address
from customer
where name like '김%';
-- (7)
select name, address
from customer
where name like '김%아';