-- 5. 얌얌분식 데이터에 대한 구체적인 데이터 알아보기
-- (1) 얌얌분식 테이블 6개 출력
select * from menu;
select * from menutype;
select * from orders;
select * from ordersmenu;
select * from customer;
select * from delivery;
-- (2) 얌얌분식에서 '김분식'이 주문한 내역 출력
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
                
-- (3)-1. 얌얌분식에서 2024년 5월 1일의 전체 주문 내역 출력
select * from orders
where orderdate = '2024-05-01';

-- (3)-2. 5월 1일 주문 중 배달인 주문만 출력
-- 방법 1.
select * from orders o, delivery d
where o.ordersid = d.ordersid
and o.orderdate = '2024-05-01';
-- 방법 2. 조인 사용한 sql문
select * from orders o
inner join delivery d on o.ordersid = d.ordersid
where o.orderdate = '2024-05-01';

-- (4) 얌얌분식의 주문 건별 금액 총 합 구하기
select om.ordersid as 주문번호, sum(m.menuprice) as "총 주문금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
order by o.ordersid;
-- (4)-1. 주문 총 금액이 10000원이 넘는 주문 번호만 출력
select o.ordersid as 주문번호, sum(m.menuprice) as "총 주문금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
having sum(m.menuprice) >= 10000
order by o.ordersid;
-- (4)-2. 얌얌분식의 평균 주문금액 출력(소수점 반올림하여 정수로 출력)
select round(avg(menuprice)) as "평균 주문금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid;
-- (4)-3. 매장식사 손님들의 평균 주문 금액 출력 (소수점 반올림하여 정수로 출력)
select round(avg(menuprice)) as "평균 금액"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.takein='Y';

-- (5) 얌얌분식의 5월 1일, 5월 2일, 5월 3일 전체 매출 각각 출력
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-01';
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-02';
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-03';

-- (6) 메뉴에 '떡볶이'가 들어간 메뉴의 이름과 가격을 조회하기
select menuname, menuprice
from menu
where menuname like '%떡볶이%';

-- (7) 배달이 '완료'된 주문의 주문번호, 배달상태, 주문일자 조회하기
select d.ordersid, d.status, o.orderdate
from orders o, delivery d
where o.ordersid = d.ordersid
and d.status = '완료'
order by o.orderdate;

-- (8) 주문번호가 5번인 주문의 메뉴이름과 가격을 조회하기
select m.menuname, m.menuprice
from menu m, ordersmenu om
where m.menuid = om.menuid
and om.ordersid = 5;
/*
고객이름이 '김분식'이 아닌 고객이 주문한 내역 출력하기.
2024년 5월 1일에 매장식사와 포장식사의 주문 총 금액을 비교해서 출력하기.
메뉴 가격이 가장 높은 메뉴 이름과 가격 조회하기.
배달이 '완료'된 주문 중 가장 최근에 완료된 주문의 주문번호와 주문일자 조회하기.
메뉴 가격이 특정 가격 이상인 메뉴만 조회하기.
얌얌분식에서 가장 많이 주문된 메뉴 이름과 해당 메뉴의 총 주문 횟수 조회하기.
각 고객의 첫 주문일과 마지막 주문일을 조회하기.
얌얌분식에서 가장 자주 함께 주문된 메뉴 쌍 찾기 (예를 들어, 떡볶이와 튀김이 자주 함께 주문되는 경우).
주문마다 최대 메뉴 수량을 조회하기.
얌얌분식에서 5월 1일에 포장식사한 고객 중에서 이전 주문과 동일한 메뉴를 다시 주문한 고객들을 찾기.
*/
