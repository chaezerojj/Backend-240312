-- D:\dev\database\workspace\chapter03\chapter03-02.sql

-- ������ ���۾� - �˻�
-- - select�� �������� �˻�
-- sql�� select���� �����͸� �˻��ϴ� �⺻ ��������
-- Ư���� ���Ǿ�(Query)��� �θ�
-- select���� �˻��� ����� ���̺� ���·� �����
-- e.g., 10000�� �̻��� ������ �̸��� ���ǻ縦 ���̽ÿ�.
select bookname, publisher from book where price >= 10000;
select bookname, publisher 
from book 
where price >= 10000; -- �Ķ� Ű���带 �������� �ٹٲ��Ͽ� �ۼ�

-- select���� �⺻ ����
-- select[all|distinct] �Ӽ��̸�
-- from ���̺��̸�
-- [where �˻�����]
-- [group by �Ӽ��̸�]
-- [having �˻�����]
-- [order by �Ӽ��̸� [asc|desc]] -- asc:�������� / desc:��������
-- ���ȣ[]���� sql�������� ���������� ���
-- |: ���� ������ ������ �� �Ѱ��� ����� �� ����


