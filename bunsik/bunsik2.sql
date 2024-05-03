-- 5. ���н� �����Ϳ� ���� ��ü���� ������ �˾ƺ���
-- (1) ���н� ���̺� 6���� ����Ͻÿ�.
select * from menu;
select * from menutype;
select * from orders;
select * from ordersmenu;
select * from customer;
select * from delivery;

-- (2) ���нĿ��� '��н�'�� �ֹ��� ������ ��ȸ�Ͻÿ�.
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
                
-- (3) ���нĿ��� 2024�� 5�� 1���� ��ü �ֹ� ������ ��ȸ�Ͻÿ�.
select * from orders
where orderdate = '2024-05-01';

-- (4) 5�� 1�� �ֹ� �� ����� �ֹ��� ��ȸ�Ͻÿ�.
-- ��� 1.
select * from orders o, delivery d
where o.ordersid = d.ordersid
and o.orderdate = '2024-05-01';
-- ��� 2. ���� ����� sql��
select * from orders o
inner join delivery d on o.ordersid = d.ordersid
where o.orderdate = '2024-05-01';

-- (5) ���н��� �ֹ� �Ǻ� �ݾ� �� ���� ���Ͻÿ�.
select om.ordersid as �ֹ���ȣ, sum(m.menuprice) as "�� �ֹ��ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
order by o.ordersid;

-- (6) �ֹ� �� �ݾ��� 10000���� �Ѵ� �ֹ� ��ȣ�� ��ȸ�Ͻÿ�.
select o.ordersid as �ֹ���ȣ, sum(m.menuprice) as "�� �ֹ��ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
group by o.ordersid
having sum(m.menuprice) >= 10000
order by o.ordersid;

-- (7) ���н��� ��� �ֹ��ݾ� ��ȸ�Ͻÿ�.(�Ҽ��� �ݿø��Ͽ� ������ ���)
select round(avg(menuprice)) as "��� �ֹ��ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid;

-- (8) ����Ļ� �մԵ��� ��� �ֹ� �ݾ� ��ȸ�Ͻÿ�.(�Ҽ��� �ݿø��Ͽ� ������ ���)
select round(avg(menuprice)) as "��� �ݾ�"
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.takein='Y';

-- (9) ���н��� 5�� 1��, 5�� 2��, 5�� 3�� ��ü ������ ���� ��ȸ�Ͻÿ�.
-- 5�� 1��
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-01';
-- 5�� 2��
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-02';
-- 5�� 3��
select sum(menuprice)
from orders o
join ordersmenu om on o.ordersid = om.ordersid
join menu m on om.menuid = m.menuid
where o.orderdate = '2024-05-03';

-- (10) �޴��� '������'�� �� �޴��� �̸��� ������ ��ȸ�Ͻÿ�.
select menuname, menuprice
from menu
where menuname like '%������%';

-- (11) ����� '�Ϸ�'�� �ֹ��� �ֹ���ȣ, ��޻���, �ֹ����ڸ� ��ȸ�Ͻÿ�.
select d.ordersid, d.status, o.orderdate
from orders o, delivery d
where o.ordersid = d.ordersid
and d.status = '�Ϸ�'
order by o.orderdate;

-- (12) �ֹ���ȣ�� 5���� �ֹ��� �޴��̸��� ������ ����Ͻÿ�.
select m.menuname, m.menuprice
from menu m, ordersmenu om
where m.menuid = om.menuid
and om.ordersid = 5;

-- (13) �̾� ���� ���� ���� �̸��� �ֹ���ȣ�� ����Ͻÿ�.
select c.custname, o.ordersid
from customer c, orders o
where c.custid = o.custid
and c.custname like '��_%';

-- (14) 2024�� 5�� 2�� ����Ļ�� ����Ļ��� �ֹ� �� �ݾ��� ��ȸ�Ͻÿ�.
select o.takein, sum(m.menuprice) as "�� �ݾ�"
from orders o, ordersmenu om, menu m
where o.ordersid = om.ordersid and m.menuid = om.menuid
and o.orderdate = '2024-05-02'
group by o.takein;

