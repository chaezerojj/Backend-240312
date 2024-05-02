-- 5. ���н� �����Ϳ� ���� ��ü���� ������ �˾ƺ���
-- (1) ���н� ���̺� 6�� ���
select * from menu;
select * from menutype;
select * from orders;
select * from ordersmenu;
select * from customer;
select * from delivery;
-- (2) ���нĿ��� '��н�'�� �ֹ��� ���� ���
-- ��� 1.
select * from customer; -- ��н��� custid: 1
select * from orders o, ordersmenu om 
where o.ordersid = om.ordersid
and o.custid = 1;
-- ��� 2.
select * from orders
where custid = (select custid
                from customer
                where custname = '��н�');
                
-- (3)-1. ���нĿ��� 2024�� 5�� 1���� ��ü �ֹ� ���� ���
select * from orders
where orderdate = '2024-05-01';

-- (3)-2. 5�� 1�� �ֹ� �� ����� �ֹ��� ���
-- ��� 1.
select * from orders o, delivery d
where o.ordersid = d.ordersid
and o.orderdate = '2024-05-01';
-- ��� 2. ���� ����� sql��
select * from orders o
inner join delivery d on o.ordersid = d.ordersid
where o.orderdate = '2024-05-01';

-- (4) ���н��� �ֹ� �Ǻ� �ݾ� �� �� ���ϱ�
select om.ordersid as �ֹ���ȣ, sum(m.menuprice) as "�� �ֹ��ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
order by o.ordersid;
-- (4)-1. �ֹ� �� �ݾ��� 10000���� �Ѵ� �ֹ� ��ȣ�� ���
select o.ordersid as �ֹ���ȣ, sum(m.menuprice) as "�� �ֹ��ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
having sum(m.menuprice) >= 10000
order by o.ordersid;
-- (4)-2. ���н��� ��� �ֹ��ݾ� ���(�Ҽ��� �ݿø��Ͽ� ������ ���)
select round(avg(menuprice)) as "��� �ֹ��ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid;
-- (4)-3. ����Ļ� �մԵ��� ��� �ֹ� �ݾ� ��� (�Ҽ��� �ݿø��Ͽ� ������ ���)
select round(avg(menuprice)) as "��� �ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.takein='Y';

-- (5) ���н��� 5�� 1��, 5�� 2��, 5�� 3�� ��ü ���� ���� ���
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-01';
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-02';
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-03';

-- (6) �޴��� '������'�� �� �޴��� �̸��� ������ ��ȸ�ϱ�
select menuname, menuprice
from menu
where menuname like '%������%';

-- (7) ����� '�Ϸ�'�� �ֹ��� �ֹ���ȣ, ��޻���, �ֹ����� ��ȸ�ϱ�
select d.ordersid, d.status, o.orderdate
from orders o, delivery d
where o.ordersid = d.ordersid
and d.status = '�Ϸ�'
order by o.orderdate;

-- (8) �ֹ���ȣ�� 5���� �ֹ��� �޴��̸��� ������ ��ȸ�ϱ�
select m.menuname, m.menuprice
from menu m, ordersmenu om
where m.menuid = om.menuid
and om.ordersid = 5;
/*
���̸��� '��н�'�� �ƴ� ���� �ֹ��� ���� ����ϱ�.
2024�� 5�� 1�Ͽ� ����Ļ�� ����Ļ��� �ֹ� �� �ݾ��� ���ؼ� ����ϱ�.
�޴� ������ ���� ���� �޴� �̸��� ���� ��ȸ�ϱ�.
����� '�Ϸ�'�� �ֹ� �� ���� �ֱٿ� �Ϸ�� �ֹ��� �ֹ���ȣ�� �ֹ����� ��ȸ�ϱ�.
�޴� ������ Ư�� ���� �̻��� �޴��� ��ȸ�ϱ�.
���нĿ��� ���� ���� �ֹ��� �޴� �̸��� �ش� �޴��� �� �ֹ� Ƚ�� ��ȸ�ϱ�.
�� ���� ù �ֹ��ϰ� ������ �ֹ����� ��ȸ�ϱ�.
���нĿ��� ���� ���� �Բ� �ֹ��� �޴� �� ã�� (���� ���, �����̿� Ƣ���� ���� �Բ� �ֹ��Ǵ� ���).
�ֹ����� �ִ� �޴� ������ ��ȸ�ϱ�.
���нĿ��� 5�� 1�Ͽ� ����Ļ��� �� �߿��� ���� �ֹ��� ������ �޴��� �ٽ� �ֹ��� ������ ã��.
*/
