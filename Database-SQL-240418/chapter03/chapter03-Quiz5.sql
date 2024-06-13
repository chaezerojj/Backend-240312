-- D:\dev\database\workspace\chapter03\chapter03-Quiz5.sql

--[���� �����ͺ��̽�]
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

--(1) �ܼ�����
-- 1. ��� ������ �̸��� ��ġ�� ���̽ÿ�.
select theatername, theaterlocation
from theater;

-- 2. '���'�� �ִ� ������ ���̽ÿ�.
select theatername
from theater
where theaterlocation = '���';

-- 3. '���'�� ��� ���� �̸��� ������������ ���̽ÿ�.
select custname
from customer
where custaddress = '���'
order by custname desc;

-- 4. ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.
select theaterid, cinemaid, movietitle
from cinema
where movieprice <= 8000;

-- 5. ������ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.
select theaterlocation, custaddress
from theater t, customer c
where c.custaddress = t.theaterlocation;

-- (2) ��������
-- 1. ������ ���� �� ���ΰ�?
select count(*)
from theater;

-- 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
select avg(movieprice)
from cinema;

-- 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
select count(*)
from reservation r, customer c
where r.custid = c.custid and date='2020-09-01';

-- (3) �μ�����
-- 1. '����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.
select movietitle
from theater t, cinema ci
where ci.theaterid = t.theaterid and theatername = '����';

-- 2. '����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.
select custname
from customer cu, theater t, reservation r
where r.theaterid = cu.theaterid 
and r.theaterid = t.theaterid
and theatername = '����';

-- 3. '����'������ ��ü ������ ���̽ÿ�.
select sum(movieprice)
from cinema ci, theater t
where ci.theaterid = t.theaterid
and theatername = '����';

-- (4) �׷�����
-- 1. ���庰 �󿵰� ���� ���̽ÿ�.
select theatername, count(cinemaid)
from cineman ci, theater t
where ci.theaterid = t.theaterid
group by theatername;

-- 2. '���'�� �ִ� ������ �󿵰��� ���̽ÿ�.
select cinemaid
from cinema ci, theater t
where ci.theaterid = t.theaterid
and theaterlocation = '���';

-- 3. 2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.
select avg(count(custid))
from reservation
where date = '2020-09-01'
group by custid;

-- 4. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.
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
-- 1. �� ���̺� �����͸� �����ϴ� INSERT���� �ϳ��� ������� ���ÿ�.
insert into theater(theaterid, theatername, theaterlocation)
    values (1, '�Ե�', '���');
insert into cinema(theaterid, cinemaid, movietitle, movieprice, seat)
    values(1, 1, '����� ��ȭ', 15000, 48);
insert into reservation(theaterid, cinemaid, custid, seatnum, date)
    values(3, 2, 3, 15, '2020-09-01');
insert into customer(custid, custname, custaddress)
    values(3, 'ȫ�浿', '����');

-- 2. ��ȭ�� ������ 10%�� �λ��Ͻÿ�.
update cinema
set movieprice = movieprice + (movieprice * 0.1);

-- --------------------------------------------------------------------

-- [�Ǹſ������ͺ��̽�]
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

-- (1) ���̺��� �����ϴ� create���� �����͸� �����ϴ� insert���� �ۼ��Ͻÿ�.
--     ���̺��� ������ Ÿ���� ���Ƿ� ���ϰ�, �����ʹ� �Ʒ� ������ ����� �������� �����Ѵ�.
insert into salesperson(name, age, salary)
    values('TOM', 29, 40000);
insert into order(number, custname, salesperson, amount)
    values(1, 'STEVE', 'TOM', 500);
insert into customer(name, city, industrytype)
    values('STEVE', 'LA', 'developer');

-- (2) ��� �Ǹſ��� �̸��� �޿��� ���̽ÿ�. ��, �ߺ� ���� �����Ѵ�.
select distinct name, salary
from salesperson;

-- (3) ���̰� 30�� �̸��� �Ǹſ��� �̸��� ���̽ÿ�.
select name
from salesperson
where age < 30;

