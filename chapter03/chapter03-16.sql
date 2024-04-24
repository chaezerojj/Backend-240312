-- D:\dev\database\workspace\chapter03\chapter03-15.sql

-- 연습문제 풀이

-- [기업 프로젝트 데이터베이스]
-- 직원 테이블 생성
create table b_employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(50),
    deptno number
);

-- 부서 테이블 생성
create table b_department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar2(10)
);

-- 프로젝트 테이블 생성
create table b_project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);

-- 작업 테이블 생성
create table b_works(
    empno number,
    projno number,
    hours_worked number,
    primary key(empno, projno),
    foreign key(empno) references b_employee(empno),
    foreign key(projno) references b_project(projno)
);

-- (1) 테이블을 생성하는 create문과 데이터를 삽입하는 insert문을 작성하시오.
--     테이블의 데이터 타입은 임의로 정하고, 데이터는 아래 질의의 결과가 나오도록 삽입한다.
update b_employee set position = '팀장' where empno=1;
insert into b_employee values (1, '홍길동', '010-1111-1111', '강남', 'M', '팀장', 1);
insert into b_employee values (2, '김팀원', '010-2222-2222', '마포', 'F', '사원', 2);
insert into b_employee values (3, '박팀원', '010-3333-3333', '성수', 'F', '사원', 1);
insert into b_employee values (4, '남팀원', '010-4444-4444', '김포', 'M', '사원', 2);
insert into b_employee values (5, '이팀장', '010-5555-5555', '강남', 'F', '팀장', 2);

insert into b_department values (1, '개발1팀', '홍길동');
insert into b_department values (2, '개발2팀', '이팀장');

update b_department set deptname = 'IT' where deptno = 1;
update b_department set deptname = 'Service' where deptno = 2;

insert into b_project values (1, '프로젝트1', 1);
insert into b_project values (2, '프로젝트2', 2);

insert into b_works values (1, 1, 40);
insert into b_works values (2, 2, 40);
insert into b_works values (3, 1, 41);
insert into b_works values (4, 2, 40);
insert into b_works values (5, 2, 41);


-- (2) 모든 사원의 이름을 보이시오.
select name
from b_employee;

-- (3) 여자 사원의 이름을 보이시오.
select name
from b_employee
where sex like 'F';

-- (4) 팀장(manager)의 이름을 보이시오.
select name
from b_employee
where position like '팀장';

-- (5) 'IT'부서에서 일하는 사원의 이름과 주소를 보이시오.
select be.name, be.address
from b_employee be, b_department bd
where be.deptno = bd.deptno
and bd.deptname like 'IT';

-- (6) '홍길동'팀장(manager) 부서에서 일하는 사원의 수를 보이시오.
select count(*)
from b_employee be, b_department bd
where be.deptno = bd.deptno
and bd.manager like '홍길동';

-- (7) 사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 보이시오.
select name, deptname, hours_worked
from b_employee be, b_department bd, b_works bw
where be.empno = bw.empno and be.deptno= bd.deptno
order by be.name, bd.deptname desc;

-- (8) 2명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수를 보이시오.
select bp.projno, bp.projname, count(*) "사원수"
from b_project bp, b_works bw
where bp.projno = bw.projno
group by bp.projno, bp.projname
having count(*) >= 2;

-- (9) 3명 이상의 사원이 있는 부서의 사원 이름을 보이시오.
select be.name, bp.deptname
from b_employee be, b_department bp
where be.deptno = bp.deptno
and bp.deptno in (select bp2.deptno
                    from b_department bp2, b_employee be2
                    where bp2.deptno = be2.deptno
                    group by bp2.deptno
                    having count(*) >= 3);














