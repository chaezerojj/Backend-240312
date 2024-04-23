-- D:\dev\database\workspace\chapter03\chapter03-12.sql

-- quiz4 풀이

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
    cusid number,
    seatnumber number unique,
    rdate date,
    primary key (ttid, cid, custid)
);
-- 고객 테이블
-- 문자열 크기: byte
-- 예) varchar2(20)
--    = 20byte -> 유니코드(unicode)는 한글자에 20바이트
--    10글자정도 넣을 수 있는 크기
create table customer (
    cusid number primary key,
    cusname varchar2(50),
    cusaddr varchar2(300)
);


-- [판매원 데이터베이스]
-- 판매원 테이블
create table salesperson(
    name varchar2(100) primary key,
    age number,
    salary number
);
-- 주문 테이블
create table order(
    onumber number,
    custname varchar2(50),
    salesperson varchar2(20),
    amount number,
    primary key (custname, salesperson),
    foreign key (custname) references customer (name),
    foreign key (salesperson) references salesperson (name)
);
-- 고객 테이블 생성
create table customer(
    name varchar2(50) primary key,
    city varchar2(50),
    industrytype varchar2(50)
);

-- [기업 프로젝트 데이터베이스]
-- 직원 테이블
create table employee (
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    positon varchar2(50),
    deptno number
);
-- 부서 테이블
create table department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar2(10)
);
-- 프로젝트 테이블
create table project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);
-- 작업 테이블
create table works(
    empno number,
    projno number,
    hours_worked number,
    primary key (empno, projno),
    foreign key (empno) references employy (empno),
    foreign key (projno) references project (projno)
);