-- (15) ���� ���� ������ �޴� �̸��� ������ ��ȸ�Ͻÿ�.
select menuname, menuprice
from menu
where menuprice = (
    select max(menuprice)
    from menu
);

-- (16) ����� '������'�� �ֹ��� �ֹ���ȣ�� �ֹ� ���ڸ� ��ȸ�Ͻÿ�.
select d.ordersid, o.orderdate
from orders o, delivery d
where o.ordersid = d.ordersid
and d.status = '������';

-- (17) ������ 7000�� �̻��� �޴��� �޴� �̸� ��ȸ�Ͻÿ�.
select menuname, menuprice
from menu
where menuprice >= 7000;

-- (18) ���нĿ��� ���� ���� �ֹ��� �޴��̸��� �ش� �޴��� �� �ֹ� Ƚ���� ��ȸ�Ͻÿ�.
select menuname, totalcount
from (
    select m.menuname, count(om.menuid) as totalcount
    from menu m, ordersmenu om
    where m.menuid = om.menuid
    group by m.menuname
    order by count(om.menuid) desc
)
where rownum = 1;

-- (19) ���� ù �ֹ����� ��ȸ�Ͻÿ�. (�� �̸��� ù �ֹ����� ���)
select c.custname, min(o.orderdate) as "ù �ֹ���"
from customer c, orders o
where c.custid = o.custid
group by custname;

-- (20) ���Ḧ �ֹ����� ���� �ֹ���ȣ�� ����Ͻÿ�.
select ordersid
from orders o
where not exists (
    select 1
    from ordersmenu om
    where o.ordersid = om.ordersid
    and om.menuid in (
        select menuid 
        from menu
        where typeid = (
            select typeid from menutype
            where typename = '�����'
        )
    )
);

-- (21) �� �߿��� ���� �ֹ��� ���� �޴��� �ٽ� �ֹ��� ���� ã���ÿ�.
select distinct custid
from (
    select o1.custid, om1.menuid
    from orders o1, ordersmenu om1
    where o1.ordersid = om1.ordersid
    and om1.menuid in (
        select om2.menuid
        from ordersmenu om2, orders o2
        where om2.ordersid = o2.ordersid
        and o1.ordersid = o2.ordersid
        and o2.ordersid != o1.ordersid
    )
); -- -> ���� �ֹ��� �� ���� ��� ���ǰ�� ���� ����

-- (22) ��� �ֹ� �߿��� ���� ���� �ֹ��� ���� �ֹ����ڿ� �ش� �ֹ��� �� ���̸��� ��ȸ�Ͻÿ�.
select o.orderdate, c.custname
from orders o, customer c
where o.custid = c.custid
and o.ordersid = 1;

-- (23) ��Ʈ�� �߿��� ���� ���� �ֹ��� �޴��� �޴���� �ֹ� Ƚ���� ��ȸ�Ͻÿ�.
select menuname, "�ֹ� Ƚ��"
from (
    select m.menuname, count(om.menuid) as "�ֹ� Ƚ��"
    from menu m, ordersmenu om, menutype mt
    where m.menuid = om.menuid
    and mt.typeid = m.typeid
    and mt.typename = '��Ʈ��'
    group by m.menuname
    order by count(om.menuid) desc
)
where rownum = 1;

-- (24) ����� �߿��� ���� ���� �ֹ��� �޴��� �̸��� �� �ֹ� Ƚ���� ���Ͻÿ�.
select menuname, "�� �ֹ�Ƚ��"
from (
    select m.menuname, count(om.menuid) as "�� �ֹ�Ƚ��"
    from menu m, ordersmenu om, menutype mt
    where m.menuid = om.menuid
    and m.typeid = mt.typeid
    and mt.typename = '�����'
    group by m.menuname
    order by count(om.menuid) desc
)
where rownum = 1;

-- (25) ��޺� ���� ���� ���� �ֹ��޴� ������ ����Ͻÿ�.
select m.menuname
from menu m, orders o, ordersmenu om
where o.ordersid = om.ordersid
and m.menuid = om.menuid
and o.ordersid = (
    select ordersid
    from delivery
    where deliveryprice = (
        select min(deliveryprice) from delivery
    )
);

