-- yamyambunsik

-- 0. 사용자 생성 
create user c##bunsik identified by bunsik;

-- 1. 생성된 사용자에게 접속 권한 부여
grant connect, resource, dba to c##bunsik;

-- 2. 변경사항 적용하기
commit;

-- 얌얌분식 주문 관리 프로그램(앱)
-- 1. 얌얌분식의 키오스크 앱 데이터베이스 프로그램이다
-- 2. 테이블은 총 6개로 구성되어있으며
--    menu, menutype, orders, ordersmenu, customer, delivery 테이블이 있다.
-- 3. 각 테이블 당 기본키는 하나씩 구성



-- 3. 테이블 생성 및 외래키 설정

-- (1) customer(고객) 테이블 생성
CREATE TABLE customer (
    custid    NUMBER NOT NULL, -- 고객아이디(기본키)
    custname  VARCHAR2(20), -- 고객이름
    custaddr  VARCHAR2(100), -- 고객 주소
    custphone VARCHAR2(20) -- 고객 전화번호
);
-- custid를 기본키로 설정
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );


-- (2) delivery(배달) 테이블 생성
CREATE TABLE delivery (
    deliveryid      NUMBER NOT NULL, -- 배달아이디
    status          VARCHAR2(10), -- 배달상태
    ordersid        NUMBER NOT NULL, -- 외래키
    deliveryprice   NUMBER -- 배달가격
);
-- 배달아이디를 기본키로 설정
ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY (deliveryid);
-- ordersid를 외래키로 설정
ALTER TABLE delivery 
    ADD CONSTRAINT delivery_orders_fk 
    FOREIGN KEY (ordersid) REFERENCES orders (ordersid);


-- (3) menu(메뉴) 테이블 생성
CREATE TABLE menu 
    menuid    NUMBER NOT NULL, -- 메뉴 아이디(기본키)
    typename  VARCHAR2(20), -- 메뉴종류 
    menuname  VARCHAR2(50), -- 이름
    menuprice NUMBER -- 가격
    typeid    number -- 메뉴타입 아이디
);

-- menuid를 기본키로 설정
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menuid );
-- menutype테이블의 typeid를 외래키로 받아옴
alter table menu
    add constraint menu_type_fk foreign key (typeid) references menutype(typeid);


-- (4) orders(주문) 테이블 생성
CREATE TABLE orders (
    ordersid    NUMBER NOT NULL, -- 기본키
    takein      VARCHAR2(10), -- 매장 식사 여부 (Y/N)로 표시
    orderdate   DATE, -- 주문날짜
    custid      NUMBER NOT NULL -- 외래키: custid
    -- ordersid를 기본키로 설정
    CONSTRAINT order_pk PRIMARY KEY ( ordersid ),
);
-- delivery 테이블에 orders테이블의 ordersid를 외래키로 받아옴
ALTER TABLE delivery
    ADD CONSTRAINT delivery_orders_fk FOREIGN KEY ( ordersid )
        REFERENCES orders ( ordersid );
-- orders 테이블에 customer테이블의 custid를 외래키로 받아옴
ALTER TABLE orders
    ADD CONSTRAINT orders_customer_fk FOREIGN KEY ( custid )
        REFERENCES customer ( custid );

    
-- (5) menutype(메뉴타입)테이블 생성
-- - 메뉴타입에 대한 테이블을 별도로 생성하여 메뉴타입에 대한 유연성을 높이고,
-- - 데이터를 보다 더 용이하게 관리할 수 있음
create table menutype (
    typeid number primary key, -- 메뉴타입아이디 (기본키)
    typename varchar2(20) -- 메뉴이름
);

