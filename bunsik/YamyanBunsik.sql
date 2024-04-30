-- yamyambunsik

-- 0. 사용자 생성 
create user c##bunsik identified by bunsik;
-- 1. 생성된 사용자에게 접속 권한 부여
grant connect, resource, dba to c##bunsik;
-- 2. 변경사항 적용하기
commit;

-- 3. 테이블 생성

-- 분식류 (아이디, 이름, 가격)
-- >> 떡볶이/ 치즈떡볶이 / 라볶이

-- 분식류 테이블 생성
CREATE TABLE menu_bunsik (
    bunsikid    NUMBER NOT NULL, -- 아이디 (기본키)
    bunsikname  VARCHAR2(20), -- 이름
    bunsikprice NUMBER, -- 가격
    menu_menuid NUMBER NOT NULL -- 메뉴아이디 (외래키)
);
ALTER TABLE menu_bunsik ADD CONSTRAINT menu_bunsik_pk PRIMARY KEY ( bunsikid );

-- 밥류 (아이디, 이름, 가격)
-- >> 기본 김밥, 치즈 김밥, 스팸마요 컵밥, 오므라이스

-- 밥류 테이블 생성
CREATE TABLE menu_bab (
    babid       NUMBER NOT NULL, -- 아이디 (기본키)
    babname     VARCHAR2(20), -- 이름
    babprice    NUMBER, -- 가격
    menu_menuid NUMBER NOT NULL -- 메뉴아이디 (외래키)
);
ALTER TABLE menu_bab ADD CONSTRAINT menu_bab_pk PRIMARY KEY ( babid );

-- 세트 (세트아이디, 세트명, 가격)
-- >> 떡볶이+모듬튀김(튀김종류1개씩) / 떡볶이+김밥 / 떡볶이+치즈김밥 / 떡볶이+어묵꼬치 / 떡볶이+순대
--    (떡볶이를 치즈떡볶이로 변경 시 1000원 추가) (떡볶이를 라볶이로 변경 시 1500원 추가)

-- 튀김류 (아이디, 이름, 가격)
-- >> 만두(4개), 치즈스틱(3개), 오징어튀김(2개), 치즈볼(3개)

-- 기타류 (아이디, 이름, 가격)
-- >> 순대(1인분), 라면, 어묵꼬치(3개)

-- 음료 (음료메뉴 아이디, 음료명, 가격)
-- >> 쿨피스, 콜라, 제로콜라, 사이다, 제로사이다, 환타

-- 주문 (주문아이디, 매장식사주문 아이디, 포장주문 아이디)


-- 메뉴 테이블 생성
CREATE TABLE menu (
    menuid   NUMBER NOT NULL, -- 메뉴 아이디 (기본키)
    menuname VARCHAR2(20) -- 메뉴명
);
-- 메뉴아이디 외래키로 받음
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menuid );





-- 음료 테이블 생성
CREATE TABLE menu_drinks (
    drinksid    NUMBER NOT NULL, -- 아이디 (기본키)
    drinksname  NUMBER, -- 이름
    drinksprice NUMBER, -- 가격
    menu_menuid NUMBER NOT NULL -- 메뉴아이디 (외래키)
);

ALTER TABLE menu_drinks ADD CONSTRAINT menu_drinks_pk PRIMARY KEY ( drinksid );

CREATE TABLE menu_fried (
    friedid     NUMBER NOT NULL,
    friedname   VARCHAR2(20),
    friedprice  NUMBER,
    menu_menuid NUMBER NOT NULL
);

ALTER TABLE menu_fried ADD CONSTRAINT menu_fried_pk PRIMARY KEY ( friedid );

-- 기타류 테이블 생성
CREATE TABLE menu_other (
    otherid     NUMBER NOT NULL, -- 아이디 (기본키)
    othername   VARCHAR2(20),
    otherprice  NUMBER,
    menu_menuid NUMBER NOT NULL
);

ALTER TABLE menu_other ADD CONSTRAINT menu_other_pk PRIMARY KEY ( otherid );

-- 세트류 테이블 생성
CREATE TABLE menu_set (
    setid       NUMBER NOT NULL, -- 아이디 (기본키) 
    setname     VARCHAR2(20), -- 이름
    setprice    NUMBER, -- 가격
    menu_menuid NUMBER NOT NULL -- 메뉴아이디(외래키)
);

ALTER TABLE menu_set ADD CONSTRAINT menu_set_pk PRIMARY KEY ( setid );

-- 세트류 세부 옵션 테이블 생성
CREATE TABLE menu_set_option (
    setoptionid    NUMBER, -- 세트 세부사항 아이디
    setoptionprice NUMBER, -- 가격
    menu_set_setid NUMBER NOT NULL -- 메뉴 아이디 (외래키)
);

-- 주문 테이블
CREATE TABLE "order" (
    orderid     NUMBER NOT NULL, -- 아이디
    togo        CHAR(1), -- 매장식사 / 포장 여부
    menu_menuid NUMBER NOT NULL, -- 메뉴아이디 (외래키)
    orderdate   DATE, -- 주문날짜
    verified char(1) constraint order_verified_CK
        check(verified IN('0', '1'))
        -- 0: togo (x) = 매장식사
        -- 1: togo (o) = 포장
);

ALTER TABLE "order" ADD CONSTRAINT order_pk PRIMARY KEY ( orderid );

ALTER TABLE menu_bab
    ADD CONSTRAINT menu_bab_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );

ALTER TABLE menu_bunsik
    ADD CONSTRAINT menu_bunsik_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );

ALTER TABLE menu_drinks
    ADD CONSTRAINT menu_drinks_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );

ALTER TABLE menu_fried
    ADD CONSTRAINT menu_fried_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );

ALTER TABLE menu_other
    ADD CONSTRAINT menu_other_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );

ALTER TABLE menu_set
    ADD CONSTRAINT menu_set_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );

ALTER TABLE menu_set_option
    ADD CONSTRAINT menu_set_option_menu_set_fk FOREIGN KEY ( menu_set_setid )
        REFERENCES menu_set ( setid );

ALTER TABLE "order"
    ADD CONSTRAINT order_menu_fk FOREIGN KEY ( menu_menuid )
        REFERENCES menu ( menuid );













