-- yamyambunsik

-- 0. ����� ���� 
create user c##bunsik identified by bunsik;

-- 1. ������ ����ڿ��� ���� ���� �ο�
grant connect, resource, dba to c##bunsik;

-- 2. ������� �����ϱ�
commit;

-- 3. ���̺� ���� �� �ܷ�Ű ����

-- customer(��) ���̺� ����
CREATE TABLE customer (
    custid    NUMBER NOT NULL, -- �����̵�(�⺻Ű)
    custname  VARCHAR2(20), -- ���̸�
    custaddr  VARCHAR2(100), -- �� �ּ�
    custphone VARCHAR2(20) -- �� ��ȭ��ȣ
);
-- custid�� �⺻Ű�� ����
ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( custid );

-- delivery(���) ���̺� ����
CREATE TABLE delivery (
    status          VARCHAR2(10), -- ��޻���
    ordersid        NUMBER NOT NULL, -- �⺻Ű
    deliveryprice   NUMBER -- ��ް���
);
ALTER TABLE delivery ADD CONSTRAINT delivery_pk PRIMARY KEY ( ordersid );

-- menu(�޴�) ���̺� ����
CREATE TABLE menu 
    menuid    NUMBER NOT NULL, -- �޴� ���̵�(�⺻Ű)
    menutype  VARCHAR2(20), -- �޴����� 
    menuname  VARCHAR2(20), -- �̸�
    menuprice NUMBER -- ����
);
-- menuid�� �⺻Ű�� ����
ALTER TABLE menu ADD CONSTRAINT menu_pk PRIMARY KEY ( menuid );

-- orders(�ֹ�) ���̺� ����
CREATE TABLE orders (
    ordersid    NUMBER NOT NULL, -- �⺻Ű
    takein      VARCHAR2(10), -- ���� �Ļ� ���� (Y/N)�� ǥ��
    menuid      NUMBER NOT NULL, -- �ܷ�Ű: menuid
    orderdate   DATE, -- �ֹ���¥
    custid      NUMBER NOT NULL -- �ܷ�Ű: custid
);
-- ordersid, custid�� �⺻Ű�� ����
ALTER TABLE orders ADD CONSTRAINT order_pk PRIMARY KEY ( ordersid, custid );

-- delivery ���̺��� orders���̺��� ordersid�� �ܷ�Ű�� �޾ƿ�
ALTER TABLE delivery
    ADD CONSTRAINT delivery_orders_fk FOREIGN KEY ( ordersid )
        REFERENCES orders ( ordersid );
-- orders ���̺��� customer���̺��� custid�� �ܷ�Ű�� �޾ƿ�
ALTER TABLE orders
    ADD CONSTRAINT orders_customer_fk FOREIGN KEY ( custid )
        REFERENCES customer ( custid );
-- orders ���̺��� menu���̺��� menuid�� �ܷ�Ű�� �޾ƿ�
ALTER TABLE orders
    ADD CONSTRAINT orders_menu_fk FOREIGN KEY ( menuid )
        REFERENCES menu ( menuid );

-- 4. ���̺� �� ������ �Է�
-- (1) menu ���̺�
insert into menu values (1, '�нķ�', '������', 5000);
insert into menu values (2, '�нķ�', '����������', 6500);
insert into menu values (3, '�нķ�', '�縮�߰�', 1000);
insert into menu values (4, '�нķ�', 'ġ���߰�', 1000);

insert into menu values (, '���', '�⺻���', 3000);
insert into menu values (1, '���', 'ġ����', 3500);
insert into menu values (1, '���', '���Ը��� �Ź�', 4000);
insert into menu values (1, '���', '��ġ���� �Ź�', 4000);

insert into menu values (1, 'Ƣ���', '����(3��)', 3000);
insert into menu values (1, 'Ƣ���', 'ġ�ƽ(3��)', 3000);
insert into menu values (1, 'Ƣ���', '��¡��Ƣ��(2��)', 3000);
insert into menu values (1, 'Ƣ���', '�踻��(3��)', 2500);
insert into menu values (1, 'Ƣ���', 'ġ�(3��)', 2500);

insert into menu values (1, '��Ÿ��', '����(1�κ�)', 6000);
insert into menu values (1, '��Ÿ��', '���', 5000);
insert into menu values (1, '��Ÿ��', '���ġ(3��)', 2500);

insert into menu values (1, '��Ʈ��', '������+���Ƣ��(Ƣ������ 1����)', 9500);
insert into menu values (1, '��Ʈ��', '������+�⺻���', 7500);
insert into menu values (1, '��Ʈ��', '������+ġ����', 8000);
insert into menu values (1, '��Ʈ��', '������+�Ź�', 8500);
insert into menu values (1, '��Ʈ��', '������+���ġ', 7000);
insert into menu values (1, '��Ʈ��', '������+����', 10500);
insert into menu values (1, '��Ʈ��', '�����̿� ġ���߰�', 1000);
insert into menu values (1, '��Ʈ��', '�����̿� �縮�߰�', 1000);
insert into menu values (1, '��Ʈ��', '���������̷� ����', 1500);
insert into menu values (1, '��Ʈ��', '���+�⺻���', 7500);
insert into menu values (1, '��Ʈ��', '���+ġ����', 8000);

insert into menu values (1, '�����', '�ݶ�', 2000);
insert into menu values (1, '�����', '�����ݶ�', 2000);
insert into menu values (1, '�����', '���̴�', 2000);
insert into menu values (1, '�����', '���λ��̴�', 2000);
insert into menu values (1, '�����', 'ȯŸ', 2000);

-- (2) orders ���̺�
insert into orders (ordersid, takein) values ();



/*
<< �޴� ���� >>
* �нķ� >> ������/ ġ����� / ���� 
* ��� >> �⺻ ���, ġ�� ���, ���Ը��� �Ź�, ��ġ���� �Ź�
* Ƣ��� >> ����(4��), ġ�ƽ(3��), ��¡��Ƣ��(2��), ġ�(3��)
* ��Ÿ�� >> ����(1�κ�), ���, ���ġ(3��)
* ��Ʈ
>> ������+���Ƣ��(Ƣ������1����) / ������+��� / ������+ġ���� / ������+���ġ / ������+����

* ����
>> �ݶ�, �����ݶ�, ���̴�, ���λ��̴�, ȯŸ

* �ֹ�
*/










