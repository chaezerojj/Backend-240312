-- D:\dev\database\workspace\chapter03\chapter03-15.sql

-- 연습문제 풀이

-- [판매원 데이터베이스]
-- 판매원 테이블
create table salesperson(
    name varchar2(100) primary key,
    age number,
    salary number
);
-- 주문 테이블
create table sales_order(
    onumber number,
    custname varchar2(50),
    salesperson varchar(50),
    amount number,
    primary key (custname,salesperson),
    foreign key(custname) references sales_customer(name),
    foreign key(salesperson) references salesperson(name)
);
-- 고객 테이블 생성
create table sales_customer(
    name varchar2(50) primary key,
    city varchar2(50),
    industrytype varchar2(50)
);


-- (1) 테이블을 생성하는 create문과 데이터를 삽입하는 insert문을 작성하시오.
--     테이블의 데이터 타입은 임의로 정하고, 데이터는 아래 질의의 결과가 나오도록 삽입한다.
insert into salesperson values('김판매1', 31, 2001);
insert into salesperson values('김판매2', 32, 2002);
insert into salesperson values('김판매3', 33, 2003);
insert into salesperson values('김판매4', 34, 2004);
insert into salesperson values('김판매5', 35, 2005);
insert into salesperson values('김판매6', 26, 2006);
insert into salesperson values('김판매7', 27, 2007);

-- (2) 모든 판매원의 이름과 급여를 보이시오. 단, 중복 행은 제거한다.
select distinct name, salary
from salesperson;

-- (3) 나이가 30세 미만의 판매원의 이름을 보이시오.
select name
from salesperson
where age < 30;

-- (4) 'S'로 끝나는 도시에 사는 고객의 이름을 보이시오.
insert into sales_customer values ('김고객', 'New York', '증권거래사');
insert into sales_customer values ('박고객', 'Los Angeles', '영화감독');
insert into sales_customer values ('이고객', 'Chicago', '기자');
insert into sales_customer values ('최고객', 'Texas', '농부');
insert into sales_customer values ('강고객', 'Phoenix', '비행기 조종사');
select name
from sales_customer
where city like '%s';

-- (5) 주문을 한 고객의 수(서로 다른 고객만)를 구하시오.
insert into sales_order values (1, '김고객', '김판매1', 1001);
insert into sales_order values (2, '이고객', '김판매1', 1002);
insert into sales_order values (3, '박고객', '김판매2', 1003);
insert into sales_order values (4, '최고객', '김판매3', 1004);
insert into sales_order values (5, '강고객', '김판매4', 1005);
select count (distinct custname)
from sales_order;

-- (6) 판매원 각각에 대하여 주문의 수를 계산하시오.
select salesperson, count(*)
from sales_order
group by salesperson;

-- (7) 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(부속질의를 사용).
insert into sales_customer values('황고객', 'LA', '개발자');
insert into sales_customer values('정고객', 'LA', '요리사');
insert into sales_order values(6, '황고객', '김판매3', 1006);
insert into sales_order values(7, '정고객', '김판매3', 1007);

select name, age
from salesperson
where name in (select salesperson
                from sales_order
                where custname in (select name 
                                    from sales_customer 
                                    where city like 'LA'));

-- (8) 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(조인을 사용).
select distinct sp.name, sp.age
from salesperson sp, sales_order so, sales_customer sc
where sp.name = so.salesperson
and sc.name = so.custname
and sc.city like 'LA';

-- (9) 두 번 이상 주문을 받은 판매원의 이름을 보이시오.
select salesperson 
from sales_order
group by salesperson
having count(*) >= 2;

-- (10) 판매원 'TOM'의 봉급을 45000원으로 변경하는 SQL문을 작성하시오.
insert into salesperson values('TOM', 38, 3800);
update salesperson set salary = 45000 where name like 'TOM';
select * from salesperson where name like 'TOM';









