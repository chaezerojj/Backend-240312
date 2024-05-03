-- 5. 얌얌분식 데이터에 대한 구체적인 데이터 알아보기
-- (1) 얌얌분식 테이블 6개를 출력하시오.
select * from menu;
select * from menutype;
select * from orders;
select * from ordersmenu;
select * from customer;
select * from delivery;

-- (2) 얌얌분식에서 '김분식'이 주문한 내역을 조회하시오.
-- 방법 1.
select * from customer; -- 김분식의 custid: 1
select * from orders o, ordersmenu om 
where o.ordersid = om.ordersid
and o.custid = 1;
-- 방법 2.
select * from orders
where custid = (select custid
                from customer
                where custname = '김분식');
                
-- (3) 얌얌분식에서 2024년 5월 1일의 전체 주문 내역을 조회하시오.
select * from orders
where orderdate = '2024-05-01';

-- (4) 5월 1일 주문 중 배달인 주문만 조회하시오.
-- 방법 1.
select * from orders o, delivery d
where o.ordersid = d.ordersid
and o.orderdate = '2024-05-01';
-- 방법 2. 조인 사용한 sql문
select * from orders o
inner join delivery d on o.ordersid = d.ordersid
where o.orderdate = '2024-05-01';

-- (5) 얌얌분식의 주문 건별 금액 총 합을 구하시오.
select om.ordersid as 주문번호, sum(m.menuprice) as "총 주문금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
order by o.ordersid;

-- (6) 주문 총 금액이 10000원이 넘는 주문 번호만 조회하시오.
select o.ordersid as 주문번호, sum(m.menuprice) as "총 주문금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
having sum(m.menuprice) >= 10000
order by o.ordersid;

-- (7) 얌얌분식의 평균 주문금액 조회하시오.(소수점 반올림하여 정수로 출력)
select round(avg(menuprice)) as "평균 주문금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid;

-- (8) 매장식사 손님들의 평균 주문 금액 조회하시오.(소수점 반올림하여 정수로 출력)
select round(avg(menuprice)) as "평균 금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.takein='Y';

-- (9) 얌얌분식의 5월 1일, 5월 2일, 5월 3일 전체 매출을 각각 조회하시오.
-- 5월 1일
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-01';
-- 5월 2일
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-02';
-- 5월 3일
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-03';

-- (10) 메뉴에 '떡볶이'가 들어간 메뉴의 이름과 가격을 조회하시오.
select menuname, menuprice
from menu
where menuname like '%떡볶이%';

-- (11) 배달이 '완료'된 주문의 주문번호, 배달상태, 주문일자를 조회하시오.
select d.ordersid, d.status, o.orderdate
from orders o, delivery d
where o.ordersid = d.ordersid
and d.status = '완료'
order by o.orderdate;

-- (12) 주문번호가 5번인 주문의 메뉴이름과 가격을 출력하시오.
select m.menuname, m.menuprice
from menu m, ordersmenu om
where m.menuid = om.menuid
and om.ordersid = 5;

-- (13) 이씨 성을 가진 고객의 이름과 주문번호를 출력하시오.
select c.custname, o.ordersid
from customer c, orders o
where c.custid = o.custid
and c.custname like '이_%';

-- (14) 2024년 5월 2일 매장식사와 포장식사의 주문 총 금액을 조회하시오.
select o.takein, sum(m.menuprice) as "총 금액"
from orders o, ordersmenu om, menu m
where o.ordersid = om.ordersid and m.menuid = om.menuid
and o.orderdate = '2024-05-02'
group by o.takein;

-- (15) 가장 높은 가격의 메뉴 이름과 가격을 조회하시오.
select menuname, menuprice
from menu
where menuprice = (
    select max(menuprice)
    from menu
);

-- (16) 배달이 '진행중'인 주문의 주문번호와 주문 일자를 조회하시오.
select d.ordersid, o.orderdate
from orders o, delivery d
where o.ordersid = d.ordersid
and d.status = '진행중';

-- (17) 가격이 7000원 이상인 메뉴의 메뉴 이름 조회하시오.
select menuname, menuprice
from menu
where menuprice >= 7000;

-- (18) 얌얌분식에서 가장 많이 주문된 메뉴이름과 해당 메뉴의 총 주문 횟수를 조회하시오.
select menuname, totalcount
from (
    select m.menuname, count(om.menuid) as totalcount
    from menu m, ordersmenu om
    where m.menuid = om.menuid
    group by m.menuname
    order by count(om.menuid) desc
)
where rownum = 1;

-- (19) 고객별 첫 주문일을 조회하시오. (고객 이름과 첫 주문일을 출력)
select c.custname, min(o.orderdate) as "첫 주문일"
from customer c, orders o
where c.custid = o.custid
group by custname;

-- (20) 음료를 주문하지 않은 주문번호만 출력하시오.
select ordersid
from orders o
where not exists (
    select 1
    from ordersmenu om
    where o.ordersid = om.ordersid
    and om.menuid in (
        select menuid 
        from menu
        where typeid = (
            select typeid from menutype
            where typename = '음료류'
        )
    )
);

-- (21) 고객 중에서 이전 주문과 같은 메뉴를 다시 주문한 고객을 찾으시오.
select distinct custid
from (
    select o1.custid, om1.menuid
    from orders o1, ordersmenu om1
    where o1.ordersid = om1.ordersid
    and om1.menuid in (
        select om2.menuid
        from ordersmenu om2, orders o2
        where om2.ordersid = o2.ordersid
        and o1.ordersid = o2.ordersid
        and o2.ordersid != o1.ordersid
    )
); -- -> 같은 주문을 한 고객이 없어서 질의결과 값이 없음

