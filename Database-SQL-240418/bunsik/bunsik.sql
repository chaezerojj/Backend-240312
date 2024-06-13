-- yamyambunsik

-- < ���н� �ֹ� ���� ���α׷�(��) >
-- * ���α׷� �� ���̺� ���� ����
-- 1. ���н��� Ű����ũ �� �����ͺ��̽� ���α׷��̴�.
-- 2. ���̺��� �� 6���� �����Ǿ�������
--    menu, menutype, orders, ordersmenu, customer, delivery ���̺��� �ִ�.
-- 3. �� ���̺� �� �⺻Ű�� �ϳ��� �����Ǿ� �ִ�.
-- 4. ���̺�� ������ �⺻Ű�� numberŸ���� id��,
--    �ܷ�Ű�� ��� �� ���� ���������� ����� �� �ֵ��� �ϱ� ���� �����Ͽ���.

-- 5. menu���̺��� menuid, typename, menuname, menuprice, typeid�� �����Ǿ� �ִ�.
-- 5-(1) menu���̺����� �� ������ �̸��� ����, ���� ������ �� �� �ִ� �����Ͱ� ��������,
--       menuid�� �⺻Ű�̸� typeid�� menutype���̺��� �ܷ�Ű�� �޾ƿ´�.
-- 5-(2) �� ���� ������ ������
--       menuid = number  /  typename = varchar(20)  /  menuname = varchar2(20)
--       menuprice = number  / typeid = number �̴�.

-- 6. menutype���̺��� typeid, typename���� �����Ǿ� �ִ�.
-- 6-(1) menutype���̺����� ���� ������ �����ϱ� ���� ���� ���̺��, 
--       ���� ������ �׿� ���� Ÿ�� ���̵� ��ȣ�� �����Ͽ���,
--       typetid�� �⺻Ű�� �ξ���.
-- 6-(2) �� ���� ������ ������ typeid = number  /  typename = varchar(20) �̴�.

-- 7. orders���̺��� ordersid, takein, orderdate, custid�� �����Ǿ� �ִ�.
-- 7-(1) orders���̺����� �ֹ���ȣ, ����Ļ翩��, �ֹ���¥, �ֹ��� ����ȣ�� �� �� �ִ� �����Ͱ� ���ִ�.
-- 7-(2) ����Ļ翩�θ� ��Ÿ���� takein ������ Ű�� ����Ļ� �� 'Y', �����ֹ� �� 'N'�� �����Ѵ�.
-- 7-(3) ordersid�� �⺻Ű�̸� custid�� customer���̺��� �ܷ�Ű�� �޾ƿ´�.
-- 7-(4) �� ���� ������ ������ 
--       ordersid = number  /  takein = varchar(20)  / menuid = number / 
--       orderdate = date / custid = number �̴�.


-- 8. ordersmenu���̺��� ordersmenuid, ordersid, menuid�� �����Ǿ��ִ�.
-- 8-(1) ordersmenu���̺����� �ֹ��޴� ��ȣ, �ֹ���ȣ, �޴� ��ȣ�� �� �� �ִ� �����Ͱ� ��������,
--       ordersmenuid�� �⺻Ű, ordersid�� menuid�� ���� �ܷ�Ű�� �޾ƿ´�.
-- 8-(2) �ֹ���ȣ(ordersid)�� ���� �������� �޴�(menuid)�� ���� �� �ֵ��� �ϱ� ���� ������ ���̺��,
--       orders���̺��� �޴� �ֹ��� �� �ֹ� �޴��� �� �� �ִ� ���̺�� �� �� �ִ�.
-- 8-(3) ordersmenuid�� �޴��� ������ ���� �ϳ��� ������ Ű������, �����͸� �����ϱ� ���� ������ �⺻Ű��
--       �����͸� ��ȸ�ϰų� ������ �� �ַ� �������� �ʴ´�.
-- 8-(4) �� ���� ������ ������
--       ordersmenuid = number / ordersid = number / menuid = number �̴�.