-- (6) orders_menu(주문메뉴) 테이블 생성
-- - 한 주문 당 여러개의 메뉴를 주문할 수 있도록, 주문메뉴 테이블을 생성하여
--   ordersid 하나 당 여러 개의 menuid를 가질 수 있도록 함
-- - ordersid에는 동일한 menuid가 여러 개 들어갈 수 있음
-- - 메뉴 하나가 들어갈 때마다 ordersmenuid 한 개의 값이 들어감
CREATE TABLE ordersmenu (
    ordersmenuid   NUMBER NOT NULL, -- 주문메뉴 아이디(기본키)
    ordersid       NUMBER NOT NULL, -- 주문아이디 (외래키 - orders)
    menuid         NUMBER NOT NULL, -- 메뉴아이디 (외래키 - menuid)
    -- ordersmenuid를 기본키로 설정
    CONSTRAINT ordermenu_pk PRIMARY KEY (ordersmenuid), 
    -- ordersid에 대한 외래 키 제약 조건 추가
    CONSTRAINT ordersmenu_orders_fk 
        FOREIGN KEY (ordersid) REFERENCES orders (ordersid), 
    -- menuid에 대한 외래 키 제약 조건 추가
    CONSTRAINT ordersmenu_menu_fk 
        FOREIGN KEY (menuid) REFERENCES menu (menuid) 
);


-- 4. 테이블에 각 데이터 입력
-- (1) menytype 테이블 데이터 입력
-- (외래키로 menutype - typeid와 menu - typeid가 연결되어 있기 때문에 먼저 데이터 넣어야 함)
-- insert into menutype (typeid, typename) values ();
insert into menutype values (1, '분식류');
insert into menutype values (2, '밥류');
insert into menutype values (3, '튀김류');
insert into menutype values (4, '기타류');
insert into menutype values (5, '세트류');
insert into menutype values (6, '음료류');

-- (2) menu 테이블 데이터 입력
-- insert into menu (menuid, typename, menuname, menuprice, typeid) values ();
insert into menu values (1, '분식류', '떡볶이', 5000, 1);
insert into menu values (2, '분식류', '로제떡볶이', 6500, 1);
insert into menu values (3, '분식류', '사리추가', 1000, 1);
insert into menu values (4, '분식류', '치즈추가', 1000, 1);

insert into menu values (5, '밥류', '기본김밥', 3000, 2);
insert into menu values (6, '밥류', '치즈김밥', 3500, 2);
insert into menu values (7, '밥류', '스팸마요 컵밥', 4000, 2);
insert into menu values (8, '밥류', '참치마요 컵밥', 4000, 2);

insert into menu values (9, '튀김류', '만두(3개)', 3000, 3);
insert into menu values (10, '튀김류', '치즈스틱(3개)', 3000, 3);
insert into menu values (11, '튀김류', '만두튀김(2개)', 3000, 3);
insert into menu values (12, '튀김류', '김말이(3개)', 2500, 3);
insert into menu values (13, '튀김류', '치즈볼(3개)', 2500, 3);

insert into menu values (14, '기타류', '순대(1인분)', 6000, 4);
insert into menu values (15, '기타류', '라면', 5000, 4);
insert into menu values (16, '기타류', '어묵꼬치(3개)', 2500, 4);

insert into menu values (17, '세트류', '떡볶이+모듬튀김(튀김종류 1개씩)', 9500, 5);
insert into menu values (18, '세트류', '떡볶이+기본김밥', 7500, 5);
insert into menu values (19, '세트류', '떡볶이+치즈김밥', 8000, 5);
insert into menu values (20, '세트류', '떡볶이+컵밥', 8500, 5);
insert into menu values (21, '세트류', '떡볶이+어묵꼬치', 7000, 5);
insert into menu values (22, '세트류', '떡볶이+순대', 10500, 5);
insert into menu values (23, '세트류', '떡볶이에 치즈추가', 1000, 5);
insert into menu values (24, '세트류', '떡볶이에 사리추가', 1000, 5);
insert into menu values (25, '세트류', '로제떡볶이로 변경', 1500, 5);
insert into menu values (26, '세트류', '라면+기본김밥', 7500, 5);
insert into menu values (27, '세트류', '라면+치즈김밥', 8000, 5);

