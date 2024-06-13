-- D:\dev\database\workspace\chapter03\chapter03-Quiz4.sql

-- 극장 데이터베이스
create database movietheater;
create table theater (
    theaterNum number primary key,
    theaterName varchar(20),
    theaterLocation varchar(20)
);
create table cinema (
    theaterNum number not null,
    cinemaNum number primary key,
    title varchar(20),
    price number,
    seat number,
    foreign key (theaterNum) references theater (theaterNum)
);
create table user (
    userNum number not null,
    userName varchar2(20),
    userAddress varchar2(20)
);
create table reservation (
    theaterNum number not null,
    cinemaNum number not null,
    userNum number not null,
    seatNum number,
    date number,
    foreign key (theaterNum) references theater (theaterNum),
    foreign key (cinemaNum) references cinema (cinemaNum),
    foreign key (userNum) references user (userNum)
);

-- 제약조건: 영화가격은 20000원을 넘지 않아야 한다.
-- 상영관번호는 1부터 10 사이이다
-- 같은 사람이 같은 좌석번호를 두번 예약하지 않아야 한다.

-- --------------------------------------------------------------------
-- 판매원 데이터베이스
create database sale;

create table salesperson (
    name varchar2(20) primary key,
    age number,
    salary number
);
create table customer (
    name varchar2(20) primary key,
    city varchar2(20),
    industrytype varchar2(20)
);
create table order (
    onumber number,
    custname varchar2(20) not null,
    salesperson varchar(20) not null,
    amount number,
    foreign key (salesperson) references salesperson (name)
    foreign key (custname) references customer (name)
);

-- --------------------------------------------------------------------
-- 기업 프로젝트 데이터베이스
create database company;

create table employee(
    empno number primary key,
    name varchar2(20),
    phoneno varchar2(20),
    address varchar2(20),
    sex varchar2(20),
    position varchar2(20),
    deptno varchar2(20) primary key
);
create table department (
    deptno varchar2(20) not null,
    deptname varchar2(20),
    manager varchar2(20),
    foreign key (deptno) references employee (deptno)
);
create table project (
    projno varchar2(20) primary key,
    projname varchar2(20),
    deptno varchar2(20)
);
create table works (
    empno varchar2(20) not null,
    projno varchar2(20) not null,
    hours-worked varchar2(20),
    foreign key (empno) references employee (empno),
    foreign key (projno) references project (projno)
);





