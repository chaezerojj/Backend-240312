-- D:\dev\database\workspace\chapter03\chapter03-Quiz6.sql

-- [사원 데이터베이스]

-- 부서 테이블
CREATE TABLE DEPT (
  DEPTNO integer NOT NULL, -- 부서번호
  DNAME varchar(14) DEFAULT NULL, -- 부서이름
  LOC varchar(13) DEFAULT NULL, -- 위치
  PRIMARY KEY (DEPTNO)
);

-- 부서테이블 데이터 삽입
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES(40, 'OPERATIONS', 'BOSTON');

-- 사원 테이블
CREATE TABLE EMP (
  EMPNO integer NOT NULL PRIMARY KEY, -- 사원번호
  ENAME varchar(10) DEFAULT NULL, -- 사원이름
  JOB varchar(9) DEFAULT NULL, -- 업무
  MGR integer DEFAULT NULL, -- 팀장번호
  HIREDATE date DEFAULT NULL, -- 고용날짜
  SAL integer DEFAULT NULL, -- 급여
  COMM integer DEFAULT NULL, -- 커미션금액
  DEPTNO integer DEFAULT NULL, -- 부서번호
  FOREIGN KEY (deptno) REFERENCES Dept(deptno)
);

-- 사원테이블 데이터 삽입
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


-- (1) 사원의 이름과 업무를 출력하시오.
--     단, 사원의 이름은 '사원이름', 업무는 '사원업무' 머리글이 나오도록 출력한다.
select ename "사원이름", job "사원업무"
from emp;

-- (2) 30번 부서에 근무하는 모든 사원의 이름과 급여를 출력하시오.
select ename, sal
from emp
where deptno = 30;

-- (3) 사원번호와 이름, 현재 급여, 증가된 급여분(열 이름은 '증가액'), 
--     10% 인상된 급여(열 이름은 '인상된 급여')를 사원번호순으로 출력하시오.
select empno, ename, sal, sal*0.1 as "증가액", sal*1.1 as "인상된 급여"
from emp
order by empno;

-- (4) 'S'로 시작하는 모든 사원과 부서번호를 출력하시오.
select ename, deptno
from emp
where ename like 'S%';

-- (5) 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오.
--     열 이름은 각각 MAX, MIN, SUM, AVG로 한다. 단, 소수점 이하는 반올림하여 정수로 출력한다.
select max(sal) as "MAX", min(sal) as "MIN", sum(sal) as "SUM", round(avg(sal)) as "AVG"
from emp;

-- (6) 업무 이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오.
--     열 이름은 각각 '업무'와 '업무별 사원수'로 한다.
select job as "업무", count(*) as "업무별 사원수"
from emp
group by job;

-- (7) 사원의 최대 급여와 최소 급여의 차액을 출력하시오.
select (max(sal)-min(sal)) from emp;

-- (8) 30번 부서의 사원 수와 사원들 급여의 합계와 평균을 출력하시오.
select count(*), sum(sal), avg(sal)
from emp
where deptno=30;

-- (9) 평균 급여가 가장 높은 부서의 번호를 출력하시오.
select deptno, avg(sal)
from emp
group by deptno
order by avg(sal) desc;

-- (10) 세일즈맨(SALESMAN)을 제외하고, 각 업무별 사원의 총급여가 3000 이상인 각 업무에 대해서,
--      업무명과 각 업무별 평균 급여를 출력하시오. 단, 평균 급여의 내림차순으로 출력한다.
select job, avg(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) >= 3000
order by avg(sal) asc;

-- (11) 전체 사원 가운데 직속상관이 있는 사원의 수를 출력하시오.
-- 직속상관 mgr? 팀장번호
select count(*)
from emp
where mgr is not null;

-- (12) Emp 테이블에서 이름, 급여, 커미션(Comm) 금액, 총액 (sal*12+comm)을 구하여
--      총액이 많은 순서대로 출력하시오. 단, 커미션은 NULL인 사람은 제외한다.
select ename as "이름", sal as "급여", comm as "커미션 금액", sal*12+comm as "총액"
from emp
where comm is not null
group by ename, sal, comm
order by sal*12+comm desc;

-- (13) 각 부서별로 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무 이름, 인원수를 출력하시오.
select deptno, job, count(*)
from emp
group by deptno, job;

-- (14) 사원이 1명도 없는 부서의 이름을 출력하시오.
select dname
from dept
where deptno not in (select deptno from emp);

-- (15) 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하시오.
select job, count(*)
from emp
group by job
having count(*) >= 4;

-- (16) 사원번호가 7400 이상 7600 이하인 사원의 이름을 출력하시오.
select ename, empno
from emp
where empno between 7400 and 7600;

-- (17) 사원의 이름과 사원의 부서이름을 출력하시오.
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

-- (18) 사원의 이름과 팀장(mgr)의 이름을 출력하시오.
select ename as "사원이름", mgr
from emp;
select e1.ename as "사원이름", e2.ename as "팀장이름"
from emp e1, emp e2
where e1.empno = e2.mgr;

-- (19) 사원 SCOTT보다 급여를 많이 받는 사람의 이름을 출력하시오.
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

-- (20) 사원 SCOTT이 일하는 부서번호 혹은 DALLAS에 있는 부서번호를 출력하시오.
select ename, deptno
from emp
where ename = 'SCOTT';
select loc, deptno
from dept
where dept.loc = 'DALLAS';









