-- D:\dev\database\workspace\chapter04\chapter04-02.sql

-- ��� sql �ۼ�

-- 02. �μ�����
-- �Ϲ������� �����Ͱ� �뷮�� ���, �����͸� ��� ���ļ� �����ϴ� ���κ���
-- �ʿ��� �����͸� ã�Ƽ� �������ִ� �μ����ǰ� ������ �� ����
-- e.g., ���缭�� ������ �ֹ��� ���� �̸��� �˻��Ͻÿ�.
--      >> ���̸��� �ֹ������� ���� ������ orders���̺�� customer���̺��� �������Ѿ� ��
--         ?������ ����� ���, 
--         customer���̺�� orders���̺��� ����ȣ�� ������ �� �ʿ��� ������ ����
--         ?�μ����Ǹ� ����� ���,
--         customer ���̺��� ������ ���� ����ȣ�� ã��
--         ã�� ����ȣ�� �������� orders ���̺��� Ȯ��

-- �μ�����: sql�� �ȿ� �ٸ� sql���� ��ø�� ����
-- �� ����(main query, �ܺ�����)�� �μ�����(subquery, ��������)�� ������

-- ! select �μ�����, from �μ�����, where �μ�����
-- * ��ø���� 
-- : where�� 
-- - nested subquery, predicate subquery
-- - where���� ����� �Բ� ���Ǹ� ����� ������Ű�� ���� ����

-- * ��Į�� �μ�����
-- : select��
-- - scalar subquery
-- - select���� ���Ǹ� ���� ���� ��ȯ�ϱ� ������ ��Į�� �μ����Ƕ�� ��

-- * �ζ��� ��
-- : from ��
-- - inline view, table subquery
-- - from������ ����� ��(view)���·� ��ȯ�ϱ� ������ �ζ��� ���� ��

-- 1. ��ø���� - where �μ����� 
-- ��ø���� �������� ����
-- : �� (/, =, >, <, <=, >=, <>), ����(in, not in), ���� (all, some(any)),
--   ���� (exists, not exists)

-- (1) �� ������
--  - �μ����� ����� �ݵ�� ���� ��, ���� ���� ��ȯ�ؾ� ��
--  - ó�������� �� ������ ��� �� �Ӽ��� ���� �μ������� ������� 
--    �񱳿����ڿ� �����Ͽ� ���̸� �� ������ �ش� �� ���
--  ? ��� �ֹ� �ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid, saleprice 
from orders
where saleprice <= (select avg(saleprice) from orders);
--  ? �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ������� ���ؼ�
--    �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�.
select orderid, custid, saleprice from orders
where saleprice > (select avg(saleprice) from orders);

-- (2) in, not in ������
--  * in ������
--  - in �� �� ������ �Ӽ����� �μ����ǿ��� ������ ��� ���տ� �ִ��� Ȯ���ϴ� ����
--  - in �����ڿ��� ��밡���� �μ����Ǵ� ����� ���� ��, ���� �� ��ȯ ����
--  - where���� ���Ǵ� �Ӽ����� �μ������� ��� ���հ� ���� �ϳ��� ������ ���� ��
--  * not in ������
--  - not in �����ڴ� ���� �������� ������ ���� ��
-- ? ���ѹα��� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) from orders
where custid in (select custid 
                from customer 
                where address like '%���ѹα�%');
                
-- (3) all, some(any) ������
--  - all, some(any) �����ڴ� �񱳿����ڿ� �Բ� ����
--  - all�� ���, some�� ���(�ּ��� �ϳ���)�̶�� �ǹ̸� ����
--  - any�� some�� ������ ����� ��
--  - ���� ����
--  : ���̸� {�񱳿�����}{all | some | any}(�μ�����)
-- ? 3������ �ֹ��� ������ �ְ� �ݾ׺��� 
--   �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid, saleprice 
from orders
where saleprice > all (select saleprice 
                        from orders where custid=3);

-- (4) exists, not exists ������
--  - ���翬����
--  - �������� ���� ���θ� Ȯ��
--  - exists >> �� ���ǿ��� �μ����Ƿ� ������ �Ӽ��� ���� ������ �μ������� ������ �����Ͽ�
--              ���� �����ϸ� ���� �ǰ�, �� ���Ǵ� �ش� ���� �����͸� ���
--  - not exist�� ���� �̿� �ݴ�� ������
--  - ���� ����
--  : where [not] exists (�μ�����)
--  - exists �����ڴ� ���ʿ� ���� ������� ����
--  - �ݵ�� �μ����ǿ� �� ������ ���̸��� �����Ǿ�� ��
--  ? exists �����ڸ� ����Ͽ� '���ѹα�'�� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) 
from orders o
where exists (select * from customer c
                where address like '%���ѹα�%'
                and c.custid = o.custid);

-- 2. ��Į�� �μ����� - select �μ�����
-- : select������ ���Ǵ� �μ�����
-- - �μ������� ������� ���� ��, ���� ���� ������ ��ȯ��
-- - ��Į��: �ϳ��� ���ڷθ� ǥ�õǴ� ��
-- ? ���缭���� ���� �Ǹž��� ���̽ÿ�. (���̸��� ���� �Ǹž� ���)
select (select name from customer c where c.custid = o.custid)
from orders o;
select (select name 
        from customer c 
        where c.custid = o.custid), sum(saleprice) 
from orders o
group by custid;
-- ��Į�� �μ����Ǵ� select���� �Բ� update�������� ��� ����
-- orders ���̺� ���ο� �Ӽ��� ���� �̸��� �߰�
alter table orders add bookname varchar2(40);
select * from orders;
-- >> ��� ������ ���Ͽ� �����̸��� �����ؾ� ��
-- e.g., update orders set bookname='�ǰ� ����' where bookid=1;
-- >> �̷��� ������ ��� ������ ���Ͽ� ������ ó���ؾ� �ϹǷ� ��ȿ����
-- >> ��Į�� �μ����Ǹ� ����Ͽ� �����̸��� �ϰ� ���� ó��

-- orders ���̺� �� �ֹ��� �´� ���� �̸��� �Է�
update orders set bookname = (
    select bookname
    from book
    where book.bookid = orders.bookid);
select * from orders;

-- 3. �ζ��� �� - from�� �μ�����
-- �� - ���� ���̺�κ��� �Ͻ������� ������� ������ ���̺�
-- ����ȣ�� 2������ ���� �Ǹž��� ���̽ÿ�. (���̸��� ���� �Ǹž� ���)
select c.name, sum(o.saleprice)
from (select custid, name
        from customer where custid <= 2) c,
orders o
where c.custid = o.custid
group by c.name;
-- customer ���̺��� �ʿ��� �����͸� �̾� ���ν�ų �� �����Ƿ�
-- ó�� ������ ���� �� ����




















