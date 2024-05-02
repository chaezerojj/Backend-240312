-- yamyambunsik

-- 0. ����� ���� 
create user c##bunsik identified by bunsik;

-- 1. ������ ����ڿ��� ���� ���� �ο�
grant connect, resource, dba to c##bunsik;

-- 2. ������� �����ϱ�
commit;

-- ���н� �ֹ� ���� ���α׷�(��)
-- 1. ���н��� Ű����ũ �� �����ͺ��̽� ���α׷��̴�
-- 2. ���̺��� �� 6���� �����Ǿ�������
--    menu, menutype, orders, ordersmenu, customer, delivery ���̺��� �ִ�.
-- 3. �� ���̺� �� �⺻Ű�� �ϳ��� ����



-- 3. ���̺� ���� �� �ܷ�Ű ����

-- (1) customer(��) ���̺� ����
CREATE TABLE customer (
    custid    NUMBER NOT NULL, -- �����̵�(�⺻Ű)
    custname  VARCHAR2(20), -- ���̸�
    custaddr  VARCHAR2(100), -- �� �ּ�
    custphone VARCHAR2(20) -- �� ��ȭ��ȣ
);
-- custid�� �⺻Ű�� ����
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );


-- (2) delivery(���) ���̺� ����
CREATE TABLE delivery (
    deliveryid      NUMBER NOT NULL, -- ��޾��̵�
    status          VARCHAR2(10), -- ��޻���
    ordersid        NUMBER NOT NULL, -- �ܷ�Ű
    deliveryprice   NUMBER -- ��ް���
);
-- ��޾��̵� �⺻Ű�� ����
ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY (deliveryid);
-- ordersid�� �ܷ�Ű�� ����
ALTER TABLE delivery 
    ADD CONSTRAINT delivery_orders_fk 
    FOREIGN KEY (ordersid) REFERENCES orders (ordersid);


-- (3) menu(�޴�) ���̺� ����
CREATE TABLE menu 
    menuid    NUMBER NOT NULL, -- �޴� ���̵�(�⺻Ű)
    typename  VARCHAR2(20), -- �޴����� 
    menuname  VARCHAR2(50), -- �̸�
    menuprice NUMBER -- ����
    typeid    number -- �޴�Ÿ�� ���̵�
);

-- menuid�� �⺻Ű�� ����
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menuid );
-- menutype���̺��� typeid�� �ܷ�Ű�� �޾ƿ�
alter table menu
    add constraint menu_type_fk foreign key (typeid) references menutype(typeid);


-- (4) orders(�ֹ�) ���̺� ����
CREATE TABLE orders (
    ordersid    NUMBER NOT NULL, -- �⺻Ű
    takein      VARCHAR2(10), -- ���� �Ļ� ���� (Y/N)�� ǥ��
    orderdate   DATE, -- �ֹ���¥
    custid      NUMBER NOT NULL -- �ܷ�Ű: custid
    -- ordersid�� �⺻Ű�� ����
    CONSTRAINT order_pk PRIMARY KEY ( ordersid ),
);
-- delivery ���̺� orders���̺��� ordersid�� �ܷ�Ű�� �޾ƿ�
ALTER TABLE delivery
    ADD CONSTRAINT delivery_orders_fk FOREIGN KEY ( ordersid )
        REFERENCES orders ( ordersid );
-- orders ���̺� customer���̺��� custid�� �ܷ�Ű�� �޾ƿ�
ALTER TABLE orders
    ADD CONSTRAINT orders_customer_fk FOREIGN KEY ( custid )
        REFERENCES customer ( custid );

    
-- (5) menutype(�޴�Ÿ��)���̺� ����
-- - �޴�Ÿ�Կ� ���� ���̺��� ������ �����Ͽ� �޴�Ÿ�Կ� ���� �������� ���̰�,
-- - �����͸� ���� �� �����ϰ� ������ �� ����
create table menutype (
    typeid number primary key, -- �޴�Ÿ�Ծ��̵� (�⺻Ű)
    typename varchar2(20) -- �޴��̸�
);