-- (4) 'S'�� ������ ���ÿ� ��� ���� �̸��� ���̽ÿ�.
select custname
from customer
where city like '%S';

-- (5) �ֹ��� �� ���� ��(���� �ٸ� ����)�� ���Ͻÿ�.
select count(distinct custname)
from customer c, order o
where c.name = o.custname;

-- (6) �Ǹſ� ������ ���Ͽ� �ֹ��� ���� ����Ͻÿ�.
select count(salesperson)
from order
group by salesperson;

-- (7) 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�(�μ����Ǹ� ���).
select name, age
from salesperson, customer, order
where name in (
                select salesperson
                from order
                where custname in (select name
                                    from customer
                                    where city like 'LA')
                );
                
-- (8) 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�(������ ���).
select name, age
from salesperson s, customer c, order o
where s.name = o.salesperson
and o.custname = c.name
and c.city like 'LA';

-- (9) �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸��� ���̽ÿ�.
select name
from salesperson s
where 2 <= (
    select count(salesperson)
    from order o
    where o.salesperson = s.name
);

-- (10) �Ǹſ� 'TOM'�� ������ 45000������ �����ϴ� SQL���� �ۼ��Ͻÿ�.
update salesperson
set salary = 45000
where name like 'TOM';

-- --------------------------------------------------------------------

-- [��� ������Ʈ �����ͺ��̽�]
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

-- (1) ���̺��� �����ϴ� create���� �����͸� �����ϴ� insert���� �ۼ��Ͻÿ�.
--     ���̺��� ������ Ÿ���� ���Ƿ� ���ϰ�, �����ʹ� �Ʒ� ������ ����� �������� �����Ѵ�.
insert into employee(empno, name, phoneno, address, sex, position, deptno)
    values (1, 'ȫ�浿', '010-1111-1111', '����', '����', 'IT', 1);
insert into employee(empno, name, phoneno, address, sex, position, deptno)
    values (2, '���ڹ�', '010-2222-2222', '���', '����', 'IT', 1);
insert into employee(empno, name, phoneno, address, sex, position, deptno)
    values (3, '���ڹ�', '010-3333-3333', '���', '����', 'IT', 1);

insert into department(deptno, deptname, manager)
    values (1, '����1��', 'ȫ�浿');
insert into department(deptno, deptname, manager)
    values (2, '����1��', 'ȫ�浿');
insert into department(deptno, deptname, manager)
    values (3, '����1��', 'ȫ�浿');

insert into project(projno, projname, deptno)
    values (1, '������Ʈ1', 1);
    
insert into works(empno, projno, hours_worked)
    values (1, 1, 40);
insert into works(empno, projno, hours_worked)
    values (2, 1, 38);
insert into works(empno, projno, hours_worked)
    values (3, 1, 39);

-- (2) ��� ����� �̸��� ���̽ÿ�.
select name
from employee;

-- (3) ���� ����� �̸��� ���̽ÿ�.
select name
from employee
where sex like '����';

-- (4) ����(manager)�� �̸��� ���̽ÿ�.
select name
from employee
where position like '����';

-- (5) 'IT'�μ����� ���ϴ� ����� �̸��� �ּҸ� ���̽ÿ�.
select name, address
from employee
where position like 'IT';

-- (6) 'ȫ�浿'����(manager) �μ����� ���ϴ� ����� ���� ���̽ÿ�.
select count(name)
from employee e, department d
where e.deptno = d.deptno
and manager = 'ȫ�浿';

-- (7) ������� ���� �ð� ���� �μ���, ��� �̸��� ������������ ���̽ÿ�.
select hours_worked, name, deptname
from works w, employee e, department d
where e.empno = w.empno
and e.dept = d.deptno
group by name, deptname
order by w.hours_worked desc;

-- (8) 2�� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸�, ����� ���� ���̽ÿ�.
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

-- (9) 3�� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�.
select e.name
from employee e, department d
where e.deptno = d.deptno
and 3 >= (
        select count(name)
        from department d2, employee e2
        where e2.deptno = d2.deptno
        and d2.deptno = d.deptno
        );
        















