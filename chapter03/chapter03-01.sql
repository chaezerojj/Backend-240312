-- �ּ�
-- SQL �Ұ�
-- D:\dev\database\workspace\chapter03\chapter03-01.sql
-- SQL: DBMS�� ���ϴ� ������ ���� ���� �˷��ְ� ����� ��µ� ����ϴ� 
--      �����ͺ��̽� ���� ���

-- �౸�� ������ ������ ���ǻ�� ������ �˰� �ʹ�
select bookname, publisher, price
from book
where bookname like '�౸�� ����'; -- �����ݷ�(;): ���� ������

-- SQL : Structured Query Language
-- SQL�� ��ɿ� ���� ������ ���Ǿ�, ������ �����, ������ ������ ����

-- * ������ ���Ǿ�(DDL)
-- : ���̺��̳� ������ ������ �����ϴµ� ���
-- - create, alter, drop�� ���� ����

-- * ������ ���۾�(DML)
-- : ���̺� �����͸� �˻�, ����, ����, �����ϴµ� ���
-- - select, insert, delete, update�� ���� ����
-- - select���� Ư���� ���Ǿ�(query)��� �θ�

-- * ������ �����(DCL)
-- : �������� ��� ������ �����ϴµ� ���
-- - grant, revoke�� ���� ����
