-- D:\dev\database\workspace\chapter03\chapter03-Quiz6.sql

-- [��� �����ͺ��̽�]

-- �μ� ���̺�
CREATE TABLE DEPT (
  DEPTNO integer NOT NULL, -- �μ���ȣ
  DNAME varchar(14) DEFAULT NULL, -- �μ��̸�
  LOC varchar(13) DEFAULT NULL, -- ��ġ
  PRIMARY KEY (DEPTNO)
);

-- �μ����̺� ������ ����
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES(40, 'OPERATIONS', 'BOSTON');

-- ��� ���̺�
CREATE TABLE EMP (
  EMPNO integer NOT NULL PRIMARY KEY, -- �����ȣ
  ENAME varchar(10) DEFAULT NULL, -- ����̸�
  JOB varchar(9) DEFAULT NULL, -- ����
  MGR integer DEFAULT NULL, -- �����ȣ
  HIREDATE date DEFAULT NULL, -- ��볯¥
  SAL integer DEFAULT NULL, -- �޿�
  COMM integer DEFAULT NULL, -- Ŀ�̼Ǳݾ�
  DEPTNO integer DEFAULT NULL, -- �μ���ȣ
  FOREIGN KEY (deptno) REFERENCES Dept(deptno)
);

-- ������̺� ������ ����
INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);

CREATE TABLE SALGRADE(
	GRADE INTEGER,
	LOSAL INTEGER,
	HISAL INTEGER
	);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

select * from emp; 


-- (1) ����� �̸��� ������ ����Ͻÿ�.
--     ��, ����� �̸��� '����̸�', ������ '�������' �Ӹ����� �������� ����Ѵ�.
select ename "����̸�", job "�������"
from emp;

-- (2) 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����Ͻÿ�.
select ename, sal
from emp
where deptno = 30;

-- (3) �����ȣ�� �̸�, ���� �޿�, ������ �޿���(�� �̸��� '������'), 
--     10% �λ�� �޿�(�� �̸��� '�λ�� �޿�')�� �����ȣ������ ����Ͻÿ�.
select empno, ename, sal, sal*0.1 as "������", sal*1.1 as "�λ�� �޿�"
from emp
order by empno;

-- (4) 'S'�� �����ϴ� ��� ����� �μ���ȣ�� ����Ͻÿ�.
select ename, deptno
from emp
where ename like 'S%';

-- (5) ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ����Ͻÿ�.
--     �� �̸��� ���� MAX, MIN, SUM, AVG�� �Ѵ�. ��, �Ҽ��� ���ϴ� �ݿø��Ͽ� ������ ����Ѵ�.
select max(sal) as "MAX", min(sal) as "MIN", sum(sal) as "SUM", round(avg(sal)) as "AVG"
from emp;

-- (6) ���� �̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ�.
--     �� �̸��� ���� '����'�� '������ �����'�� �Ѵ�.
select job as "����", count(*) as "������ �����"
from emp
group by job;

-- (7) ����� �ִ� �޿��� �ּ� �޿��� ������ ����Ͻÿ�.
select (max(sal)-min(sal)) from emp;

-- (8) 30�� �μ��� ��� ���� ����� �޿��� �հ�� ����� ����Ͻÿ�.
select count(*), sum(sal), avg(sal)
from emp
where deptno=30;

-- (9) ��� �޿��� ���� ���� �μ��� ��ȣ�� ����Ͻÿ�.
select deptno, avg(sal)
from emp
group by deptno
order by avg(sal) desc;

-- (10) �������(SALESMAN)�� �����ϰ�, �� ������ ����� �ѱ޿��� 3000 �̻��� �� ������ ���ؼ�,
--      ������� �� ������ ��� �޿��� ����Ͻÿ�. ��, ��� �޿��� ������������ ����Ѵ�.
select job, avg(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >= 3000
order by avg(sal) asc;

-- (11) ��ü ��� ��� ���ӻ���� �ִ� ����� ���� ����Ͻÿ�.
-- ���ӻ�� mgr? �����ȣ
select count(*)
from emp
where mgr is not null;

-- (12) Emp ���̺��� �̸�, �޿�, Ŀ�̼�(Comm) �ݾ�, �Ѿ� (sal*12+comm)�� ���Ͽ�
--      �Ѿ��� ���� ������� ����Ͻÿ�. ��, Ŀ�̼��� NULL�� ����� �����Ѵ�.
select ename as "�̸�", sal as "�޿�", comm as "Ŀ�̼� �ݾ�", sal*12+comm as "�Ѿ�"
from emp
where comm is not null
group by ename, sal, comm
order by sal*12+comm desc;

-- (13) �� �μ����� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ���� �̸�, �ο����� ����Ͻÿ�.
select deptno, job, count(*)
from emp
group by deptno, job;

-- (14) ����� 1�� ���� �μ��� �̸��� ����Ͻÿ�.
select dname
from dept
where deptno not in (select deptno from emp);

-- (15) ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����Ͻÿ�.
select job, count(*)
from emp
group by job
having count(*) >= 4;

-- (16) �����ȣ�� 7400 �̻� 7600 ������ ����� �̸��� ����Ͻÿ�.
select ename, empno
from emp
where empno between 7400 and 7600;

-- (17) ����� �̸��� ����� �μ��̸��� ����Ͻÿ�.
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

-- (18) ����� �̸��� ����(mgr)�� �̸��� ����Ͻÿ�.
select ename as "����̸�", mgr
from emp;
select e1.ename as "����̸�", e2.ename as "�����̸�"
from emp e1, emp e2
where e1.empno = e2.mgr;

-- (19) ��� SCOTT���� �޿��� ���� �޴� ����� �̸��� ����Ͻÿ�.
select ename
from emp
where sal > (select sal from emp where ename = 'SCOTT');

select ename, sal
from emp
where ename = 'SCOTT';
select ename, sal
from emp
where ename = 'KING';
select ename, sal
from emp;

-- (20) ��� SCOTT�� ���ϴ� �μ���ȣ Ȥ�� DALLAS�� �ִ� �μ���ȣ�� ����Ͻÿ�.
select ename, deptno
from emp
where ename = 'SCOTT';
select loc, deptno
from dept
where dept.loc = 'DALLAS';









