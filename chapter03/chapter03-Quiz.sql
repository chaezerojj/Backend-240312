-- 1. ���缭���� ���� ����ϴ� ���� ������ ���� sql���� �ۼ��Ͻÿ�.
-- (1) ���� ��ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid=1;

-- (2) ������ 20000�� �̻��� ������ �̸�
select bookname
from book
where price >= 20000;

-- (3) �������� �ѱ��ž�
select sum(saleprice)
from orders
where custid=1;

-- (4) �������� ������ ������ ��
select count(*)
from orders
where custid=1;

-- (5) �������� ������ ������ ���ǻ� ��
select count(*) publisher
from book,orders
where book.bookid = orders.bookid and orders.custid=1;

-- (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, saleprice, (price-saleprice)
from book, orders
where book.bookid = orders.bookid and orders.custid=1;

-- (7) �������� �������� ���� ������ �̸�
select distinct bookname
from book, orders
where book.bookid = orders.bookid and orders.custid not in 1;

-- 2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� sql���� �ۼ��Ͻÿ�.
-- (1) ���缭�� ������ �Ѽ�
select count(*)
from book;

-- (2) ���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�
select count(publisher)
from imported_book;

-- (3) ��� ���� �̸�, �ּ�
select name, address
from customer;

-- (4) 2020�� 7�� 3�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select bookid
from orders
where orderdate between '2020/0703' and '2020/07/07';

-- (5) 2020�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select distinct bookid
from orders
where orderdate not between '2020/0703' and '2020/07/07';

-- (6) ���� '��'���� ���� �̸��� �ּ�
select name, address
from customer
where name like '��_%';

-- (7) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��_��%';
