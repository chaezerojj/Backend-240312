-- yamyambunsik

-- 0. ����� ���� 
create user c##bunsik identified by bunsik;
-- 1. ������ ����ڿ��� ���� ���� �ο�
grant connect, resource, dba to c##bunsik;
-- 2. ������� �����ϱ�
commit;

-- 3. ���̺� ����

-- �нķ� (���̵�, �̸�, ����)
-- >> ������/ ġ����� / ����

-- �нķ� ���̺� ����
CREATE TABLE menu_bunsik (
    bunsikid    NUMBER NOT NULL, -- ���̵� (�⺻Ű)
    bunsikname  VARCHAR2(20), -- �̸�
    bunsikprice NUMBER, -- ����
    menu_menuid NUMBER NOT NULL -- �޴����̵� (�ܷ�Ű)
);
ALTER TABLE menu_bunsik ADD CONSTRAINT menu_bunsik_pk PRIMARY KEY ( bunsikid );

-- ��� (���̵�, �̸�, ����)
-- >> �⺻ ���, ġ�� ���, ���Ը��� �Ź�, ���Ƕ��̽�

-- ��� ���̺� ����
CREATE TABLE menu_bab (
    babid       NUMBER NOT NULL, -- ���̵� (�⺻Ű)
    babname     VARCHAR2(20), -- �̸�
    babprice    NUMBER, -- ����
    menu_menuid NUMBER NOT NULL -- �޴����̵� (�ܷ�Ű)
);
ALTER TABLE menu_bab ADD CONSTRAINT menu_bab_pk PRIMARY KEY ( babid );

-- ��Ʈ (��Ʈ���̵�, ��Ʈ��, ����)
-- >> ������+���Ƣ��(Ƣ������1����) / ������+��� / ������+ġ���� / ������+���ġ / ������+����
--    (�����̸� ġ����̷� ���� �� 1000�� �߰�) (�����̸� ���̷� ���� �� 1500�� �߰�)

-- Ƣ��� (���̵�, �̸�, ����)
-- >> ����(4��), ġ�ƽ(3��), ��¡��Ƣ��(2��), ġ�(3��)

-- ��Ÿ�� (���̵�, �̸�, ����)
-- >> ����(1�κ�), ���, ���ġ(3��)

-- ���� (����޴� ���̵�, �����, ����)
-- >> ���ǽ�, �ݶ�, �����ݶ�, ���̴�, ���λ��̴�, ȯŸ

-- �ֹ� (�ֹ����̵�, ����Ļ��ֹ� ���̵�, �����ֹ� ���̵�)


-- �޴� ���̺� ����
CREATE TABLE menu (
    menuid   NUMBER NOT NULL, -- �޴� ���̵� (�⺻Ű)
    menuname VARCHAR2(20) -- �޴���
);
-- �޴����̵� �ܷ�Ű�� ����
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menuid );





-- ���� ���̺� ����
CREATE TABLE menu_drinks (
    drinksid    NUMBER NOT NULL, -- ���̵� (�⺻Ű)
    drinksname  NUMBER, -- �̸�
    drinksprice NUMBER, -- ����
    menu_menuid NUMBER NOT NULL -- �޴����̵� (�ܷ�Ű)
);

ALTER TABLE menu_drinks ADD CONSTRAINT menu_drinks_pk PRIMARY KEY ( drinksid );

CREATE TABLE menu_fried (
    friedid     NUMBER NOT NULL,
    friedname   VARCHAR2(20),
    friedprice  NUMBER,
    menu_menuid NUMBER NOT NULL
);

ALTER TABLE menu_fried ADD CONSTRAINT menu_fried_pk PRIMARY KEY ( friedid );

-- ��Ÿ�� ���̺� ����
CREATE TABLE menu_other (
    otherid     NUMBER NOT NULL, -- ���̵� (�⺻Ű)
    othername   VARCHAR2(20),
    otherprice  NUMBER,
    menu_menuid NUMBER NOT NULL
);

ALTER TABLE menu_other ADD CONSTRAINT menu_other_pk PRIMARY KEY ( otherid );

-- ��Ʈ�� ���̺� ����
CREATE TABLE menu_set (
    setid       NUMBER NOT NULL, -- ���̵� (�⺻Ű) 
    setname     VARCHAR2(20), -- �̸�
    setprice    NUMBER, -- ����
    menu_menuid NUMBER NOT NULL -- �޴����̵�(�ܷ�Ű)
);

ALTER TABLE menu_set ADD CONSTRAINT menu_set_pk PRIMARY KEY ( setid );

-- ��Ʈ�� ���� �ɼ� ���̺� ����
CREATE TABLE menu_set_option (
    setoptionid    NUMBER, -- ��Ʈ ���λ��� ���̵�
    setoptionprice NUMBER, -- ����
    menu_set_setid NUMBER NOT NULL -- �޴� ���̵� (�ܷ�Ű)
);

-- �ֹ� ���̺�
CREATE TABLE "order" (
    orderid     NUMBER NOT NULL, -- ���̵�
    togo        CHAR(1), -- ����Ļ� / ���� ����
    menu_menuid NUMBER NOT NULL, -- �޴����̵� (�ܷ�Ű)
    orderdate   DATE, -- �ֹ���¥
    verified char(1) constraint order_verified_CK
        check(verified IN('0', '1'))
        -- 0: togo (x) = ����Ļ�
        -- 1: togo (o) = ����
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













