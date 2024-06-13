-- D:\dev\database\workspace\chapter03\chapter03-15.sql

-- �������� Ǯ��

-- [��� ������Ʈ �����ͺ��̽�]
-- ���� ���̺� ����
create table b_employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(50),
    deptno number
);

-- �μ� ���̺� ����
create table b_department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar2(10)
);

-- ������Ʈ ���̺� ����
create table b_project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);

-- �۾� ���̺� ����
create table b_works(
    empno number,
    projno number,
    hours_worked number,
    primary key(empno, projno),
    foreign key(empno) references b_employee(empno),
    foreign key(projno) references b_project(projno)
);

-- (1) ���̺��� �����ϴ� create���� �����͸� �����ϴ� insert���� �ۼ��Ͻÿ�.
--     ���̺��� ������ Ÿ���� ���Ƿ� ���ϰ�, �����ʹ� �Ʒ� ������ ����� �������� �����Ѵ�.
update b_employee set position = '����' where empno=1;
insert into b_employee values (1, 'ȫ�浿', '010-1111-1111', '����', 'M', '����', 1);
insert into b_employee values (2, '������', '010-2222-2222', '����', 'F', '���', 2);
insert into b_employee values (3, '������', '010-3333-3333', '����', 'F', '���', 1);
insert into b_employee values (4, '������', '010-4444-4444', '����', 'M', '���', 2);
insert into b_employee values (5, '������', '010-5555-5555', '����', 'F', '����', 2);

insert into b_department values (1, '����1��', 'ȫ�浿');
insert into b_department values (2, '����2��', '������');

update b_department set deptname = 'IT' where deptno = 1;
update b_department set deptname = 'Service' where deptno = 2;

insert into b_project values (1, '������Ʈ1', 1);
insert into b_project values (2, '������Ʈ2', 2);

insert into b_works values (1, 1, 40);
insert into b_works values (2, 2, 40);
insert into b_works values (3, 1, 41);
insert into b_works values (4, 2, 40);
insert into b_works values (5, 2, 41);


-- (2) ��� ����� �̸��� ���̽ÿ�.
select name
from b_employee;

-- (3) ���� ����� �̸��� ���̽ÿ�.
select name
from b_employee
where sex like 'F';

-- (4) ����(manager)�� �̸��� ���̽ÿ�.
select name
from b_employee
where position like '����';

-- (5) 'IT'�μ����� ���ϴ� ����� �̸��� �ּҸ� ���̽ÿ�.
select be.name, be.address
from b_employee be, b_department bd
where be.deptno = bd.deptno
and bd.deptname like 'IT';

-- (6) 'ȫ�浿'����(manager) �μ����� ���ϴ� ����� ���� ���̽ÿ�.
select count(*)
from b_employee be, b_department bd
where be.deptno = bd.deptno
and bd.manager like 'ȫ�浿';

-- (7) ������� ���� �ð� ���� �μ���, ��� �̸��� ������������ ���̽ÿ�.
select name, deptname, hours_worked
from b_employee be, b_department bd, b_works bw
where be.empno = bw.empno and be.deptno= bd.deptno
order by be.name, bd.deptname desc;

-- (8) 2�� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸�, ����� ���� ���̽ÿ�.
select bp.projno, bp.projname, count(*) "�����"
from b_project bp, b_works bw
where bp.projno = bw.projno
group by bp.projno, bp.projname
having count(*) >= 2;

-- (9) 3�� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�.
select be.name, bp.deptname
from b_employee be, b_department bp
where be.deptno = bp.deptno
and bp.deptno in (select bp2.deptno
                    from b_department bp2, b_employee be2
                    where bp2.deptno = be2.deptno
                    group by bp2.deptno
                    having count(*) >= 3);














