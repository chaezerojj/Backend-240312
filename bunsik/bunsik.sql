-- yamyambunsik

-- 0. 사용자 생성 
create user c##bunsik identified by bunsik;

-- 1. 생성된 사용자에게 접속 권한 부여
grant connect, resource, dba to c##bunsik;

-- 2. 변경사항 적용하기
commit;

-- 3. 테이블 생성 및 외래키 설정

-- customer(고객) 테이블 생성
CREATE TABLE customer (
    custid    NUMBER NOT NULL, -- 고객아이디(기본키)
    custname  VARCHAR2(20), -- 고객이름
    custaddr  VARCHAR2(100), -- 고객 주소
    custphone VARCHAR2(20) -- 고객 전화번호
);
-- custid를 기본키로 설정
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );

-- delivery(배달) 테이블 생성
CREATE TABLE delivery (
    status          VARCHAR2(10), -- 배달상태
    ordersid        NUMBER NOT NULL, -- 기본키
    deliveryprice   NUMBER -- 배달가격
);
ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY ( ordersid );

-- menu(메뉴) 테이블 생성
CREATE TABLE menu 
    menuid    NUMBER NOT NULL, -- 메뉴 아이디(기본키)
    menutype  VARCHAR2(20), -- 메뉴종류 
    menuname  VARCHAR2(20), -- 이름
    menuprice NUMBER -- 가격
);
-- menuid를 기본키로 설정
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menuid );

-- orders(주문) 테이블 생성
CREATE TABLE orders (
    ordersid    NUMBER NOT NULL, -- 기본키
    takein      VARCHAR2(10), -- 매장 식사 여부 (Y/N)로 표시
    menuid      NUMBER NOT NULL, -- 외래키: menuid
    orderdate   DATE, -- 주문날짜
    custid      NUMBER NOT NULL -- 외래키: custid
);
-- ordersid, custid를 기본키로 설정
ALTER TABLE orders ADD CONSTRAINT order_pk PRIMARY KEY ( ordersid, custid );

-- delivery 테이블에서 orders테이블의 ordersid를 외래키로 받아옴
ALTER TABLE delivery
    ADD CONSTRAINT delivery_orders_fk FOREIGN KEY ( ordersid )
        REFERENCES orders ( ordersid );
-- orders 테이블에서 customer테이블의 custid를 외래키로 받아옴
ALTER TABLE orders
    ADD CONSTRAINT orders_customer_fk FOREIGN KEY ( custid )
        REFERENCES customer ( custid );
-- orders 테이블에서 menu테이블의 menuid를 외래키로 받아옴
ALTER TABLE orders
    ADD CONSTRAINT orders_menu_fk FOREIGN KEY ( menuid )
        REFERENCES menu ( menuid );

-- 4. 테이블에 각 데이터 입력
-- (1) menu 테이블
insert into menu values (1, '분식류', '떡볶이', 5000);
insert into menu values (2, '분식류', '로제떡볶이', 6500);
insert into menu values (3, '분식류', '사리추가', 1000);
insert into menu values (4, '분식류', '치즈추가', 1000);

insert into menu values (, '밥류', '기본김밥', 3000);
insert into menu values (1, '밥류', '치즈김밥', 3500);
insert into menu values (1, '밥류', '스팸마요 컵밥', 4000);
insert into menu values (1, '밥류', '참치마요 컵밥', 4000);

insert into menu values (1, '튀김류', '만두(3개)', 3000);
insert into menu values (1, '튀김류', '치즈스틱(3개)', 3000);
insert into menu values (1, '튀김류', '오징어튀김(2개)', 3000);
insert into menu values (1, '튀김류', '김말이(3개)', 2500);
insert into menu values (1, '튀김류', '치즈볼(3개)', 2500);

insert into menu values (1, '기타류', '순대(1인분)', 6000);
insert into menu values (1, '기타류', '라면', 5000);
insert into menu values (1, '기타류', '어묵꼬치(3개)', 2500);

insert into menu values (1, '세트류', '떡볶이+모듬튀김(튀김종류 1개씩)', 9500);
insert into menu values (1, '세트류', '떡볶이+기본김밥', 7500);
insert into menu values (1, '세트류', '떡볶이+치즈김밥', 8000);
insert into menu values (1, '세트류', '떡볶이+컵밥', 8500);
insert into menu values (1, '세트류', '떡볶이+어묵꼬치', 7000);
insert into menu values (1, '세트류', '떡볶이+순대', 10500);
insert into menu values (1, '세트류', '떡볶이에 치즈추가', 1000);
insert into menu values (1, '세트류', '떡볶이에 사리추가', 1000);
insert into menu values (1, '세트류', '로제떡볶이로 변경', 1500);
insert into menu values (1, '세트류', '라면+기본김밥', 7500);
insert into menu values (1, '세트류', '라면+치즈김밥', 8000);

insert into menu values (1, '음료류', '콜라', 2000);
insert into menu values (1, '음료류', '제로콜라', 2000);
insert into menu values (1, '음료류', '사이다', 2000);
insert into menu values (1, '음료류', '제로사이다', 2000);
insert into menu values (1, '음료류', '환타', 2000);

-- (2) orders 테이블
insert into orders (ordersid, takein) values ();



/*
<< 메뉴 종류 >>
* 분식류 >> 떡볶이/ 치즈떡볶이 / 라볶이 
* 밥류 >> 기본 김밥, 치즈 김밥, 스팸마요 컵밥, 참치마요 컵밥
* 튀김류 >> 만두(4개), 치즈스틱(3개), 오징어튀김(2개), 치즈볼(3개)
* 기타류 >> 순대(1인분), 라면, 어묵꼬치(3개)
* 세트
>> 떡볶이+모듬튀김(튀김종류1개씩) / 떡볶이+김밥 / 떡볶이+치즈김밥 / 떡볶이+어묵꼬치 / 떡볶이+순대

* 음료
>> 콜라, 제로콜라, 사이다, 제로사이다, 환타

* 주문
*/










