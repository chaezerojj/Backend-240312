-- D:\dev\database\workspace\chapter03\chapter03-Quiz2.sql

-- 박지성의 총구매액
select sum(saleprice)
from orders, customer
where customer.custid = orders.custid and customer.name like '박지성';

-- 박지성이 구매한 도서의 수
select count(*)
from orders
where custid = 1;

select count(*)
from customer c, orders o
where c.custid = o.custid and c.name like '박지성';

-- 박지성이 구매한 도서의 출판사 수
select count(*) publisher
from book, orders
where book.bookid = orders.bookid and orders.custid = 1;

select count(distinct publisher)
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name like '박지성';

-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname, price, price-saleprice
from book, orders
where book.bookid = orders.bookid and orders.custid=1;

select bookname, price, price-saleprice
from customer c, orders o, book b
where c.custid = o.custid
and o.bookid = b.bookid and c.name like '박지성';

-- 박지성이 구매하지 않은 도서의 이름
select distinct bookname
from book, orders
where book.bookid = orders.bookid and not orders.custid = 1;

select distinct b.bookname
from book b, orders o, customer c
where b.bookid = o.bookid
and c.custid = o.custid and c.name != '박지성';

-- 고객의 이름과 고객별 구매액
select name, sum(saleprice)
from orders o, customer c
where o.custid = c.custid
group by name;

-- 고객의 이름과 고객이 구매한 도서목록
select name, bookname
from customer, book, orders
where orders.custid = customer.custid and book.bookid = orders.bookid
order by name;

select c.name, b.bookname
from customer c, book b, orders o
where o.custid = c.custid and b.bookid = o.bookid;

-- 도서의 가격(Book테이블)과 판매가격(Orders테이블)의 차이가 가장 많은 주문
select *
from book, orders
where book.bookid = orders.bookid 
    and (price - saleprice) in (select max(price - saleprice)
                                from book, orders
                                where book.bookid = orders.bookid);
                                
select *
from book b, orders o
where b.bookid = o.bookid
and price - saleprice = (select max(price - saleprice)
                        from book b, orders o
                        where b.bookid = o.bookid);

-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름***
select name, avg(saleprice)
from customer c, orders o
where c.custid = o.custid
group by name
having avg(saleprice) > (select avg(saleprice)
                        from orders);--도서의 판매액 평균

-- 마당서점에서 다음의 심화된 질문에 대해 sql문을 작성하시오.
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select name
from customer, book, orders
where customer.custid = orders.custid and book.bookid = orders.bookid
and not name in '박지성'
and publisher in (select publisher
                        from book, orders
                        where book.bookid = orders.bookid and orders.custid = 1);
                        
select c.name
from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid
and name not like '박지성'
and publisher in (select b.publisher
                    from customer c, orders o, book b
                    where b.bookid = o.bookid and o.custid = c.custid
                    and name like '박지성'); -- 박지성이 구매하나 도서의 출판사

--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select name
from customer, book, orders
where customer.custid = orders.custid  and book.bookid = orders.bookid
group by customer.name
having count(distinct publisher) >= 2;

select c.name, count(b.publisher)
from customer c, book b, orders o
where c.custid = o.custid
and b.bookid = o.bookid
group by name
having count(distinct b.publisher) >= 2;

--(3) 전체 고객의 30% 이상이 구매한 도서***
select distinct bookname
from book b1, orders o1
where (
        (select count (b2.bookid)
        from book b2, orders o2
        where b2.bookid=o2.bookid
        and b1.bookid = b2.bookid)
        >= 0.3 *(
        select count(*)
        from customer
        )
);

--SELECT DISTINCT book.BOOKNAME
--FROM book, ORDERS
--WHERE ORDERS.BOOKID = BOOK.BOOKID
--GROUP BY BOOKNAME
--HAVING COUNT() >= (SELECT count() custid FROM customer)*30/100;
