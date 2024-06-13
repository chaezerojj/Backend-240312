-- D:\dev\database\workspace\chapter07\chapter07-02.sql

-- ���Ȱ� ����

-- �����ͺ��̽� - �α��� ����ں��� ������
-- �����ͺ��̽��� �����ϴ� �� ����ڴ� ����� ID�� ������ ������ ��й�ȣ�� ���� ����

-- ? ���� �Ǹ�
-- ��� ������ ���̺�, ������ sql���� ����� ���� �����Ͽ� ������ �� �ִ� ������ ���� ������

-- ? ���̺����̽��� �α��� ����� ����
-- ����Ŭ�� ������ ������ ������ ������ ���̺����̽�(tablespace)������ ����

-- ����Ŭ���� ���̺����̽��� ����� �ű� ����ڸ� �����Ͽ� �Ҵ��ϴ� ���� ���캸��

-- ����Ŭ���� �����ϴ� USER�� system, sys�� ����
-- ? CDB, PDB
-- CDB
-- - �⺻������ db�� �����Ǹ� default�� �����ϴ� cdb ��ü ������
-- e.g., ����Ʈ
-- PDB
-- - ����� ��Ű��, ������, �ڵ�� ��Ÿ �����ͺ��̽� ���� ������Ʈ�� ��� �ִ� ������ ���� ��ü
-- - �ϳ��� CDB�� ���� ���� PDB�� ���� �� ����
-- e.g., ����Ʈ ���� �� �����ڵ��� ����
-- CDB User�� �տ� C##�� �ٿ��� ��

-- xe������ ���, xepdb1�̶�� �̸����� PDB�� �����Ǿ� ����

-- ���̺����̽� �����ϱ�
-- ���̺����̽�
-- : ����Ŭ���� �����͸� ������ �� ����ϴ� ������ �������
-- ���̺����̽� 2���� ����
-- - �ڵ����� ��������� �ý��� ���̺����̽�
-- - ����ڰ� �ʿ信 ���� ����� ����ϴ� ����� ���̺����̽�
-- e.g., �����͸� ����ϱ� ���ؼ� ��

-- ����� ���̺����̽� ����
-- - DBA(�ְ� ������)������ �ο��� system�������θ� ���� ����
-- * create tablespace ����
/*
    create tablespace ���̺����̽���
        datafile '����� ��� �� ����� ���ϸ�'
        size �������
*/
-- 10m�� �뷮�� ���� ���̺����̽��� mb_tbs, mb_test��
-- D:\dev\database\workspace\chapter07 ������ �����Ͻÿ�.
-- �̶� ������ ���� �̸��� ���� md_tbs_data01.dbf, md_test_data01.dbf
-- (���� ��ġ�� ������ ������ �̸� �����ؾ� ��)
create tablespace md_tbs
    datafile 'D:\dev\database\workspace\chapter07\md_tbs_data01.dbf'
    size 10M;
create tablespace md_test
    datafile 'D:\dev\database\workspace\chapter07\md_test_data01.dbf'
    size 10M;

-- drop tablespace
-- : ���̺����̽� ���� �� ����ϴ� ��ɾ�
-- drop tablespace ����
/*
    drop tablespace ���̺����̽���
        [including contents [and datafiles][cascade constaints]];
*/
-- including contents
-- : ���̺����̽��� ��� �����͸� ������
-- and datafiles
-- : os���� �������� ������ ���� ����
-- (�� �ɼ��� ���ٸ� ���� ������ ������ �������� ����)
-- cascade constraints
-- : �ٸ� ���̺����̽��� ���̺�κ��� �����Ǵ� �������ǵ���� ��� ������

-- md_test ���̺����̽��� ������ ���ϱ��� �����Ͽ� ��� �����Ͻÿ�.
drop tablespace md_test including contents and datafiles;

-- �ű� ����� ���� �����ϱ�
-- create user
-- : ����� ������ �����ϴ� ��ɾ�
/*
    create user [������̸�]
        identified by [��й�ȣ]
        default tablespace [���̺����̽�];
*/
-- default tablespace�� �������� ������ ����Ŭ���� �⺻���� users���̺����̽� �Ҵ���

-- alter user
-- : ��й�ȣ�� ���� ����� ������ ������ �����ϴ� ��ɾ�
-- ansqjq
/*
    alter user [������̸�]
        identified by [��й�ȣ];
*/

-- drop user
-- : ����� ������ �����ϴ� ��ɾ�
-- - cascade�� ����ϸ� ���� ������ ����ڰ� ������ ��� �����͸� ���� ������
-- ����
/*
    drop user [������̸�] cascade;
*/

