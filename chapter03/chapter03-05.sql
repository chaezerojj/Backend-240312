-- D:\dev\database\workspace\chapter03\chapter03-05.sql

-- ��������
-- 1
-- (1) ���� ��ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid = 1;
-- (2) ������ 20000�� �̻��� ������ �̸�
select bookname
from book
where price >= 20000;
-- (3) �������� �ѱ��ž� (�������� custid=1)
select * from customer;
select sum(saleprice)
from orders
where custid=1;
-- (4) �������� ������ ������ ��
select count(*)
from orders
where custid=1;
-- (5) �������� ������ ������ ���ǻ� ��
-- �������� ������ ������ ���̵� 1, 2, 3
select count(distinct publisher)
from book
where bookid in (1, 2, 3);
-- (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select sum(price)
from book
where bookid in (1, 2, 3); -- 42000��
select sum(saleprice)
from orders
where custid=1; -- 39000��

-- 2
-- (1)
select count(*)
from book;
-- (2)
select count(distinct publisher)
from imported_book;
-- (3)
select name, address
from customer;
-- (4)
select bookid
from orders
where orderdate between '2020/07/03' and '2020/07/07';
-- (5)
select bookid
from orders
where orderdate not between '2020/07/03' and '2020/07/07';
--(6)
select name, address
from customer
where name like '��%';
-- (7)
select name, address
from customer
where name like '��%��';