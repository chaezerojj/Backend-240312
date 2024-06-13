-- ����1
-- ���� �������� �ù踦 ������ ���� �ù迡 �ʿ��� ������ �ʿ��ϴ�. �ù迡 �ʿ��� ������ �����Ͻÿ�.
select *
from customer c, orders o, book b
where o.custid = c.custid and b.bookid = o.bookid;

-- ����2
-- �ù�� �����̻��̸� �����̹Ƿ� �ù�� ������ �ֹ��� �ù�� �߻� �ֹ� ���̺��� �ΰ��� �˻��� ���ÿ�.
-- �ù�� ����(10000���̻� �ֹ�) ���̺�
select c.name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
having sum(saleprice) >= 10000
group by c.name;

-- �ù�� �߻� ���̺�
select c.name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
having sum(saleprice) < 10000
group by c.name;