-- (6) orders_menu(�ֹ��޴�) ���̺� ����
-- - �� �ֹ� �� �������� �޴��� �ֹ��� �� �ֵ���, �ֹ��޴� ���̺��� �����Ͽ�
--   ordersid �ϳ� �� ���� ���� menuid�� ���� �� �ֵ��� ��
-- - ordersid���� ������ menuid�� ���� �� �� �� ����
-- - �޴� �ϳ��� �� ������ ordersmenuid �� ���� ���� ��
CREATE TABLE ordersmenu (
    ordersmenuid   NUMBER NOT NULL, -- �ֹ��޴� ���̵�(�⺻Ű)
    ordersid       NUMBER NOT NULL, -- �ֹ����̵� (�ܷ�Ű - orders)
    menuid         NUMBER NOT NULL, -- �޴����̵� (�ܷ�Ű - menuid)
    -- ordersmenuid�� �⺻Ű�� ����
    CONSTRAINT ordermenu_pk PRIMARY KEY (ordersmenuid), 
    -- ordersid�� ���� �ܷ� Ű ���� ���� �߰�
    CONSTRAINT ordersmenu_orders_fk 
        FOREIGN KEY (ordersid) REFERENCES orders (ordersid), 
    -- menuid�� ���� �ܷ� Ű ���� ���� �߰�
    CONSTRAINT ordersmenu_menu_fk 
        FOREIGN KEY (menuid) REFERENCES menu (menuid) 
);


-- 4. ���̺� �� ������ �Է�
-- (1) menytype ���̺� ������ �Է�
-- (�ܷ�Ű�� menutype - typeid�� menu - typeid�� ����Ǿ� �ֱ� ������ ���� ������ �־�� ��)
-- insert into menutype (typeid, typename) values ();
insert into menutype values (1, '�нķ�');
insert into menutype values (2, '���');
insert into menutype values (3, 'Ƣ���');
insert into menutype values (4, '��Ÿ��');
insert into menutype values (5, '��Ʈ��');
insert into menutype values (6, '�����');

-- (2) menu ���̺� ������ �Է�
-- insert into menu (menuid, typename, menuname, menuprice, typeid) values ();
insert into menu values (1, '�нķ�', '������', 5000, 1);
insert into menu values (2, '�нķ�', '����������', 6500, 1);
insert into menu values (3, '�нķ�', '�縮�߰�', 1000, 1);
insert into menu values (4, '�нķ�', 'ġ���߰�', 1000, 1);

insert into menu values (5, '���', '�⺻���', 3000, 2);
insert into menu values (6, '���', 'ġ����', 3500, 2);
insert into menu values (7, '���', '���Ը��� �Ź�', 4000, 2);
insert into menu values (8, '���', '��ġ���� �Ź�', 4000, 2);

insert into menu values (9, 'Ƣ���', '����(3��)', 3000, 3);
insert into menu values (10, 'Ƣ���', 'ġ�ƽ(3��)', 3000, 3);
insert into menu values (11, 'Ƣ���', '����Ƣ��(2��)', 3000, 3);
insert into menu values (12, 'Ƣ���', '�踻��(3��)', 2500, 3);
insert into menu values (13, 'Ƣ���', 'ġ�(3��)', 2500, 3);

insert into menu values (14, '��Ÿ��', '����(1�κ�)', 6000, 4);
insert into menu values (15, '��Ÿ��', '���', 5000, 4);
insert into menu values (16, '��Ÿ��', '���ġ(3��)', 2500, 4);

insert into menu values (17, '��Ʈ��', '������+���Ƣ��(Ƣ������ 1����)', 9500, 5);
insert into menu values (18, '��Ʈ��', '������+�⺻���', 7500, 5);
insert into menu values (19, '��Ʈ��', '������+ġ����', 8000, 5);
insert into menu values (20, '��Ʈ��', '������+�Ź�', 8500, 5);
insert into menu values (21, '��Ʈ��', '������+���ġ', 7000, 5);
insert into menu values (22, '��Ʈ��', '������+����', 10500, 5);
insert into menu values (23, '��Ʈ��', '�����̿� ġ���߰�', 1000, 5);
insert into menu values (24, '��Ʈ��', '�����̿� �縮�߰�', 1000, 5);
insert into menu values (25, '��Ʈ��', '���������̷� ����', 1500, 5);
insert into menu values (26, '��Ʈ��', '���+�⺻���', 7500, 5);
insert into menu values (27, '��Ʈ��', '���+ġ����', 8000, 5);

