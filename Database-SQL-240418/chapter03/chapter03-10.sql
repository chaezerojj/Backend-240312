-- D:\dev\database\workspace\chapter03\chapter03-10.sql

-- ������ ���Ǿ�(DDL, Data Definition Language)
-- ������ ���Ǿ�� ���̺��� ������ ����� create��
-- ������ �����ϴ� alter��, ������ �����ϴ� drop���� ����

-- create��
-- create���� ����
-- : create table ���̺� �̸�
-- ({�Ӽ��̸� ������Ÿ�� 
--   [null | not null | unique | default �⺻�� | check üũ����]
--  }
--  [primary key �Ӽ��̸�(��)]
--  [foreign key �Ӽ��̸� references ���̺��̸�(�Ӽ��̸�)]
--    [on delete{cascade|set null}]
-- )

-- ���̺� ����
-- ������ ���� �Ӽ��� ���� NewBook���̺��� �����Ͻÿ�.
-- �������� number�� ����ϸ� �������� ������ ����Ÿ���� varchar2�� �����
-- bookid(������ȣ)-number
-- bookname(�����̸�)-varchar2(20)
-- publisher(���ǻ�)-varchar2(20)
-- price(����)-number

-- ������ ������ Ÿ�� - char, varchar, varchar2
-- char(n) - n����Ʈ�� ���� ������ Ÿ��
-- : ����Ǵ� ������ ���̰� n���� ������ �������� �������� ä�� n����Ʈ�� ����� ����
-- ��) char(20)
-- varchar(n) 
-- : n����Ʈ�� ���� ������ Ÿ�������� ����Ǵ� ������ ���̸�ŭ�� �����Ҹ� �����ϴ� ������
-- ��) varchar(20)
-- varchar2(n)
-- : varchar(n)Ÿ�԰� ������ ����Ŭ���� ��� ��õ

-- �⺻Ű�� ����
create table newbook(
    bookid number,
    bookname varchar(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);

drop table newbook; -- drop: ���̺� ����

-- �⺻Ű ���� 2��° ���
create table newbook(
    bookid number primary key,
    bookname varchar(20),
    publisher varchar2(20),
    price number
);
drop table newbook;
-- 2���� �Ӽ��� �⺻Ű�� ����
create table newbook(
    bookid number,
    bookname varchar(20),
    publisher varchar2(20),
    price number,
    primary key (bookname, publisher)
);
drop table newbook;
-- ������� �߰�
-- bookname�� null���� ���� �� ����, publisher�� ���� ���� ������ �ȵ�
-- price�� ���� �Էµ��� ���� ��� �⺻�� 10000�� ������
-- ��, ������ �ּ� 1000�� �̻����� ��
create table newbook(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price >= 1000),
    primary key (bookname, publisher));
    
-- ������ ���� �Ӽ��� ���� NewCustomer���̺��� �����Ͻÿ�.
-- custid(����ȣ)-number, �⺻Ű
-- name(�̸�) - varchar2(40)
-- address(�ּ�) - varchar2(40)
-- phone(��ȭ��ȣ) - varchar2(30)

create table newcustomer (
    custid number primary key,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30)
);

-- ������ ���� �Ӽ��� ���� neworders ���̺��� �����Ͻÿ�.
-- orderid(�ֹ���ȣ) - number, �⺻Ű
-- custid(����ȣ) - number, not null ��������
-- bookid(������ȣ) - number, not null ��������
-- saleprice(�ǸŰ���) - number
-- orderdate(�Ǹ�����) - date

create table neworders (
    orderid number,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    primary key(orderid)
);

-- custid(����ȣ)- number, not null ��������, 
--                  �ܷ�Ű(newcustomer.custid, �������)
drop table neworders;
create table neworders (
    orderid number,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    primary key(orderid),
    foreign key(custid) references newcustomer(custid) 
    on delete cascade
);
-- �ܷ�Ű ���������� ����� �� ������ ��
-- �ݵ�� �����Ǵ� ���̺�(�θ����̺�)�� �����ؾ� �ϸ�,
-- �����Ǵ� ���̺��� �⺻Ű���� ��

-- �ܷ�Ű ���� �� on delete�ɼ�
-- cascade - �������
-- set null - null ������ �ٲ�
-- no action - �⺻������ ��� ���۵� ������ ����

-- �Ӽ� ������ Ÿ�� ����
-- number(p, s) / �Ǽ��� p�ڸ� ���� �κ�, s�ڸ��� �Ҽ� �κ�
-- p�� s�� �����Ͽ� number��� ���� number(8, 2)�� �����
-- (>> �����κ��� 8�ڸ�, �Ҽ��κ��� 2�ڸ����� ���尡��)
-- char(n) / ������ ��������, ���ڸ� �����ϰ� ���� ������ �������� ä��
-- varchar2(n) / ������ ��������, �ִ� 4000����Ʈ���� �����
-- date / ��¥��, ����, ��, ��, �ð��� ������





    
    

    
    
    
    
    
    
    
    
    