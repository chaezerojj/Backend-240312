-- D:\dev\database\workspace\chapter04\chapter04-Quiz2.sql

-- 05. �μ����ǿ� ���� ���� SQL���� ������ ���� � ���ǿ� ���� ������ �����Ͻÿ�.
-- (1)
select custid, (select address
            from customer cs
            where cs.custid = od.custid) "address",
            sum(saleprice) "total"
from orders od
group by od.custid;
--�ֹ� ��, �ֹ� ���� �ּҿ� ���ֹ���

-- (2)
select cs.name, s
from (select custid, avg(saleprice) s
        from orders
        group by custid) od, customer cs
where cs.custid = od.custid;
-- �ֹ� �� �̸��� �� ���� �ֹ��� ���ž��� ���

-- (3)
select sum(saleprice) "total"
from orders od
where exists (select * 
            from customer cs
            where custid <= 3 and cs.custid = od.custid);
-- ����ȣ 3������ ���� �ֹ��Ѿ�

-- 08. ���缭�� �����ͺ��̽��� �̿��� ������ �ش��ϴ� �並 �ۼ��Ͻÿ�.
-- (1) �ǸŰ����� 20000�� �̻��� ������ ������ȣ, �����̸�, ���̸�,
--     ���ǻ�, �ǸŰ����� �����ִ� highorders�並 �����Ͻÿ�.
create view highorders
as select b.bookid, b.bookname, b.publisher, c.name, o.saleprice
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid
and o.saleprice >= 20000;
select * from highorders;

-- (2) ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
select bookname, name from highorders;

-- (3) highorders�並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�.
--    ���� �� (2)�� SQL���� �ٽ� �����Ͻÿ�.
create or replace view highorders -- create or replace view: �� �Ӽ� ����
as select b.bookid, b.bookname, b.publisher, c.name
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid
and o.saleprice >= 20000;
select * from highorders;

-- 09. [��� �����ͺ��̽�] 3���� �������� 14���� �����ͺ��̽��� �̿��Ͽ� ���� ���ǿ� �ش��ϴ� SQL���� �ۼ��Ͻÿ�.
-- (1) ����(mgr)�� ���� ������ �̸��� ���̽ÿ�.
select ename from emp where mgr is null;

-- (2) ����� �̸��� �μ��� �̸��� ���̽ÿ�. (����/��Į�� �μ����� ���)
select e.ename, (select dname 
                from dept d 
                where d.deptno = e.deptno) 
from emp e;

-- (3) 'CHICAGO'�� �ٹ��ϴ� ����� �̸��� ���̽ÿ�. (����/�ζ��� ��/ ��ø����/ exists ���)
select e.ename
from (select deptno from dept where loc = 'CHICAGO') d, emp e
where d.deptno = e.deptno;

-- (4) ��պ��� �޿��� ���� ������ �̸��� ���̽ÿ�.
select ename, sal 
from emp
where sal > (select avg(sal) from emp);

-- (5) �ڱ� �μ��� ��պ��� �޿��� ���� ������ �̸��� ���̽ÿ�. (��� �μ����� ���)
select e1.ename
from emp e1
where sal > (select avg(e2.sal) 
            from emp e2 
            where e1.deptno = e2.deptno);




