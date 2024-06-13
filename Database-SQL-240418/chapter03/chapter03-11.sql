-- D:\dev\database\workspace\chapter03\chapter03-11.sql

-- alter��
-- alter���� ������ ���̺��� �Ӽ��� �Ӽ��� ���� ������ �����ϸ�
-- �⺻Ű �� �ܷ�Ű�� ������
-- alter���� ����
-- : alter table ���̺��̸�
--    [add �Ӽ��̸� ������Ÿ��]
--    [drop column �Ӽ��̸�]
--    [alter column �Ӽ��̸� ������Ÿ��]
--    [alter column �Ӽ��̸� [null | not null]
--    [add primary key(�Ӽ��̸�)]
--    [[add | drop] �����̸�]
-- modify�� �Ӽ��� ������ �� �����

-- �ǽ��� newbook���̺� ����
drop table newbook;
create table newbook (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- newbook���̺��� varchar2(13)�� �ڷ����� ���� isbn�Ӽ��� �߰��Ͻÿ�.
alter table newbook add isbn varchar2(13);

-- newbook ���̺��� isbn �Ӽ��� ������Ÿ���� number������ �����Ͻÿ�.
alter table newbook modify isbn number;

-- newbook���̺��� isbn�Ӽ��� �����Ͻÿ�.
alter table newbook drop column isbn;

-- newbook���̺��� bookname�Ӽ��� not null ���������� �����Ͻÿ�.
alter table newbook modify bookname varchar(20) not null;

-- newbook���̺��� bookid�Ӽ��� �⺻Ű�� �����Ͻÿ�.
alter table newbook add primary key(bookid);

-- drop��
-- ���̺��� �����ϴ� ����
-- drop���� ���̺��� ������ �����͸� ��� �����ϹǷ� ��뿡 �����ؾ� ��
-- �����͸� �����Ϸ��� delete���� ���
-- drop���� ����
-- : drop table ���̺��̸�

-- newbook ���̺��� �����Ͻÿ�.
drop table newbook;

-- newcustomer ���̺��� �����Ͻÿ�.
--drop table newcustomer;
-- >> neworders ���̺��� newcustomer�� �����ϰ� �ִ� ���·�
--    neworders ���̺����� �����ؾ� ��
drop table neworders;
drop table newcustomer;




