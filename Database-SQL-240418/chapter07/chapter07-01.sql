-- D:\dev\database\workspace\chapter07\chapter07-01.sql

-- ! commit���� rollback��

select * from customer;

-- �� ���̺��� 5�� ���� ����
delete from customer where custid = 5;
select * from customer;

-- �Ͻ������� �ݿ��� ������ ���� -> rollback ��ɾ� ���
rollback;
select * from customer;

-- �ٽ� �� ���̺��� 5�� ���� ������
delete from customer where custid = 5;

-- commit ��ɾ�� �����ͺ��̽��� ���� �۾��� �ݿ���Ű��
commit;

-- �ٽ� rollback ��ɾ� ���
rollback;
select * from customer;
-- >> ������ 5���� �������� ����

-- ? commit
-- : ���� commit�������� ����Ǿ��� sql���� ������ �����ϴ� ��ɾ�
-- - rollback ������ commit ��ɾ� ������ �ǵ����� ��ɾ�

insert into customer values(5, '�ڼ���', '���ѹα� ����', null);














