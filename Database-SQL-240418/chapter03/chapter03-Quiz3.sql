-- 문제1
-- 마당 서점에서 택배를 보내기 위해 택배에 필요한 정보가 필요하다. 택배에 필요한 정보만 추출하시오.
select *
from customer c, orders o, book b
where o.custid = c.custid and b.bookid = o.bookid;

-- 문제2
-- 택배비 만원이상이면 무료이므로 택배비 무료인 주문과 택배비 발생 주문 테이블이 두개를 검색해 오시오.
-- 택배비 무료(10000원이상 주문) 테이블
select c.name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
having sum(saleprice) >= 10000
group by c.name;

-- 택배비 발생 테이블
select c.name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
having sum(saleprice) < 10000
group by c.name;