-- (26) �ѹ��� ���忡�� �Ļ��� ���� ���� ���� �̸��� ��ȸ�Ͻÿ�.
select c.custname
from customer c
where not exists (
    select 1
    from orders o
    where o.custid = c.custid
    and o.takein = 'Y'
);

-- (27) �нķ����� �ֹ��� ������ ���� ���̸��� ����ȣ ��ȸ�Ͻÿ�.
select c.custname, c.custid
from customer c
where not exists (
    select 1
    from orders o
    join ordersmenu om on o.ordersid = om.ordersid
    join menu m on om.menuid = m.menuid
    join menutype mt on m.typeid = mt.typeid
    where o.custid = c.custid
    and mt.typename = '�нķ�'
)
and rownum = 1;

-- (28) ���� ���� �޴��� �ֹ��� �ֹ���ȣ�� �ֹ��� �޴� ������ ����Ͻÿ�.
select ordersid as �ֹ���ȣ, count(menuid) as "�޴� ����"
from ordersmenu
group by ordersid
order by count(menuid) desc
fetch first row only;

-- (29) ����� ������ �����ֹ� ���� �ֹ���ȣ�� ��ȸ�Ͻÿ�.
select o.ordersid
from orders o
where o.takein = 'N'
and not exists (
    select 1
    from delivery d
    where o.ordersid = d.ordersid
);

-- (30) '���� ���ʱ�'�� ��� ���� �ֹ��� �ֹ��޴� ���� ����Ͻÿ�.(�ֹ���ȣ, �޴��̸�, �ֹ���¥)
select distinct o.ordersid, m.menuname, o.orderdate
from ordersmenu om, customer c, orders o, menu m
where c.custid = o.custid
and om.ordersid = o.ordersid
and m.menuid = om.menuid
and c.custaddr = '���� ���ʱ�'
order by o.ordersid asc;

-- (31) 5�� 2�� ��޵� ���Ŀ� ������ ���� ������ ������ �ؾ� �ϴ� ��Ȳ�̴�. 
--      ��� �� �� '������'�� �� ������ �ֹ��� ���� �̸��� �ּ�, ��ȭ��ȣ�� ����Ͻÿ�.
select distinct c.custname, c.custaddr, c.custphone
from customer c, orders o, ordersmenu om, menu m
where c.custid = o.custid
and om.ordersid = o.ordersid
and m.menuid = om.menuid
and o.orderdate = '2024-05-02'
and m.menuname like '%������%'
and o.takein = 'N';

-- (32) ���� �������� ��� �߿��� ������ ����� �ʾ��� ���̶�� ���ڸ� ������ �Ѵ�.
--      '������'�� ��� �ǿ� �ش��ϴ� ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.
select c.custname, c.custphone
from customer c, orders o, delivery d
where c.custid = o.custid
and d.ordersid = o.ordersid
and d.status = '������';

-- (33) ���нĿ����� ���� ����̺�Ʈ�� 10000���̻� �ֹ� ���� ������� ���� ���� 1���� �����ְ� �ִ�.
--      ��� ���� ���� ���� �̺�Ʈ�� �ش��ϴ� �ֹ���ȣ�� �ش� �ֹ� ��ü �ݾ��� �Բ� ����Ͻÿ�.
select o.ordersid, sum(m.menuprice) as total_price
from orders o, ordersmenu om, menu m, delivery d
where o.ordersid = om.ordersid
and om.menuid = m.menuid
and d.ordersid = o.ordersid
and o.takein = 'N'
group by o.ordersid
having sum(m.menuprice) >= 10000;

-- (34) ��� �ֹ��� �� �� �߿��� �ֹ���ȣ, ���̸�, ��޺� ������ �� �ݾ��� ������ sql���� �ۼ��Ͻÿ�.


-- (35) �����ֹ��� ���� ���Ҵ� ���� �ֹ���¥�� �ش��ϴ� ���� �ֹ� ���� �� �� ���̾����� ���Ͻÿ�.