insert into menu values (28, '음료류', '콜라', 2000, 6);
insert into menu values (29, '음료류', '제로콜라', 2000, 6);
insert into menu values (30, '음료류', '사이다', 2000, 6);
insert into menu values (31, '음료류', '제로사이다', 2000, 6);
insert into menu values (32, '음료류', '환타', 2000, 6);

-- (3) customer 테이블 데이터 입력
-- insert into customer (custid, custname, custaddr, custphone) values ();
insert into customer values (1, '김분식', '서울 강남구', '010-1111-1111');
insert into customer values (2, '이라면', '서울 강서구', '010-2222-2222');
insert into customer values (3, '박모듬', '서울 은평구', '010-3333-3333');
insert into customer values (4, '이치즈', '서울 서초구', '010-4444-4444');
insert into customer values (5, '유사리', '서울 동작구', '010-5555-5555');
insert into customer values (6, '김제로', '서울 마포구', '010-6666-6666');
insert into customer values (7, '강만두', '서울 관악구', '010-7777-7777');
insert into customer values (8, '박로제', '서울 송파구', '010-8888-8888');
insert into customer values (9, '최분식', '서울 동대문구', '010-9999-9999');
insert into customer values (10, '유라면', '서울 성동구', '010-1010-1010');

-- (4) orders 테이블 데이터 입력
-- ordersid = 주문번호, takein ('Y' = 매장 식사, 'N' = 포장) 
-- orderdate = 주문날짜, custid = 고객번호
-- insert into orders (ordersid, takein, orderdate, custid) values ();
select * from orders;
insert into orders values (1, 'Y', '2024-05-01', 1);
insert into orders values (2, 'Y', '2024-05-01', 2);
insert into orders values (3, 'N', '2024-05-01', 3);
insert into orders values (4, 'N', '2024-05-01', 4);
insert into orders values (5, 'Y', '2024-05-01', 5);
insert into orders values (6, 'Y', '2024-05-02', 6);
insert into orders values (7, 'Y', '2024-05-02', 7);
insert into orders values (8, 'N', '2024-05-02', 8);
insert into orders values (9, 'N', '2024-05-02', 9);
insert into orders values (10, 'Y', '2024-05-02', 10);
insert into orders values (11, 'N', '2024-05-02', 1);
insert into orders values (12, 'N', '2024-05-02', 2);
insert into orders values (13, 'Y', '2024-05-02', 3);
insert into orders values (14, 'N', '2024-05-02', 4);
insert into orders values (15, 'N', '2024-05-02', 5);
insert into orders values (16, 'Y', '2024-05-03', 6);
insert into orders values (17, 'Y', '2024-05-03', 7);
insert into orders values (18, 'N', '2024-05-03', 8);
insert into orders values (19, 'N', '2024-05-03', 9);
insert into orders values (20, 'Y', '2024-05-03', 10);


-- (5) ordersmenu 테이블 데이터 입력
-- - 각 ordersid에 어떤 메뉴들을 주문했는지 알 수 있는 테이블
-- - ordersid 하나당 여러개의 menuid 값을 계속 넣을 수 있음
-- insert into ordersmenu (ordersmenuid, ordersid, menuid) values ();
insert into ordersmenu values (1, 1, 17);
insert into ordersmenu values (2, 1, 29);
insert into ordersmenu values (3, 1, 1);

insert into ordersmenu values (4, 2, 22);
insert into ordersmenu values (5, 2, 9);
insert into ordersmenu values (6, 2, 32);

insert into ordersmenu values (7, 3, 1);
insert into ordersmenu values (8, 3, 28);

insert into ordersmenu values (9, 4, 2);
insert into ordersmenu values (10, 4, 3);
insert into ordersmenu values (11, 4, 12);
insert into ordersmenu values (12, 4, 13);

