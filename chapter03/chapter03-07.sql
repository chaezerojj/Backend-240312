-- D:\dev\database\workspace\chapter03\chapter03-07.sql

-- �μ�����
-- : sql�� ���� �� �ٸ� sql���� �ۼ���
-- e.g., ������ ���� ��� ������ �̸��� ���ΰ�?
select max(price)
from book;

-- ���� ��� �������� �����̸� ���ϱ�]
select bookname
from book
where price=35000;

-- ���� ��� �����̸��� ���̽ÿ� (�μ����� ���)
select bookname -------------------- 2
from book 
where price =
(select max(price) from book); ----- 1
-- ��ȣ�� ��� sql���� ��ø��Ű�� ���� �μ�����(subquery)��� ��
-- �μ����Ǵ� ���ǰ� ��ø�Ǿ� �ִٴ� �ǹ̿��� ��ø����(nested query)��� ��
-- �μ������� ���� ������ where���� �μ����Ǹ� ���� ó���ϰ� ��ü���Ǹ� ó����

-- �μ����Ǵ� sql���̴�
-- sql���� ����� ���̺�
-- ���̺��� ����� 4���� �� �ϳ��� ��
-- ������-���Ͽ�(1x1), ������-���Ͽ�(nx1), ������-���߿�(1xn), ������-���߿�(nxn)

-- �μ������� ����� ������-���Ͽ��� ���� ���� ���� ��ȯ�ϸ�
-- �տ��� ��� inŰ���带 �����

-- e.g., ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
-- ������ ������ ���� �ִ� �� ��ȸ
select custid
from orders;
select name
from customer
where custid in (1, 2, 3, 4);
-- ������ ������ ���� �ִ� �� ��ȸ(�μ�����)
select name
from customer
where custid in (select custid 
                        from orders);
                        
-- 3�� �̻��� ��ø�� �μ����ǵ� ����

-- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
select name
from customer
where custid in (select custid
                    from orders
                    where bookid in (select bookid
                                        from book
                                        where publisher='���ѹ̵��'));

-- ���� ������ ���� �������Ǹ� ���� �����ϰ� �� ����� �̿��Ͽ� ���� �μ����Ǹ� ������

-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
select b1.bookname
from book b1 -- ���̺��� ��Ī�� �� �� ���� 
where b1.price > (select avg(b2.price)
                        from book b2
                        where b2.publisher = b1.publisher);