-- 9. customer���̺��� custid, custname, custaddr, custphone���� �����Ǿ� �ִ�.
-- 9-(1) customer���̺����� ����ȣ, ���̸�, �� �ּ�, �� ��ȭ��ȣ�� �����Ǿ� ������,
--       �� �����͸� �����ϴ� ���̺�� custid�� �⺻Ű�� �����Ǿ��ִ�.
-- 9-(2) �ش� �����ͺ��̽������� �ֹ����� custid�� ���ֱ� ������ ����ȣ�� �־�� �ֹ��� ������ ������,
--       ��� ���� �ֹ� ������ �ּ� 1�� �̻� ������ �ִ�.
-- 9-(3) �� ���� ������ ������
--       custid = number / custname = varchar2(20) / 
--       custaddr = varchar2(100) / custphone = varchar2 (20) �̴�.


-- 10. delivery���̺��� deliveryid, status, ordersid, deliveryprice�� �����Ǿ��ִ�.
-- 10-(1) delivery���̺����� ��޹�ȣ, ��� ����, �ֹ� ��ȣ, ��޺� �� �� �ִ� �����Ͱ� ��������,
--        deliveryid�� �⺻Ű, ordersid�� �ܷ�Ű�� �޾ƿ´�.
-- 10-(2) ��޻��� ������ status�� '������'�� '�Ϸ�'�� ���� ���еǾ� ����.
-- 10-(3) ����� orders���̺��� takein='N'�� ���� �������� �Ϻΰ� delivery���̺��� deliveryid�� ����.
-- 10-(4) deliveryprice�� �ֹ���ȣ���� �ٸ���, �ݾ��� ���Ƿ� �ۼ��Ǿ� ��� �ݾ׿� ���� ������ ���� ���� �ʾҴ�.

-- ���̺� �� ����
-- 1. orders���̺� - customer���̺�
-- - orders���̺��� custid���� customer���̺��� custid���� �ܷ�Ű�� �����ϴ� �ϴ��(1:N)����
-- - >> �� ���� ��(custid)�� ���� �ֹ�(ordersid)�� �� �� �ִ� �����
--      ��, custid 1�� �� ordersid�� ���� ���� �� �ִٴ� ��

-- 2. orders���̺� - ordersmenu���̺�
-- - orders���̺��� ordersid���� ordersmenu���̺��� ordersid���� �ܷ�Ű�� �����ϴ� �ϴ��(1:N)����
-- - >> 1���� �ֹ�(ordersid)�� ���� ���� �ֹ��޴�(menuid)�� ���Ե� �� �ִٴ� �����
--      ��, ordersid 1�� �� menuid�� ���� ���� �� �ִٴ� ��

-- 3. menu���̺� - ordersmenu���̺�
-- - menu���̺��� menuid���� ordersmenu���̺��� menuid���� �ܷ�Ű�� �����ϴ� �ϴ���(1:1)����
-- - >> �ֹ��޴�(menuid) 1���� �ϳ��� �޴��� �����ȴٴ� ��

-- 4. delivery���̺� - orders���̺�
-- - delivery���̺��� ordersid�� orders���̺��� ordersid���� �ܷ�Ű�� �����ϴ� �ϴ���(1:1)����
-- - >> 1���� �ֹ�(ordersid)���� �ϳ��� ��������� ���Ե� �� �ִٴ� ��

-------------------------------------------------------------------------------------------------------

-- 0. ����� ���� 
create user c##bunsik identified by bunsik;

-- 1. ������ ����ڿ��� ���� ���� �ο�
grant connect, resource, dba to c##bunsik;

-- 2. ������� �����ϱ�
commit;

-- 3. ���̺� ���� �� �ܷ�Ű ����

-- (1) customer(��) ���̺� ����
create table customer (
    custid    number not null, -- �����̵�(�⺻Ű)
    custname  varchar2(20), -- ���̸�
    custaddr  varchar2(100), -- �� �ּ�
    custphone varchar2(20) -- �� ��ȭ��ȣ
);
-- custid�� �⺻Ű�� ����
alter table customer add constraint customer_pk primary key (custid);


