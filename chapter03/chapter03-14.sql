-- D:\dev\database\workspace\chapter03\chapter03-14.sql

-- �������� Ǯ��

-- [���� �����ͺ��̽�]
-- �������̺�
create table theater (
    ttid number primary key,
    ttname varchar2(20),
    ttlocation varchar2(30)
);
-- �󿵰� ���̺�
create table cinema (
    ttid number,
    cid number,
    moviename varchar2(40),
    movieprice number check (movieprice < 20000), -- 20000���� ���� �ʾƾ� ��
    chairnumber number,
    primary key (ttid, cid)
);
-- ���� ���̺�
-- �󿵰� ��ȣ�� 1���� 10�����̴�
-- ���� ����� ���� �¼���ȣ�� �ι� �������� �ʾƾ� �Ѵ�
create table reservation (
    ttid number, 
    cid number check (cid >= 1) check (cid <= 10),
    custid number,
    seatnumber number unique,
    rdate date,
    primary key (ttid, cid, custid)
);
-- �� ���̺�
create table movie_customer (
    cusid number primary key,
    cusname varchar2(50),
    cusaddr varchar2(300)
);

-- ���� ������
insert into theater values (1, '�Ե�', '���');
insert into theater values (2, '�ް�', '����');
insert into theater values (3, '����', '���');
select * from theater;
-- �󿵰� ������
insert into cinema values(1, 1, '����� ��ȭ', 15000, 48);
insert into cinema values(3, 1, '���� ��ȭ', 7500, 120);
insert into cinema values(3, 2, '��մ� ��ȭ', 8000, 110);
select * from cinema;

-- ���� ������
insert into reservation values(3, 2, 3, 15, '2020-09-01');
insert into reservation values(3, 1, 4, 16, '2020-09-01');
insert into reservation values(1, 1, 9, 48, '2020-09-01');

-- �� ������
insert into movie_customer values (3, 'ȫ�浿', '����');
insert into movie_customer values (4, '��ö��', '���');
insert into movie_customer values (9, '�ڿ���', '����');
select * from movie_customer;

--(1) �ܼ�����
-- 1. ��� ������ �̸��� ��ġ�� ���̽ÿ�.
select ttname, ttlocation from theater;

-- 2. '���'�� �ִ� ������ ���̽ÿ�.
select *
from theater
where ttlocation like '���';

-- 3. '���'�� ��� ���� �̸��� ������������ ���̽ÿ�.
select cusname
from movie_customer
where cusaddr like '���' 
order by cusname;

-- 4. ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.
select ttid, cid, moviename
from cinema
where movieprice <= 8000;

-- 5. ������ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.
select mc.cusname, t.ttlocation, mc.cusaddr
from movie_customer mc, theater t
where mc.cusaddr = t.ttlocation;

-- (2) ��������
-- 1. ������ ���� �� ���ΰ�?
select count(*)
from theater;

-- 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
select avg(movieprice)
from cinema;

-- 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
select count(*)
from movie_customer mc, reservation r
where mc.cusid = r.custid
and r.rdate = '2020-09-01';
select * from reservation;

-- (3) �μ�����
-- 1. '����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.
select moviename
from cinema
where ttid = (select ttid
                from theater
                where ttname like '����');

-- 2. '����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.
select cusname
from theater t, movie_customer mc, reservation r
where t.ttid = r.ttid
and r.custid = mc.cusid
and t.ttname like '����';

-- 3. '����'������ ��ü ������ ���̽ÿ�.
select sum(c.movieprice)
from cinema c, theater t
where t.ttid = c.ttid
and t.ttname like '����';

-- (4) �׷�����
-- 1. ���庰 �󿵰� ���� ���̽ÿ�.
select ttid, count(*)
from cinema
group by ttid;

-- 2. '���'�� �ִ� ������ �󿵰��� ���̽ÿ�.
select *
from theater t, cinema c
where t.ttid = c.ttid
and t.ttlocation like '���';

-- 3. 2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.
select avg(count(custid))
from reservation
where rdate = '2020-09-01'
group by custid;
select * from reservation;

-- 4. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.


--(5) DML
-- 1. �� ���̺� �����͸� �����ϴ� INSERT���� �ϳ��� ������� ���ÿ�.
--   �󿵰� ������ ����
insert into cinema values(1, 11, '���˵���4', 15000, 58);
--   �� ������ ����
insert into movie_customer values(22, '���', '����');
--   ���� ������ ����
insert into reservation values (1, 10, 22, 7, '2024-04-24');
--   ���� ������ ����
insert into theater values (33, '�Ե�', '����');

-- 2. ��ȭ�� ������ 10%�� �λ��Ͻÿ�.
update cinema set movieprice = movieprice * 1.1;




