-- D:\dev\database\workspace\chapter03\chapter03-14.sql

-- 연습문제 풀이

-- [극장 데이터베이스]
-- 극장테이블
create table theater (
    ttid number primary key,
    ttname varchar2(20),
    ttlocation varchar2(30)
);
-- 상영관 테이블
create table cinema (
    ttid number,
    cid number,
    moviename varchar2(40),
    movieprice number check (movieprice < 20000), -- 20000원을 넘지 않아야 함
    chairnumber number,
    primary key (ttid, cid)
);
-- 예약 테이블
-- 상영관 번호는 1부터 10사이이다
-- 같은 사람이 같은 좌석번호를 두번 예약하지 않아야 한다
create table reservation (
    ttid number, 
    cid number check (cid >= 1) check (cid <= 10),
    custid number,
    seatnumber number unique,
    rdate date,
    primary key (ttid, cid, custid)
);
-- 고객 테이블
create table movie_customer (
    cusid number primary key,
    cusname varchar2(50),
    cusaddr varchar2(300)
);

-- 극장 데이터
insert into theater values (1, '롯데', '잠실');
insert into theater values (2, '메가', '강남');
insert into theater values (3, '대한', '잠실');
select * from theater;
-- 상영관 데이터
insert into cinema values(1, 1, '어려운 영화', 15000, 48);
insert into cinema values(3, 1, '멋진 영화', 7500, 120);
insert into cinema values(3, 2, '재밌는 영화', 8000, 110);
select * from cinema;

-- 예약 데이터
insert into reservation values(3, 2, 3, 15, '2020-09-01');
insert into reservation values(3, 1, 4, 16, '2020-09-01');
insert into reservation values(1, 1, 9, 48, '2020-09-01');

-- 고객 데이터
insert into movie_customer values (3, '홍길동', '강남');
insert into movie_customer values (4, '김철수', '잠실');
insert into movie_customer values (9, '박영희', '강남');
select * from movie_customer;

--(1) 단순질의
-- 1. 모든 극장의 이름과 위치를 보이시오.
select ttname, ttlocation from theater;

-- 2. '잠실'에 있는 극장을 보이시오.
select *
from theater
where ttlocation like '잠실';

-- 3. '잠실'에 사는 고객의 이름을 오름차순으로 보이시오.
select cusname
from movie_customer
where cusaddr like '잠실' 
order by cusname;

-- 4. 가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
select ttid, cid, moviename
from cinema
where movieprice <= 8000;

-- 5. 극장위치와 고객의 주소가 같은 고객을 보이시오.
select mc.cusname, t.ttlocation, mc.cusaddr
from movie_customer mc, theater t
where mc.cusaddr = t.ttlocation;

-- (2) 집계질의
-- 1. 극장의 수는 몇 개인가?
select count(*)
from theater;

-- 2. 상영되는 영화의 평균 가격은 얼마인가?
select avg(movieprice)
from cinema;

-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
select count(*)
from movie_customer mc, reservation r
where mc.cusid = r.custid
and r.rdate = '2020-09-01';
select * from reservation;

-- (3) 부속질의
-- 1. '대한'극장에서 상영된 영화제목을 보이시오.
select moviename
from cinema
where ttid = (select ttid
                from theater
                where ttname like '대한');

-- 2. '대한'극장에서 영화를 본 고객의 이름을 보이시오.
select cusname
from theater t, movie_customer mc, reservation r
where t.ttid = r.ttid
and r.custid = mc.cusid
and t.ttname like '대한';

-- 3. '대한'극장의 전체 수입을 보이시오.
select sum(c.movieprice)
from cinema c, theater t
where t.ttid = c.ttid
and t.ttname like '대한';

-- (4) 그룹질의
-- 1. 극장별 상영관 수를 보이시오.
select ttid, count(*)
from cinema
group by ttid;

-- 2. '잠실'에 있는 극장의 상영관을 보이시오.
select *
from theater t, cinema c
where t.ttid = c.ttid
and t.ttlocation like '잠실';

-- 3. 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.
select avg(count(custid))
from reservation
where rdate = '2020-09-01'
group by custid;
select * from reservation;

-- 4. 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.


--(5) DML
-- 1. 각 테이블에 데이터를 삽입하는 INSERT문을 하나씩 실행시켜 보시오.
--   상영관 데이터 삽입
insert into cinema values(1, 11, '범죄도시4', 15000, 58);
--   고객 데이터 삽입
insert into movie_customer values(22, '김고객', '마포');
--   예약 데이터 삽입
insert into reservation values (1, 10, 22, 7, '2024-04-24');
--   극장 데이터 삽입
insert into theater values (33, '롯데', '마포');

-- 2. 영화의 가격을 10%씩 인상하시오.
update cinema set movieprice = movieprice * 1.1;




