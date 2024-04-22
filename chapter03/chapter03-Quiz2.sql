-- D:\dev\database\workspace\chapter03\chapter03-Quiz2.sql

-- �������� �ѱ��ž�
select sum(saleprice)
from orders, customer
where customer.custid = orders.custid and customer.name like '������';

-- �������� ������ ������ ��
select count(*)
from orders
where custid = 1;

select count(*)
from customer c, orders o
where c.custid = o.custid and c.name like '������';

-- �������� ������ ������ ���ǻ� ��
select count(*) publisher
from book, orders
where book.bookid = orders.bookid and orders.custid = 1;

select count(distinct publisher)
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and c.name like '������';

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, price, price-saleprice
from book, orders
where book.bookid = orders.bookid and orders.custid=1;

select bookname, price, price-saleprice
from customer c, orders o, book b
where c.custid = o.custid
and o.bookid = b.bookid and c.name like '������';

-- �������� �������� ���� ������ �̸�
select distinct bookname
from book, orders
where book.bookid = orders.bookid and not orders.custid = 1;

select distinct b.bookname
from book b, orders o, customer c
where b.bookid = o.bookid
and c.custid = o.custid and c.name != '������';

-- ���� �̸��� ���� ���ž�
select name, sum(saleprice)
from orders o, customer c
where o.custid = c.custid
group by name;

-- ���� �̸��� ���� ������ �������
select name, bookname
from customer, book, orders
where orders.custid = customer.custid and book.bookid = orders.bookid
order by name;

select c.name, b.bookname
from customer c, book b, orders o
where o.custid = c.custid and b.bookid = o.bookid;

-- ������ ����(Book���̺�)�� �ǸŰ���(Orders���̺�)�� ���̰� ���� ���� �ֹ�
select *
from book, orders
where book.bookid = orders.bookid 
    and (price - saleprice) in (select max(price - saleprice)
                                from book, orders
                                where book.bookid = orders.bookid);
                                
select *
from book b, orders o
where b.bookid = o.bookid
and price - saleprice = (select max(price - saleprice)
                        from book b, orders o
                        where b.bookid = o.bookid);

-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�***
select name, avg(saleprice)
from customer c, orders o
where c.custid = o.custid
group by name
having avg(saleprice) > (select avg(saleprice)
                        from orders);--������ �Ǹž� ���

-- ���缭������ ������ ��ȭ�� ������ ���� sql���� �ۼ��Ͻÿ�.
--(1) �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select name
from customer, book, orders
where customer.custid = orders.custid and book.bookid = orders.bookid
and not name in '������'
and publisher in (select publisher
                        from book, orders
                        where book.bookid = orders.bookid and orders.custid = 1);
                        
select c.name
from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid
and name not like '������'
and publisher in (select b.publisher
                    from customer c, orders o, book b
                    where b.bookid = o.bookid and o.custid = c.custid
                    and name like '������'); -- �������� �����ϳ� ������ ���ǻ�

--(2) �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select name
from customer, book, orders
where customer.custid = orders.custid  and book.bookid = orders.bookid
group by customer.name
having count(distinct publisher) >= 2;

select c.name, count(b.publisher)
from customer c, book b, orders o
where c.custid = o.custid
and b.bookid = o.bookid
group by name
having count(distinct b.publisher) >= 2;

--(3) ��ü ���� 30% �̻��� ������ ����***
select distinct bookname
from book b1, orders o1
where (
        (select count (b2.bookid)
        from book b2, orders o2
        where b2.bookid=o2.bookid
        and b1.bookid = b2.bookid)
        >= 0.3 *(
        select count(*)
        from customer
        )
);

--SELECT DISTINCT book.BOOKNAME
--FROM book, ORDERS
--WHERE ORDERS.BOOKID = BOOK.BOOKID
--GROUP BY BOOKNAME
--HAVING COUNT() >= (SELECT count() custid FROM customer)*30/100;
