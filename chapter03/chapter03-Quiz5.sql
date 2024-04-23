-- D:\dev\database\workspace\chapter03\chapter03-Quiz5.sql

--[극장 데이터베이스]
--create database theater;

create table theater(
    theaterid number primary key,
    theatername varchar2(20),
    theaterlocation varchar2(30)
);

create table cinema(
    theaterid number,
    cinemaid number primary key,
    movietitle varchar2(40),
    movieprice number check (movieprice < 20000),
    seatcount number,
    primary key (theaterid, cinemaid)
);

create table reservation (
    theaterid number,
    cinemaid number,
    custid number primary key,
    seatnum number,
    date date,
    primary key (theaterid, cinemaid, custid)
);

create table customer(
    custid number,
    custname varchar2(50),
    custaddress varchar2(200),
    primary key (custid)
);

--(1) 단순질의
-- 1. 모든 극장의 이름과 위치를 보이시오.
select theatername, theaterlocation
from theater;

-- 2. '잠실'에 있는 극장을 보이시오.
select theatername
from theater
where theaterlocation = '잠실';

-- 3. '잠실'에 사는 고객의 이름을 오름차순으로 보이시오.
select custname
from customer
where custaddress = '잠실'
order by custname desc;

-- 4. 가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
select theaterid, cinemaid, movietitle
from cinema
where movieprice <= 8000;

-- 5. 극장위치와 고객의 주소가 같은 고객을 보이시오.
select theaterlocation, custaddress
from theater t, customer c
where c.custaddress = t.theaterlocation;

-- (2) 집계질의
-- 1. 극장의 수는 몇 개인가?
select count(*)
from theater;

-- 2. 상영되는 영화의 평균 가격은 얼마인가?
select avg(movieprice)
from cinema;

-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
select count(*)
from reservation r, customer c
where r.custid = c.custid and date='2020-09-01';

-- (3) 부속질의
-- 1. '대한'극장에서 상영된 영화제목을 보이시오.
select movietitle
from theater t, cinema ci
where ci.theaterid = t.theaterid and theatername = '대한';

-- 2. '대한'극장에서 영화를 본 고객의 이름을 보이시오.
select custname
from customer cu, theater t, reservation r
where r.theaterid = cu.theaterid 
and r.theaterid = t.theaterid
and theatername = '대한';

-- 3. '대한'극장의 전체 수입을 보이시오.
select sum(movieprice)
from cinema ci, theater t
where ci.theaterid = t.theaterid
and theatername = '대한';

-- (4) 그룹질의
-- 1. 극장별 상영관 수를 보이시오.
select theatername, count(cinemaid)
from cineman ci, theater t
where ci.theaterid = t.theaterid
group by theatername;

-- 2. '잠실'에 있는 극장의 상영관을 보이시오.
select cinemaid
from cinema ci, theater t
where ci.theaterid = t.theaterid
and theaterlocation = '잠실';

-- 3. 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.
select avg(count(custid))
from reservation
where date = '2020-09-01'
group by custid;

-- 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.
select movietitle
from cinema ci, reservation r
where ci.theaterid = r.theaterid
and ci.cinemaid = r.cinemaid
and date='2020-09-01'
having count(*) = (
    select max(movietitle)
    from cinema ci, reservation r
    where ci.theaterid = r.theaterid
    and ci.cinemaid = r.cinemaid
    and date='2020-09-01'
    group by r.theaterid, ci.theaterid);

--(5) DML
-- 1. 각 테이블에 데이터를 삽입하는 INSERT문을 하나씩 실행시켜 보시오.
insert into theater(theaterid, theatername, theaterlocation)
    values (1, '롯데', '잠실');
insert into cinema(theaterid, cinemaid, movietitle, movieprice, seat)
    values(1, 1, '어려운 영화', 15000, 48);
insert into reservation(theaterid, cinemaid, custid, seatnum, date)
    values(3, 2, 3, 15, '2020-09-01');
insert into customer(custid, custname, custaddress)
    values(3, '홍길동', '강남');

-- 2. 영화의 가격을 10%씩 인상하시오.
update cinema
set movieprice = movieprice + (movieprice * 0.1);

-- --------------------------------------------------------------------

-- [판매원데이터베이스]
-- create database sale;

create table salesperson(
    name varchar2(50) primary key,
    age number,
    salary number
);
create table order(
    number number,
    custname varchar2(50),
    salesperson varchar2(50),
    amount number,
    primary key (custname, salesperson),
    foreign key (custname) references customer (name),
    foreign key (salesperson) references salesperson (name)
);
create table customer(
    name varchar2(50) primary key,
    city varchar2(50),
    industrytype varchar2(50)
);

-- (1) 테이블을 생성하는 create문과 데이터를 삽입하는 insert문을 작성하시오.
--     테이블의 데이터 타입은 임의로 정하고, 데이터는 아래 질의의 결과가 나오도록 삽입한다.
insert into salesperson(name, age, salary)
    values('TOM', 29, 40000);
insert into order(number, custname, salesperson, amount)
    values(1, 'STEVE', 'TOM', 500);
insert into customer(name, city, industrytype)
    values('STEVE', 'LA', 'developer');

-- (2) 모든 판매원의 이름과 급여를 보이시오. 단, 중복 행은 제거한다.
select distinct name, salary
from salesperson;

-- (3) 나이가 30세 미만의 판매원의 이름을 보이시오.
select name
from salesperson
where age < 30;

-- (4) 'S'로 끝나는 도시에 사는 고객의 이름을 보이시오.
select custname
from customer
where city like '%S';

-- (5) 주문을 한 고객의 수(서로 다른 고객만)를 구하시오.
select count(distinct custname)
from customer c, order o
where c.name = o.custname;

-- (6) 판매원 각각에 대하여 주문의 수를 계산하시오.
select count(salesperson)
from order
group by salesperson;

-- (7) 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(부속질의를 사용).
select name, age
from salesperson, customer, order
where name in (
                select salesperson
                from order
                where custname in (select name
                                    from customer
                                    where city like 'LA')
                );
                
-- (8) 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오(조인을 사용).
select name, age
from salesperson s, customer c, order o
where s.name = o.salesperson
and o.custname = c.name
and c.city like 'LA';

-- (9) 두 번 이상 주문을 받은 판매원의 이름을 보이시오.
select name
from salesperson s
where 2 <= (
    select count(salesperson)
    from order o
    where o.salesperson = s.name
);

-- (10) 판매원 'TOM'의 봉급을 45000원으로 변경하는 SQL문을 작성하시오.
update salesperson
set salary = 45000
where name like 'TOM';

-- --------------------------------------------------------------------

-- [기업 프로젝트 데이터베이스]
-- create database company;

create table employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex varchar2(10),
    position varchar2(50),
    deptno number
);

create table department (
    deptno number primary key,
    deptname varchar2(50),
    manager varchar2(10)
);

create table project (
    projno number primary key,
    projname varchar2(50),
    deptno number
);

create table works(
    empno number primary key,
    projno number primary key,
    hours_worked number
);

-- (1) 테이블을 생성하는 create문과 데이터를 삽입하는 insert문을 작성하시오.
--     테이블의 데이터 타입은 임의로 정하고, 데이터는 아래 질의의 결과가 나오도록 삽입한다.
insert into employee(empno, name, phoneno, address, sex, position, deptno)
    values (1, '홍길동', '010-1111-1111', '강남', '남성', 'IT', 1);
insert into employee(empno, name, phoneno, address, sex, position, deptno)
    values (2, '김자바', '010-2222-2222', '잠실', '여성', 'IT', 1);
insert into employee(empno, name, phoneno, address, sex, position, deptno)
    values (3, '박자바', '010-3333-3333', '잠실', '남성', 'IT', 1);

insert into department(deptno, deptname, manager)
    values (1, '개발1팀', '홍길동');
insert into department(deptno, deptname, manager)
    values (2, '개발1팀', '홍길동');
insert into department(deptno, deptname, manager)
    values (3, '개발1팀', '홍길동');

insert into project(projno, projname, deptno)
    values (1, '프로젝트1', 1);
    
insert into works(empno, projno, hours_worked)
    values (1, 1, 40);
insert into works(empno, projno, hours_worked)
    values (2, 1, 38);
insert into works(empno, projno, hours_worked)
    values (3, 1, 39);

-- (2) 모든 사원의 이름을 보이시오.
select name
from employee;

-- (3) 여자 사원의 이름을 보이시오.
select name
from employee
where sex like '여성';

-- (4) 팀장(manager)의 이름을 보이시오.
select name
from employee
where position like '팀장';

-- (5) 'IT'부서에서 일하는 사원의 이름과 주소를 보이시오.
select name, address
from employee
where position like 'IT';

-- (6) '홍길동'팀장(manager) 부서에서 일하는 사원의 수를 보이시오.
select count(name)
from employee e, department d
where e.deptno = d.deptno
and manager = '홍길동';

-- (7) 사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 보이시오.
select hours_worked, name, deptname
from works w, employee e, department d
where e.empno = w.empno
and e.dept = d.deptno
group by name, deptname
order by w.hours_worked desc;

-- (8) 2명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수를 보이시오.
select projno, projname, count(e1.empno)
from project p, employee e1
where p.deptno = e.deptno
and 2 >= (
        select count(empno)
        from employee e2, department d
        where e2.deptno = d.deptno
        and e1.empno = e2.empno
        )
group by projno, projname;

-- (9) 3명 이상의 사원이 있는 부서의 사원 이름을 보이시오.
select e.name
from employee e, department d
where e.deptno = d.deptno
and 3 >= (
        select count(name)
        from department d2, employee e2
        where e2.deptno = d2.deptno
        and d2.deptno = d.deptno
        );
        















