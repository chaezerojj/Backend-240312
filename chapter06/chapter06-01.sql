-- D:\dev\database\workspace\chapter06\chapter06-01.sql

-- summer ���̺� �����ϰ� ������ ����

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100, 'fortran', 20000);
insert into summer values(150, 'pascal', 15000);
insert into summer values(200, 'c', 10000);
insert into summer values(250, 'fortran', 20000);

select * from summer;

-- select ���� �̿��� ��ȸ �۾�
-- �л��� �й� sid, �����ϴ� ������ class, ���� ������ ������� price
-- �����б⸦ ��� �л��� �й��� �����ϴ� ������?
select sid, class from summer;
-- �����ᰡ ���� ��� ������?
select distinct class from summer
where price = (select max(price) from summer);

-- ! ���� �̻�
-- ���� 200�� �л��� �����б� ������û�� ����Ͻÿ�.
delete summer where sid = 200;
select * from summer;

-- c���� �����Ḧ ��ȸ
select price "c ������" from summer
where class = "C"; -- error: ��ȸ �Ұ�

-- 200�� �л��� ������û�� ����Ͽ� ���� ������ ��������
-- 200�� �л��� ������û�� �� ��ҵǾ���
-- >> c������ ������ ��ȸ �Ұ�
--    �л��� ������û�� ����ϸ鼭 �����ᵵ �Բ� �����Ͽ��� ����
--    ���� �̻� �߻�

-- ���� �ǽ��� ���� 200�� �л��� �ڷ� �ٽ� �Է�
insert into summer values(200, 'C', 10000);

-- ! �����̻�
-- �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
-- �ڹ� ���� ����
insert into summer values (null, 'java', 25000);
-- ��ü ������ ��ȸ
select * from summer;
-- ������ �л��� �� ���� ���Ͻÿ�.
select count(*) from summer; -- 5
-- ������ �л��� �� ���� 4���ε� 5���̶�� ����� ����
-- ���̺��� �����Ͱ� ���� �� ��ü �����͸� �����ϰ� �ľ��Ͽ� sql���� ������ �ϴ� ����
select count(sid) from summer;
-- >> ���� �̻�
-- �ڹ� ���°� ���� ������
-- ������� 25000���̰� ���� ��û�� �л� X
-- �ڹ� ���� �߰��� ���� insert�� ���
-- ��û�� �л��� ���� �й����� null���� �ԷµǾ���
-- null���� ���� �Լ� ��� �� ������ ���� ����� ����

-- fortran ������ �����Ḧ 20000������ 15000������ �����Ͻÿ�.
update summer set price = 15000 where class = "fortran" and sid = 100;

-- fortran �����Ḧ ��ȸ
select price from summer where class = 'fortran';
-- >> 2���� ��ȸ�Ǿ� ������ ����ġ ���� �߻�(���� �̻�)

-- ���� �̻�
-- fortran ������ �����ᰡ 20000������ 15000������ ����Ǿ� 
-- update���� �̿��Ͽ� ����.
-- update���� ���ǿ� �´� ���� �ϰ� ����������, ������ �߸� �ָ� ������ ����ġ ���� �߻�

-- ������ �����б� ���� ���̺�
-- ���̺� ������ �����Ͽ� �̻������� �߻����� �ʵ��� �����
-- summer ���̺��� summer_price�� summer_enroll ���̺�� �и���
-- summer_price���̺��� ���� ���� ������ ������ ������
-- summer_enroll���̺��� �л����� ������û ������ ����
create table summerprice (
    class varchar(20),
    price INTEGER
);
insert into summerprice values ('fortran', 20000);
insert into summerprice values ('pascal', 15000);
insert into summerprice values ('C', 10000);

select * from summerprice;

-- (���ο� �ܾ ���յ� �� �Ϲ������� ���̺��̳� �Ӽ��̸��� _�� ������)
-- e.g., summer_price, summer_enroll

-- summerenroll���̺� ����
create table summerenroll(
    sid integer,
    class varchar(20)
);
insert into summerenroll values (100, 'fortran');
insert into summerenroll values (150, 'pascal');
insert into summerenroll values (100, 'c');
insert into summerenroll values (250, 'fortran');
select * from summerenroll;

-- 200�� �л��� �����б� ������û�� ����Ͻÿ�.
-- C ���� ������ ��ȸ
select price from summerprice where class = 'C';
-- �������
delete from summerenroll where sid = 200;
select * from summerenroll;
-- C���� ������ ��ȸ
select price from summerprice where class = 'C' or class = 'c';
-- ���� �̻� ����
-- 200�� �л� ������û ��� ó�� �Ϸ�, ���� ���� ���� X, C ���� ������ ��ȸ ����

-- �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
insert into summerprice values ('java', 25000);
select * from summerprice;
-- >> ���� �̻� ����
-- ���� �ڹ� ���¸� ��û�� �л��� ������, null���� �Է��� �ʿ� ���� �����̻� �߻� X

-- fortran������ �����Ḧ 20000������ 15000������ �����Ͻÿ�.
update summerprice set price=15000 where class = 'fortran';
select price from summerprice where class = 'fortran';
-- �����̻� ����
-- fortran���� ������� �ϳ��� ����Ǿ� �ֱ⿡ ���� �� �������� ����ġ�� ����� �ʿ� X

-- ���̺� �и��� ���� �̻����� �ذ� ����












