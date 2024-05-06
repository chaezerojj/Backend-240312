-- yamyambunsik

-- < 얌얌분식 주문 관리 프로그램(앱) >
-- * 프로그램 및 테이블 구성 설명
-- 1. 얌얌분식의 키오스크 앱 데이터베이스 프로그램이다.
-- 2. 테이블은 총 6개로 구성되어있으며
--    menu, menutype, orders, ordersmenu, customer, delivery 테이블이 있다.
-- 3. 각 테이블 당 기본키는 하나씩 지정되어 있다.
-- 4. 테이블당 지정된 기본키는 number타입의 id로,
--    외래키로 사용 시 보다 유기적으로 사용할 수 있도록 하기 위해 지정하였다.

-- 5. menu테이블은 menuid, typename, menuname, menuprice, typeid로 구성되어 있다.
-- 5-(1) menu테이블에서는 각 음식의 이름과 가격, 음식 종류를 알 수 있는 데이터가 들어가있으며,
--       menuid가 기본키이며 typeid는 menutype테이블에서 외래키로 받아온다.
-- 5-(2) 각 열의 데이터 유형은
--       menuid = number  /  typename = varchar(20)  /  menuname = varchar2(20)
--       menuprice = number  / typeid = number 이다.

-- 6. menutype테이블은 typeid, typename으로 구성되어 있다.
-- 6-(1) menutype테이블에서는 음식 종류를 구분하기 위해 만든 테이블로, 
--       음식 종류와 그에 따른 타입 아이디를 번호로 지정하였고,
--       typetid를 기본키로 두었다.
-- 6-(2) 각 열의 데이터 유형은 typeid = number  /  typename = varchar(20) 이다.

-- 7. orders테이블은 ordersid, takein, orderdate, custid로 구성되어 있다.
-- 7-(1) orders테이블에서는 주문번호, 매장식사여부, 주문날짜, 주문한 고객번호를 알 수 있는 데이터가 들어가있다.
-- 7-(2) 매장식사여부를 나타내는 takein 데이터 키는 매장식사 시 'Y', 포장주문 시 'N'로 구분한다.
-- 7-(3) ordersid가 기본키이며 custid는 customer테이블에서 외래키로 받아온다.
-- 7-(4) 각 열의 데이터 유형은 
--       ordersid = number  /  takein = varchar(20)  / menuid = number / 
--       orderdate = date / custid = number 이다.


-- 8. ordersmenu테이블은 ordersmenuid, ordersid, menuid로 구성되어있다.
-- 8-(1) ordersmenu테이블에서는 주문메뉴 번호, 주문번호, 메뉴 번호를 알 수 있는 데이터가 들어가있으며,
--       ordersmenuid가 기본키, ordersid와 menuid는 각각 외래키로 받아온다.
-- 8-(2) 주문번호(ordersid)에 따라 여러개의 메뉴(menuid)를 받을 수 있도록 하기 위해 구분한 테이블로,
--       orders테이블에서 받는 주문의 상세 주문 메뉴를 알 수 있는 테이블로 볼 수 있다.
-- 8-(3) ordersmenuid는 메뉴의 개수에 따라 하나씩 들어오는 키이지만, 데이터를 관리하기 위해 지정된 기본키로
--       데이터를 조회하거나 관리할 때 주로 사용되지는 않는다.
-- 8-(4) 각 열의 데이터 유형은
--       ordersmenuid = number / ordersid = number / menuid = number 이다.


-- 9. customer테이블은 custid, custname, custaddr, custphone으로 구성되어 있다.
-- 9-(1) customer테이블에서는 고객번호, 고객이름, 고객 주소, 고객 전화번호로 구성되어 있으며,
--       고객 데이터를 보관하는 테이블로 custid가 기본키로 지정되어있다.
-- 9-(2) 해당 데이터베이스에서는 주문마다 custid가 들어가있기 때문에 고객번호가 있어야 주문이 가능한 구조로,
--       모든 고객은 주문 내역을 최소 1개 이상 가지고 있다.
-- 9-(3) 각 열의 데이터 유형은
--       custid = number / custname = varchar2(20) / 
--       custaddr = varchar2(100) / custphone = varchar2 (20) 이다.


-- 10. delivery테이블은 deliveryid, status, ordersid, deliveryprice로 구성되어있다.
-- 10-(1) delivery테이블에서는 배달번호, 배달 상태, 주문 번호, 배달비를 알 수 있는 데이터가 들어가있으며,
--        deliveryid는 기본키, ordersid는 외래키로 받아온다.
-- 10-(2) 배달상태 데이터 status는 '진행중'과 '완료'로 값이 구분되어 들어간다.
-- 10-(3) 배달은 orders테이블의 takein='N'인 값을 기준으로 일부가 delivery테이블의 deliveryid로 들어갔다.
-- 10-(4) deliveryprice는 주문번호마다 다르며, 금액은 임의로 작성되어 배달 금액에 대한 기준을 따로 두지 않았다.

-- 테이블 간 관계
-- 1. orders테이블 - customer테이블
-- - orders테이블의 custid열은 customer테이블의 custid열을 외래키로 참조하는 일대다(1:N)관계
-- - >> 한 명의 고객(custid)이 여러 주문(ordersid)을 할 수 있는 관계로
--      즉, custid 1개 당 ordersid가 여러 개일 수 있다는 뜻