-- ���ο� ����� mdguest�� �����Ͻÿ�. 
-- ��й�ȣ�� mdguest, ���̺����̽��� �⺻���� users�� �����Ѵ�.
create user mdguest
    identified by mdguest;

-- ���ο� ����� mdguest2�� �����Ͻÿ�. ��й�ȣ�� mdguest2,
-- �׽�Ʈ�����̽��� �տ��� ������ md_tbs�� �����Ѵ�.
create user mdguest2
    identified by mdguest2
    default tablespace md_tbs;
    
-- ���� ����
-- mdguest, mdguest2 ����ڿ��� 
-- �����ͺ��̽� ����(connect) �� ���̺� ����(resource) ����, ���̺����̽���
-- ���������� ����� �� �ִ� ����(unlimited tablespace)�� �ο��Ͻÿ�.
grant connect, resource, unlimited tablespace to mdguest;
grant connect, resource, unlimited tablespace to mdguest2;

-- ���� �㰡 - grant
-- : ��ü�� ������ �����ڰ� ��� ��ü�� ���� ������ �ٸ� ����ڿ��� �㰡�ϴ� ���
-- ����
/*
    grant ����[(�÷�[,...])][,...n]
        [on��ü]to{�����|��|public[,...n]}
        [with grant option]
*/
-- [,...n]�� �ݺ� ������ �ǹ�
-- ����: �㰡�� ������ ������
-- alter, delete, execute, index, insert, references, select, update
-- �÷�: ��� ������ �ο��� ���̺��� �� �̸��� ����
-- ��ü: ��� ������ �ο��� ��ü�� ����. ���̺��̳� �� ���� ����
-- to �����: ����ڳ� ������ ������ ��(role)�� ������ �߰� ����
-- public�� ��� ����ڰ� ����� �� �ֵ��� ���������� ������ �ο��Ѵٴ� �ǹ�
-- with grant option: �㰡���� ������ �ٸ� ����ڿ��� �ٽ� �ο� ����

-- madang/madang ������ ����
CREATE USER madang IDENTIFIED BY madang;
-- madang ����ڿ��� ���� �ο�
-- pdb1_system ��������
grant connect, resource, unlimited tablespace to madang;


CREATE TABLE Book (
bookid NUMBER(2) PRIMARY KEY,
bookname VARCHAR2(40),
publisher VARCHAR2(40),
price NUMBER(8)
);

INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO Book VALUES(6, '���� �ܰ躰���', '�½�����', 6000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

select * from book;

CREATE TABLE Customer (
custid NUMBER(2) PRIMARY KEY,
name VARCHAR2(40),
address VARCHAR2(50),
phone VARCHAR2(20)
);
INSERT INTO Customer VALUES (1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����', NULL);
CREATE TABLE Orders (
orderid NUMBER(2) PRIMARY KEY,
custid NUMBER(2) REFERENCES Customer(custid),
bookid NUMBER(2) REFERENCES Book(bookid),
saleprice NUMBER(8),
orderdate DATE
);
INSERT INTO Orders VALUES (1, 1, 1, 6000, TO_DATE('2020-07-01','yyyy-mm-dd'));
INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2020-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2020-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2020-07-04','yyyy-mm-dd'));
INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2020-07-05','yyyy-mm-dd'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2020-07-08','yyyy-mm-dd'));
INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2020-07-09','yyyy-mm-dd'));
INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2020-07-10','yyyy-mm-dd'));

commit;

-- pdb1_madang �������� ����
-- mdguest���� book���̺��� select ������ �ο��Ͻÿ�.
grant select on book to mdguest;

-- mdguest���� customer���̺��� select, update������ 
-- with grant option�� �Բ� �ο��Ͻÿ�.
grant select, update on customer to mdguest with grant option;

-- public�� ��� ����ڿ��� ������ �ο��ϴ� ���
-- orders ���̺��� ��� ����ڰ� select �� �� �ֵ��� ������ �ο��Ͻÿ�.
grant select on orders to public;

-- ���� ��� - revoke
-- grant������ �㰡�� ������ ���, ȸ���ϴ� ��ɾ�
-- ����
/*
    revoke ���� [(�÷�[,...n])[,...n]]
        [on ��ü]from {�����|��|public[,...n]}
*/
-- mdguest���� �ο��� book���̺��� select������ ����Ͻÿ�.
revoke select on book from mdguest;









