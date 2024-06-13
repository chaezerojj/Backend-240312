-- D:\dev\database\workspace\chapter03\chapter03-04.sql

-- ���� �Լ��� group by �˻�
-- ����� ���� ����� �ǹ̷� �����ͺ��̽������� ��躸�� ������ �� �����
-- ���� �Ǹ� �Ѿ�, �Ϻ� �Ǹŷ� �� ����� ����
-- �����ϱ� ���ؼ��� group by ���� ����ϰ� ��ü���� ���� ����� ���� �Լ��� �����

-- ���� �Լ�
-- sum / sum([all|distinct] �Ӽ��̸�) / �հ�
-- avg / avg([all|distinct] �Ӽ��̸�) / ���
-- count / count([all|distinct] �Ӽ��̸� | *) / ����
-- max / max([all|distinct] �Ӽ��̸�) / �ִ밪
-- min / min([all|distinct] �Ӽ��̸�) / �ּҰ�

-- ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select * from orders;
select sum(saleprice)
from orders;

-- sql������ sum(saleprice)�� ����� �����͸� �����Ͽ� ���� ���ο� ��� ���̱� ������
-- ��� ���̺� ������ �̸� ���� 'sum(saleprice)'��� ��µ�
-- �ǹ��ִ� �� �̸��� ����ϰ� �ʹٸ� �Ӽ��̸��� ��Ī�� ��Ī�ϴ� asŰ���� ����Ͽ� �� �̸� �ο�
select sum(saleprice) as �Ѹ���
from orders;

-- �ֱ� ������ dbms������ as Ű���带 ������ �� ����
select sum(saleprice) �Ѹ���
from orders;
select sum(saleprice) "��ü����"
from orders;

-- 2�� �迬�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select saleprice 
from orders
where custid = 2;

-- ���� �Լ��� �������� ȥ���Ͽ� �� �� ����'
-- ���� �ֹ��� ������ ���Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
select sum(saleprice) as total,
    avg(saleprice) as average,
    min(saleprice) as minimum,
    max(saleprice) as maximum
from orders;

-- ���� �Լ� count�� ���� ������ ����
-- count()�� ��ȣ �ȿ��� * Ȥ�� �Ӽ��� �̸��� ���Ǹ�
-- �ش� �Ӽ��� ������ ������ ������
-- ������ ���� - cardinality
-- count(*): ��ü ������ ���� �����ָ�, Ư�� �Ӽ��� null���� ������
-- count(publisher): ���ǻ��� ���� �����ָ�, null���� ���ܵ�
-- count(distinct publisher): �ߺ��� ������ ���ǻ��� ���� �����ָ�, null���� ���ܵ�

-- ���㼭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
select count(*)
from orders;

-- group by �˻�
-- sql������ group by ���� ����ϸ� ���� �Ӽ������� �׷��� ���� �� ����
-- ������ �ֹ��� ������ �Ѽ����� ���Ǹž��� ���Ͻÿ�,
select custid, count(*) as ��������, sum(saleprice) as �Ѿ�
from orders
group by custid;
select * from orders order by custid;

-- having ���� group by ���� ������� ��Ÿ���� �׷��� �����ϴ� ����
-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- ��, 2�� �̻� ������ ���� ���Ͻÿ�.
select custid, count(*) as ��������
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;

-- group by�� having �� ��� �� ���ǻ���
-- group by�� ������ �׷����� ���� �� 
-- select������ group by���� ����� �Ӽ��� �����Լ��� ���� �� ����
select sum(saleprice), bookid -- Ʋ�� ��
from orders
group by custid;
select sum(saleprice),custid -- �ùٸ� ��
from orders
group by custid;

-- where���� having���� ���� ���Ե� sql���� �˻������� ��ȣ���� �� ����
-- having�� ���ǻ���
-- 1. �ݵ�� group by ���� ���� �ۼ��ؾ� ��
-- 2. where ������ �ڿ� ���;� ��
-- 3. �˻����ǿ��� sum, avg, max, min, count�� ���� �����Լ��� �;� ��

-- group by ���� ���Ե� sql���� ���� ����
select custid, count(*) as �������� --- 5
from orders -------------------------- 1
where saleprice >= 8000 -------------- 2
group by custid ---------------------- 3
having count(*) > 1 ------------------ 4
order by custid; --------------------- 6