-- 2. orders테이블 - ordersmenu테이블
-- - orders테이블의 ordersid열은 ordersmenu테이블의 ordersid열을 외래키로 참조하는 일대다(1:N)관계
-- - >> 1개의 주문(ordersid)에 여러 개의 주문메뉴(menuid)가 포함될 수 있다는 관계로
--      즉, ordersid 1개 당 menuid가 여러 개일 수 있다는 뜻

-- 3. menu테이블 - ordersmenu테이블
-- - menu테이블의 menuid열은 ordersmenu테이블의 menuid열을 외래키로 참조하는 일대일(1:1)관계
-- - >> 주문메뉴(menuid) 1개가 하나의 메뉴가 대응된다는 뜻

-- 4. delivery테이블 - orders테이블
-- - delivery테이블의 ordersid는 orders테이블의 ordersid열을 외래키로 참조하는 일대일(1:1)관계
-- - >> 1개의 주문(ordersid)에는 하나의 배달정보가 포함될 수 있다는 뜻

-------------------------------------------------------------------------------------------------------

-- 0. 사용자 생성 
create user c##bunsik identified by bunsik;

-- 1. 생성된 사용자에게 접속 권한 부여
grant connect, resource, dba to c##bunsik;

-- 2. 변경사항 적용하기
commit;

-- 3. 테이블 생성 및 외래키 설정

-- (1) customer(고객) 테이블 생성
create table customer (
    custid    number not null, -- 고객아이디(기본키)
    custname  varchar2(20), -- 고객이름
    custaddr  varchar2(100), -- 고객 주소
    custphone varchar2(20) -- 고객 전화번호
);
-- custid를 기본키로 설정
alter table customer add constraint customer_pk primary key (custid);


-- (2) delivery(배달) 테이블 생성
create table delivery (
    deliveryid      number not null, -- 배달아이디
    status          varchar2(20), -- 배달상태
    ordersid        number not null, -- 외래키
    deliveryprice   number -- 배달가격
);
-- deliveryid를 기본키로 설정
alter table delivery add constraint delivery_pk primary key (deliveryid);
-- ordersid를 외래키로 설정
alter table delivery 
    add constraint delivery_orders_fk 
    foreign key (ordersid) references orders (ordersid);


-- (3) menu(메뉴) 테이블 생성
create table menu (
    menuid    NUMBER NOT NULL, -- 메뉴 아이디(기본키)
    typename  varchar2(20), -- 메뉴종류 
    menuname  varchar2(50), -- 이름
    menuprice number, -- 가격
    typeid    number -- 메뉴타입 아이디
);

-- menuid를 기본키로 설정
alter table menu add constraint menu_pk primary key ( menuid );
-- menutype테이블의 typeid를 외래키로 받아옴
alter table menu
    add constraint menu_type_fk foreign key (typeid) references menutype(typeid);


-- (4) orders(주문) 테이블 생성
create table orders (
    ordersid    number not null, -- 기본키
    takein      varchar2(10), -- 매장 식사 여부 (Y/N)로 표시
    orderdate   date, -- 주문날짜
    custid      number not null -- 외래키: custid
);
-- ordersid를 기본키로 설정
ALTER TABLE orders ADD CONSTRAINT order_pk PRIMARY KEY ( ordersid );

-- delivery 테이블에 orders테이블의 ordersid를 외래키로 받아옴
alter table delivery
    add constraint delivery_orders_fk foreign key ( ordersid )
        references orders ( ordersid );
-- orders 테이블에 customer테이블의 custid를 외래키로 받아옴
alter table orders
    add constraint orders_customer_fk foreign key ( custid )
        references customer ( custid );

    
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
create table ordersmenu (
    ordersmenuid   number not null, -- 주문메뉴 아이디(기본키)
    ordersid       number not null, -- 주문아이디 (외래키 - orders)
    menuid         number not null, -- 메뉴아이디 (외래키 - menuid)
    -- ordersmenuid를 기본키로 설정
    constraint ordermenu_pk primary key (ordersmenuid), 
    -- ordersid에 대한 외래 키 제약 조건 추가
    constraint ordersmenu_orders_fk 
        foreign key (ordersid) references orders (ordersid), 
    -- menuid에 대한 외래 키 제약 조건 추가
    constraint ordersmenu_menu_fk 
        foreign key (menuid) references menu (menuid) 
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
-- insert into delivery (deliveryid, status, ordersid, deliveryprice) values ();
-- status = 배달 상태 ("배달중", "완료"로 구분)
-- ordersid = 주문번호, deliveryprice = 배달비
-- deliveryid = 배달아이디
-- ** 배달은 orders테이블의 takein이 "N"인 주문 내용 중 일부만 진행하는 것으로 둠
--    ("N"인 값의 (ordersid 3, 4, 8, 9, 11, 12, 14, 15, 18, 19) 중에서 
--     일부만 배달 주문 받은 것으로 설정함)
insert into delivery values (1, '완료', 3, 2000);
insert into delivery values (2, '완료', 8, 2000);
insert into delivery values (3, '완료', 12, 1500);
insert into delivery values (4, '완료', 15, 2000);
insert into delivery values (5, '완료', 18, 2000);
insert into delivery values (6, '진행중', 19, 2000);


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