-- (2) delivery(���) ���̺� ����
create table delivery (
    deliveryid      number not null, -- ��޾��̵�
    status          varchar2(20), -- ��޻���
    ordersid        number not null, -- �ܷ�Ű
    deliveryprice   number -- ��ް���
);
-- deliveryid�� �⺻Ű�� ����
alter table delivery add constraint delivery_pk primary key (deliveryid);
-- ordersid�� �ܷ�Ű�� ����
alter table delivery 
    add constraint delivery_orders_fk 
    foreign key (ordersid) references orders (ordersid);


-- (3) menu(�޴�) ���̺� ����
create table menu (
    menuid    NUMBER NOT NULL, -- �޴� ���̵�(�⺻Ű)
    typename  varchar2(20), -- �޴����� 
    menuname  varchar2(50), -- �̸�
    menuprice number, -- ����
    typeid    number -- �޴�Ÿ�� ���̵�
);

-- menuid�� �⺻Ű�� ����
alter table menu add constraint menu_pk primary key ( menuid );
-- menutype���̺��� typeid�� �ܷ�Ű�� �޾ƿ�
alter table menu
    add constraint menu_type_fk foreign key (typeid) references menutype(typeid);


-- (4) orders(�ֹ�) ���̺� ����
create table orders (
    ordersid    number not null, -- �⺻Ű
    takein      varchar2(10), -- ���� �Ļ� ���� (Y/N)�� ǥ��
    orderdate   date, -- �ֹ���¥
    custid      number not null -- �ܷ�Ű: custid
);
-- ordersid�� �⺻Ű�� ����
ALTER TABLE orders ADD CONSTRAINT order_pk PRIMARY KEY ( ordersid );

-- delivery ���̺� orders���̺��� ordersid�� �ܷ�Ű�� �޾ƿ�
alter table delivery
    add constraint delivery_orders_fk foreign key ( ordersid )
        references orders ( ordersid );
-- orders ���̺� customer���̺��� custid�� �ܷ�Ű�� �޾ƿ�
alter table orders
    add constraint orders_customer_fk foreign key ( custid )
        references customer ( custid );

    
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
create table ordersmenu (
    ordersmenuid   number not null, -- �ֹ��޴� ���̵�(�⺻Ű)
    ordersid       number not null, -- �ֹ����̵� (�ܷ�Ű - orders)
    menuid         number not null, -- �޴����̵� (�ܷ�Ű - menuid)
    -- ordersmenuid�� �⺻Ű�� ����
    constraint ordermenu_pk primary key (ordersmenuid), 
    -- ordersid�� ���� �ܷ� Ű ���� ���� �߰�
    constraint ordersmenu_orders_fk 
        foreign key (ordersid) references orders (ordersid), 
    -- menuid�� ���� �ܷ� Ű ���� ���� �߰�
    constraint ordersmenu_menu_fk 
        foreign key (menuid) references menu (menuid) 
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
-- insert into delivery (deliveryid, status, ordersid, deliveryprice) values ();
-- status = ��� ���� ("�����", "�Ϸ�"�� ����)
-- ordersid = �ֹ���ȣ, deliveryprice = ��޺�
-- deliveryid = ��޾��̵�
-- ** ����� orders���̺��� takein�� "N"�� �ֹ� ���� �� �Ϻθ� �����ϴ� ������ ��
--    ("N"�� ���� (ordersid 3, 4, 8, 9, 11, 12, 14, 15, 18, 19) �߿��� 
--     �Ϻθ� ��� �ֹ� ���� ������ ������)
insert into delivery values (1, '�Ϸ�', 3, 2000);
insert into delivery values (2, '�Ϸ�', 8, 2000);
insert into delivery values (3, '�Ϸ�', 12, 1500);
insert into delivery values (4, '�Ϸ�', 15, 2000);
insert into delivery values (5, '�Ϸ�', 18, 2000);
insert into delivery values (6, '������', 19, 2000);


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