insert into menu values (28, '�����', '�ݶ�', 2000, 6);
insert into menu values (29, '�����', '�����ݶ�', 2000, 6);
insert into menu values (30, '�����', '���̴�', 2000, 6);
insert into menu values (31, '�����', '���λ��̴�', 2000, 6);
insert into menu values (32, '�����', 'ȯŸ', 2000, 6);

-- (3) customer ���̺� ������ �Է�
-- insert into customer (custid, custname, custaddr, custphone) values ();
insert into customer values (1, '��н�', '���� ������', '010-1111-1111');
insert into customer values (2, '�̶��', '���� ������', '010-2222-2222');
insert into customer values (3, '�ڸ��', '���� ����', '010-3333-3333');
insert into customer values (4, '��ġ��', '���� ���ʱ�', '010-4444-4444');
insert into customer values (5, '���縮', '���� ���۱�', '010-5555-5555');
insert into customer values (6, '������', '���� ������', '010-6666-6666');
insert into customer values (7, '������', '���� ���Ǳ�', '010-7777-7777');
insert into customer values (8, '�ڷ���', '���� ���ı�', '010-8888-8888');
insert into customer values (9, '�ֺн�', '���� ���빮��', '010-9999-9999');
insert into customer values (10, '�����', '���� ������', '010-1010-1010');

-- (4) orders ���̺� ������ �Է�
-- ordersid = �ֹ���ȣ, takein ('Y' = ���� �Ļ�, 'N' = ����) 
-- orderdate = �ֹ���¥, custid = ����ȣ
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


-- (5) ordersmenu ���̺� ������ �Է�
-- - �� ordersid�� � �޴����� �ֹ��ߴ��� �� �� �ִ� ���̺�
-- - ordersid �ϳ��� �������� menuid ���� ��� ���� �� ����
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

-- (6) delivery ���̺�
-- insert into delivery (status, ordersid, deliveryprice, deliveryid) values ();
-- status = ��� ���� ("�����", "�Ϸ�"�� ����)
-- ordersid = �ֹ���ȣ, deliveryprice = ��޺�
-- deliveryid = ��޾��̵�
-- ** ����� orders���̺��� takein�� "N"�� �ֹ� ���� �� �Ϻθ� �����ϴ� ������ ��
--    ("N"�� ���� (ordersid 3, 4, 8, 9, 11, 12, 14, 15, 18, 19) �߿��� 
--     �Ϻθ� ��� �ֹ� ���� ������ ������)
insert into delivery values ('�Ϸ�', 3, 2000, 1);
insert into delivery values ('�Ϸ�', 8, 2000, 2);
insert into delivery values ('�Ϸ�', 12, 1500, 3);
insert into delivery values ('�Ϸ�', 15, 2000, 4);
insert into delivery values ('�Ϸ�', 18, 2000, 5);
insert into delivery values ('������', 19, 2000, 6);


/*
<< �޴� ���� >>
* �нķ� >> ������/ ���������� / ġ���߰� / �縮�߰�
* ��� >> �⺻ ���, ġ�� ���, ���Ը��� �Ź�, ��ġ���� �Ź�
* Ƣ��� >> ����(4��), ġ�ƽ(3��), ����Ƣ��(2��), ġ�(3��)
* ��Ÿ�� >> ����(1�κ�), ���, ���ġ(3��)
* ��Ʈ >> ������+���Ƣ��(Ƣ������1����) / ������+��� / 
        ������+ġ���� / ������+���ġ / ������+����
* ���� >> �ݶ�, �����ݶ�, ���̴�, ���λ��̴�, ȯŸ
*/