-- (22) 모든 주문 중에서 가장 먼저 주문한 고객의 주문일자와 해당 주문을 한 고객이름을 조회하시오.
select o.orderdate, c.custname
from orders o, customer c
where o.custid = c.custid
and o.ordersid = 1;

-- (23) 세트류 중에서 가장 많이 주문된 메뉴의 메뉴명과 주문 횟수를 조회하시오.
select menuname, "주문 횟수"
from (
    select m.menuname, count(om.menuid) as "주문 횟수"
    from menu m, ordersmenu om, menutype mt
    where m.menuid = om.menuid
    and mt.typeid = m.typeid
    and mt.typename = '세트류'
    group by m.menuname
    order by count(om.menuid) desc
)
where rownum = 1;

-- (24) 음료류 중에서 가장 많이 주문된 메뉴의 이름과 총 주문 횟수를 구하시오.
select menuname, "총 주문횟수"
from (
    select m.menuname, count(om.menuid) as "총 주문횟수"
    from menu m, ordersmenu om, menutype mt
    where m.menuid = om.menuid
    and m.typeid = mt.typeid
    and mt.typename = '음료류'
    group by m.menuname
    order by count(om.menuid) desc
)
where rownum = 1;

-- (25) 배달비가 가장 낮은 건의 주문메뉴 내용을 출력하시오.
select m.menuname
from menu m, orders o, ordersmenu om
where o.ordersid = om.ordersid
and m.menuid = om.menuid
and o.ordersid = (
    select ordersid
    from delivery
    where deliveryprice = (
        select min(deliveryprice) from delivery
    )
);

-- (26) 한번도 매장에서 식사한 적이 없는 고객의 이름을 조회하시오.
select c.custname
from customer c
where not exists (
    select 1
    from orders o
    where o.custid = c.custid
    and o.takein = 'Y'
);

-- (27) 분식류에서 주문을 한적이 없는 고객이름과 고객번호 조회하시오.
select c.custname, c.custid
from customer c
where not exists (
    select 1
    from orders o
    join ordersmenu om on o.ordersid = om.ordersid
    join menu m on om.menuid = m.menuid
    join menutype mt on m.typeid = mt.typeid
    where o.custid = c.custid
    and mt.typename = '분식류'
)
and rownum = 1;

-- (28) 가장 많은 메뉴를 주문한 주문번호와 주문한 메뉴 개수를 출력하시오.
select ordersid as 주문번호, count(menuid) as "메뉴 개수"
from ordersmenu
group by ordersid
order by count(menuid) desc
fetch first row only;

-- (29) 배달을 제외한 포장주문 고객의 주문번호만 조회하시오.
select o.ordersid
from orders o
where o.takein = 'N'
and not exists (
    select 1
    from delivery d
    where o.ordersid = d.ordersid
);

-- (30) '서울 서초구'에 사는 고객이 주문한 주문메뉴 내역 출력하시오.(주문번호, 메뉴이름, 주문날짜)
select distinct o.ordersid, m.menuname, o.orderdate
from ordersmenu om, customer c, orders o, menu m
where c.custid = o.custid
and om.ordersid = o.ordersid
and m.menuid = om.menuid
and c.custaddr = '서울 서초구'
order by o.ordersid asc;

-- (31) 5월 2일 배달된 음식에 문제가 생겨 고객에게 연락을 해야 하는 상황이다. 
--      배달 건 중 '떡볶이'가 들어간 음식을 주문한 고객의 이름과 주소, 전화번호를 출력하시오.
select distinct c.custname, c.custaddr, c.custphone
from customer c, orders o, ordersmenu om, menu m
where c.custid = o.custid
and om.ordersid = o.ordersid
and m.menuid = om.menuid
and o.orderdate = '2024-05-02'
and m.menuname like '%떡볶이%'
and o.takein = 'N';

-- (32) 현재 진행중인 배달 중에서 고객에게 배달이 늦어질 것이라는 문자를 보내야 한다.
--      '진행중'인 배달 건에 해당하는 고객의 이름과 전화번호를 출력하시오.
select c.custname, c.custphone
from customer c, orders o, delivery d
where c.custid = o.custid
and d.ordersid = o.ordersid
and d.status = '진행중';

-- (33) 얌얌분식에서는 현재 배달이벤트로 10000원이상 주문 고객을 대상으로 무료 음료 1개를 보내주고 있다.
--      배달 건중 무료 음료 이벤트에 해당하는 주문번호와 해당 주문 전체 금액을 함께 출력하시오.
select o.ordersid, sum(m.menuprice) as total_price
from orders o, ordersmenu om, menu m, delivery d
where o.ordersid = om.ordersid
and om.menuid = m.menuid
and d.ordersid = o.ordersid
and o.takein = 'N'
group by o.ordersid
having sum(m.menuprice) >= 10000;

-- (34) 배달 주문을 한 고객 중에서 주문번호, 고객이름, 배달비를 포함한 총 금액이 나오는 sql문을 작성하시오.


-- (35) 포장주문이 가장 많았던 날의 주문날짜와 해당하는 날의 주문 건이 총 몇 건이었는지 구하시오.



