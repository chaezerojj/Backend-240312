-- D:\dev\database\workspace\chapter03\chapter03-13.sql

-- 데이터 조작어 - 삽입, 수정, 삭제

-- 프로그램의 기본 기능 CRUD - create, read, update, delete
-- 만들어진 테이블에 투플(행)을 삽입, 삭제, 수정하는 방법

-- insert문
-- 테이블에 새로운 투플을 삽입하는 명령
-- insert문 문법
-- : insert into 테이블이름[(속성리스트)]
--   values (값리스트);

-- book테이블에 새로운 도서 '스포츠 의학'을 삽입하시오.
-- 스포츠 의학은 한솔의학서적에서 출간하였으며 가격은 90000원이다.
select * from book;
insert into book(bookid, bookname, publisher, price)
    values(11, '스포츠 의학', '한솔의학서적', 90000);
-- 새로운 투플을 삽입할 때 속성의 이름은 생략 가능
-- 이때 데이터의 입력 순서는 속성의 순서와 일치해야 함
insert into book
    values(12, '스포츠 의학', '한솔의학서적', 90000);
    
-- 속성의 이름의 순서를 바꾸게 되면 데이터 순서도 바꾸면 됨
insert into book(bookid, bookname, price, publisher)
    values(13, '스포츠 의학', 90000, '한솔의학서적');
    
-- 몇 개의 속성만 입력해야 한다면 해당되는 속성만 명시하면 됨
-- book테이블에 새로운 도서 '스포츠 의학'을 삽입하시오.
-- 스포츠 의학은 한솔의학서적에서 출간하였으며 가격은 미정이다.
insert into book(bookid, bookname, publisher)
    values(14, '스포츠 의학', '한솔의학서적');

-- insert문은 select문을 사용하여 작성할 수도 있음
-- 한꺼번에 여러 개의 투플을 삽입하는 방법으로
-- 대량삽입 (bulk insert)이라고 함
 
-- 수입도서 목록(imported_book)을 book테이블에 모두 삽입하시오.
select * from imported_book;
insert into book(bookid, bookname, price, publisher)
    select bookid, bookname, price, publisher
    from imported_book;
select * from book;

-- 데이터베이스의 이름 규칙
-- 새로운 단어가 조합될 때 언더바(_)를 쓰는게 일반적임
-- imported_book
-- 데이터베이스 접속 라이브러리에서 importedBook 카멜표기법으로 되어있는 이름을
-- 언더바로 자동변환하는 기능이 대부분 있음

-- update문
-- 특정 속성값을 수정하는 명령어
-- update문 문법
-- : update 테이블이름
--   set 속성이름 1=값, 1[, 속성이름 2= 값2, ...]
--   [where <검색조건>];

-- customer 테이블에서 고객번호가 5인 고객의 주소를 
-- '대한민국 부산'으로 변경하시오.
update customer
set address = '대한민국 부산'
where custid = 5;
select * from customer;

-- update문은 다른 테이블의 속성값을 이용할 수도 있음

-- customer테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
update customer
set address = (select address from customer
    where name = '김연아')
where name = '박세리';

-- update 문 작성시 주의사항
update customer
set address ='대한민국 서울'; 
-- 모든 고객의 주소가 대한민국 서울로 바뀐다
-- update문은 일반적으로 특정값만 변경하므로 where문이 빠졌는지 주의해야 함

-- delete문
-- 테이블에 있는 기존 투플을 삭제하는 명령어
-- delete문 문법
-- : delete from 테이블이름
--   [where 검색조건];
-- delete문은 <검색조건>에 해당되는 투플을 삭제함
-- <검색조건>이 없으면 모든 투플을 삭제함
-- delete문도 where조건문이 빠졌는지 특히 주의해야 함

-- customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인하시오.
delete from customer
where custid = 5;

select * from customer;

-- 모든 고객을 삭제하시오.
delete from customer; -- 오류 발생
-- 이유: orders테이블에서 customer.custid속성을 외래키로 참조하고 있음
-- 제약이 해제되거나 orders테이블의 데이터가 삭제되지 않으면 삭제가 중지됨