insert into ordersmenu values (13, 5, 1);
insert into ordersmenu values (14, 5, 4);
insert into ordersmenu values (15, 5, 9);
insert into ordersmenu values (16, 5, 30);

insert into ordersmenu values (17, 6, 15);
insert into ordersmenu values (18, 6, 18);

insert into ordersmenu values (19, 7, 20);
insert into ordersmenu values (20, 7, 32);

insert into ordersmenu values (21, 8, 5);
insert into ordersmenu values (22, 8, 5);
insert into ordersmenu values (23, 8, 6);

insert into ordersmenu values (24, 9, 7);
insert into ordersmenu values (25, 9, 16);

insert into ordersmenu values (26, 10, 8);
insert into ordersmenu values (27, 10, 21);
insert into ordersmenu values (28, 10, 30);

insert into ordersmenu values (29, 11, 10);
insert into ordersmenu values (30, 11, 12);
insert into ordersmenu values (31, 11, 24);

insert into ordersmenu values (32, 12, 11);
insert into ordersmenu values (33, 12, 15);
insert into ordersmenu values (34, 12, 19);
insert into ordersmenu values (35, 12, 28);
insert into ordersmenu values (36, 12, 29);

insert into ordersmenu values (37, 13, 14);
insert into ordersmenu values (38, 13, 32);

insert into ordersmenu values (39, 14, 15);
insert into ordersmenu values (40, 14, 16);

insert into ordersmenu values (41, 15, 22);
insert into ordersmenu values (42, 15, 23);

insert into ordersmenu values (43, 16, 17);
insert into ordersmenu values (44, 16, 25);

insert into ordersmenu values (45, 17, 26);
insert into ordersmenu values (46, 17, 14);
insert into ordersmenu values (47, 17, 31);

insert into ordersmenu values (48, 18, 27);

insert into ordersmenu values (49, 19, 26);
insert into ordersmenu values (50, 19, 29);

insert into ordersmenu values (51, 20, 19);
insert into ordersmenu values (52, 20, 25);
insert into ordersmenu values (53, 20, 31);

-- (6) delivery 테이블
-- insert into delivery (status, ordersid, deliveryprice, deliveryid) values ();
-- status = 배달 상태 ("배달중", "완료"로 구분)
-- ordersid = 주문번호, deliveryprice = 배달비
-- deliveryid = 배달아이디
-- ** 배달은 orders테이블의 takein이 "N"인 주문 내용 중 일부만 진행하는 것으로 둠
--    ("N"인 값의 (ordersid 3, 4, 8, 9, 11, 12, 14, 15, 18, 19) 중에서 
--     일부만 배달 주문 받은 것으로 설정함)
insert into delivery values ('완료', 3, 2000, 1);
insert into delivery values ('완료', 8, 2000, 2);
insert into delivery values ('완료', 12, 1500, 3);
insert into delivery values ('완료', 15, 2000, 4);
insert into delivery values ('완료', 18, 2000, 5);
insert into delivery values ('진행중', 19, 2000, 6);


/*
<< 메뉴 종류 >>
* 분식류 >> 떡볶이/ 로제떡볶이 / 치즈추가 / 사리추가
* 밥류 >> 기본 김밥, 치즈 김밥, 스팸마요 컵밥, 참치마요 컵밥
* 튀김류 >> 만두(4개), 치즈스틱(3개), 만두튀김(2개), 치즈볼(3개)
* 기타류 >> 순대(1인분), 라면, 어묵꼬치(3개)
* 세트 >> 떡볶이+모듬튀김(튀김종류1개씩) / 떡볶이+김밥 / 
        떡볶이+치즈김밥 / 떡볶이+어묵꼬치 / 떡볶이+순대
* 음료 >> 콜라, 제로콜라, 사이다, 제로사이다, 환타
*/


