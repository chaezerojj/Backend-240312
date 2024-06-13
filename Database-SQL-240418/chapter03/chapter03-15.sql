-- D:\dev\database\workspace\chapter03\chapter03-15.sql

-- �������� Ǯ��

-- [�Ǹſ� �����ͺ��̽�]
-- �Ǹſ� ���̺�
create table salesperson(
    name varchar2(100) primary key,
    age number,
    salary number
);
-- �ֹ� ���̺�
create table sales_order(
    onumber number,
    custname varchar2(50),
    salesperson varchar(50),
    amount number,
    primary key (custname,salesperson),
    foreign key(custname) references sales_customer(name),
    foreign key(salesperson) references salesperson(name)
);
-- �� ���̺� ����
create table sales_customer(
    name varchar2(50) primary key,
    city varchar2(50),
    industrytype varchar2(50)
);


-- (1) ���̺��� �����ϴ� create���� �����͸� �����ϴ� insert���� �ۼ��Ͻÿ�.
--     ���̺��� ������ Ÿ���� ���Ƿ� ���ϰ�, �����ʹ� �Ʒ� ������ ����� �������� �����Ѵ�.
insert into salesperson values('���Ǹ�1', 31, 2001);
insert into salesperson values('���Ǹ�2', 32, 2002);
insert into salesperson values('���Ǹ�3', 33, 2003);
insert into salesperson values('���Ǹ�4', 34, 2004);
insert into salesperson values('���Ǹ�5', 35, 2005);
insert into salesperson values('���Ǹ�6', 26, 2006);
insert into salesperson values('���Ǹ�7', 27, 2007);

-- (2) ��� �Ǹſ��� �̸��� �޿��� ���̽ÿ�. ��, �ߺ� ���� �����Ѵ�.
select distinct name, salary
from salesperson;

-- (3) ���̰� 30�� �̸��� �Ǹſ��� �̸��� ���̽ÿ�.
select name
from salesperson
where age < 30;

-- (4) 'S'�� ������ ���ÿ� ��� ���� �̸��� ���̽ÿ�.
insert into sales_customer values ('���', 'New York', '���ǰŷ���');
insert into sales_customer values ('�ڰ�', 'Los Angeles', '��ȭ����');
insert into sales_customer values ('�̰�', 'Chicago', '����');
insert into sales_customer values ('�ְ�', 'Texas', '���');
insert into sales_customer values ('����', 'Phoenix', '����� ������');
select name
from sales_customer
where city like '%s';

-- (5) �ֹ��� �� ���� ��(���� �ٸ� ����)�� ���Ͻÿ�.
insert into sales_order values (1, '���', '���Ǹ�1', 1001);
insert into sales_order values (2, '�̰�', '���Ǹ�1', 1002);
insert into sales_order values (3, '�ڰ�', '���Ǹ�2', 1003);
insert into sales_order values (4, '�ְ�', '���Ǹ�3', 1004);
insert into sales_order values (5, '����', '���Ǹ�4', 1005);
select count (distinct custname)
from sales_order;

-- (6) �Ǹſ� ������ ���Ͽ� �ֹ��� ���� ����Ͻÿ�.
select salesperson, count(*)
from sales_order
group by salesperson;

-- (7) 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�(�μ����Ǹ� ���).
insert into sales_customer values('Ȳ��', 'LA', '������');
insert into sales_customer values('����', 'LA', '�丮��');
insert into sales_order values(6, 'Ȳ��', '���Ǹ�3', 1006);
insert into sales_order values(7, '����', '���Ǹ�3', 1007);

select name, age
from salesperson
where name in (select salesperson
                from sales_order
                where custname in (select name 
                                    from sales_customer 
                                    where city like 'LA'));

-- (8) 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ�(������ ���).
select distinct sp.name, sp.age
from salesperson sp, sales_order so, sales_customer sc
where sp.name = so.salesperson
and sc.name = so.custname
and sc.city like 'LA';

-- (9) �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸��� ���̽ÿ�.
select salesperson 
from sales_order
group by salesperson
having count(*) >= 2;

-- (10) �Ǹſ� 'TOM'�� ������ 45000������ �����ϴ� SQL���� �ۼ��Ͻÿ�.
insert into salesperson values('TOM', 38, 3800);
update salesperson set salary = 45000 where name like 'TOM';
select * from salesperson where name like 'TOM';









