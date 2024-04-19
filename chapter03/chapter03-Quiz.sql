-- 1. 마당서점의 고객이 요고하는 다음 질문에 대해 sql문을 작성하시오.
-- (1) 도서 번호가 1인 도서의 이름
select bookname
from book
where bookid=1;

-- (2) 가격이 20000원 이상인 도서의 이름
select bookname
from book
where price >= 20000;

-- (3) 박지성의 총구매액
select sum(saleprice)
from orders
where custid=1;

-- (4) 박지성이 구매한 도서의 수
select count(*)
from orders
where custid=1;

-- (5) 박지성이 구매한 도서의 출판사 수
select count(*) publisher
from book,orders
where book.bookid = orders.bookid and orders.custid=1;

-- (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname, saleprice, (price-saleprice)
from book, orders
where book.bookid = orders.bookid and orders.custid=1;

-- (7) 박지성이 구매하지 않은 도서의 이름
select distinct bookname
from book, orders
where book.bookid = orders.bookid and orders.custid not in 1;

-- 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 sql문을 작성하시오.
-- (1) 마당서점 도서의 총수
select count(*)
from book;

-- (2) 마당서점의 도서를 출고하는 출판사의 총수
select count(publisher)
from imported_book;

-- (3) 모든 고객의 이름, 주소
select name, address
from customer;

-- (4) 2020년 7월 3일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
select bookid
from orders
where orderdate between '2020/0703' and '2020/07/07';

-- (5) 2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select distinct bookid
from orders
where orderdate not between '2020/0703' and '2020/07/07';

-- (6) 성이 '김'씨인 고객의 이름과 주소
select name, address
from customer
where name like '김_%';

-- (7) 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name, address
from customer
where name like '김_아%';
