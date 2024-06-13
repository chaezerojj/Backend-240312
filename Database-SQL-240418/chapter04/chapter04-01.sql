-- D:\dev\database\workspace\chapter04\chapter04-01.sql

-- ��� sql �ۼ�

-- 01. �����Լ�
-- ? sql �����Լ�
-- - select���� where��, update�� ��� ��� ��� ����
-- * �Լ� ����
-- - select �Լ���(����1, ����2, ...) from ���̺� �̸�;
-- - where ���̸�=�Լ���(����1, ����2, ...);
-- - update ���̺��̸�;
-- - set ���̸�=�Լ���(����1, ����2, ...);

-- ? ����Ŭ���� �����ϴ� �����Լ�
-- * ���� �Լ�
-- - sql�������� ������ �⺻���� ��Ģ ������(+, -, *, /)�� ������(%)������ ��ȣ�� �״�� ���
-- - ��Ģ ������ �ܿ��� ���� ������ ����
-- - ��� �󵵰� ���� �����ڵ��� �����Լ� ���·� ������

-- 1. abs �Լ�
-- : ������ ���밪 ���
-- ? -78�� +78�� ������ ���Ͻÿ�.
select abs(-78), abs(+78)
from dual;
-- from������ dual ���̺� -> ������ �����ϴ� ���̺��� �ƴ� 
--                         ����Ŭ���� �Ͻ����� �����۾��� ���� ���� ������ ���̺�

-- 2. round �Լ�
-- : m�ڸ��� �������� ���ڸ� �ݿø�
-- ���� - (����, m)
-- ? 4.87�� ���� ù°�ڸ����� �ݿø��� ���� ���Ͻÿ�.
select round(4.875, 1) from dual;

-- - ���� �Լ��� ����
--   >> ���ڿ� ���� ��� ���̸��� ��� ����, ���� �Լ� ���� ��� ����
-- ? ���� ��� �ֹ� �ݾ��� �� �� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "�� ��ȣ", round(sum(saleprice)/count(*), -2)  "��� �ݾ�"
from orders 
group by custid;

-- * ���� �Լ�
-- : ���� ������ Ÿ���� ������ ����� ��ȯ

-- 1. replace �Լ�
-- replace(s1, s2, s3)
-- - �Լ� ����ڿ�(s1)�� ������ ����(s2)�� ���ϴ� ����(s3)�� ����
-- ? ���� ���� �߱��� ���Ե� ������ '��'�� ������ �� ���� ����� ���̽ÿ�.
select bookid, replace(bookname, '�߱�', '��') bookname, publisher, price
from book;

-- 2. length �Լ�
-- length(s)
-- - ��� ���ڿ��� ���� ���� ��ȯ
-- - length: ������ ��
-- - lengthb: ����Ʈ ������ ��ȯ
-- ? �½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�.
select bookname, length(bookname) "���� ���� ��", lengthb(bookname) "���� ����Ʈ ��" 
from book
where publisher = '�½�����';

-- 3. substr �Լ�
-- substr(s, n, k)
-- - ��� ���ڿ��� ������ �ڸ��������� ������ ���̸�ŭ �߶� ��ȯ
-- ? ���缭���� �� �߿��� ���� ��(last name)�� ���� ����� 
--   ����̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
select * from customer;
insert into customer values (5, '�ڼ���', '���ѹα� ����', null);
-- �ھ� �θ� ��µǴ��� Ȯ��
select substr(name, 1, 1) "��(last name)", count(*)
from customer
group by substr(name, 1, 1);

-- 4. ��¥ �ð� �Լ�
-- * ��¥ �ð� �Լ��� ����
-- (1) to_date(char, datetime)
-- : ������ ������(char)�� date������ ��ȯ
-- char: ���ڳ� ���ڿ��� ��Ÿ��
-- datetime: ��¥�� �ð��� ��Ÿ���� �μ�

-- (2) to_char(date, datetime)
-- : date�� �����͸� ���ڿ�(varchar2)�� ��ȯ

-- (3) add_months(date, ����)
-- : ��¥�� ������ ���� ���� date������ ��ȯ(1: ������, -1: ������)

-- (4) last_day(date)
-- : ��¥�� ���� ������ ���� date������ ��ȯ

-- (5) sysdate
-- : dbms �ý��� ���� ���� ��¥�� date������ ��ȯ�ϴ� ���ڰ� ���� �Լ�

-- ? ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
select orderid, orderdate, orderdate+10 "�ֹ�Ȯ������" 
from orders;
-- ��¥�� �����ʹ� -�� +�� ����Ͽ� ���ϴ� ��¥�κ��� ������ ���ĸ� ��� ����

-- ? dbms ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�.
select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss')
from dual;
-- 'yyyy/mm/dd dy hh24:mi:ss' = '����/��/�� ���� ��:��:��'

select * from orders;
insert into orders values (11, 1, 1, 6000, sysdate);

-- * null �� ó��
-- - null ���� ���� ����� ���� �Լ�
-- - ���� �Լ��� ����� �� null���� ���Ե� �࿡ ���� ���ǻ���
-- - 1. null + ���� ������ ����� null��
-- - 2. ���� �Լ��� ����� �� null�� ���Ե� ���� ���迡�� ����
-- - 3. ���� �Լ��� ����Ǵ� ���� �ϳ��� ������ sum, avg �Լ��� ����� null
--      , count�Լ��� ����� 0��
create table mybook (
    bookid number primary key,
    price number
);

insert into mybook values (1, 10000);
insert into mybook values (2, 20000);
insert into mybook values (3, null);
select * from mybook;

-- 1. null + ���� ������ ����� null��
select price+100 from mybook where bookid = 3;
-- 2. ���� �Լ��� ����� �� null�� ���Ե� ���� ���迡�� ����
select count(*), count(price), sum(price), avg(price) from mybook;
-- 3. ���� �Լ��� ����Ǵ� ���� �ϳ��� ������ sum, avg �Լ��� ����� null, count�Լ��� ����� 0��
select sum(price), avg(price), count(*)
from mybook where bookid>=4;

-- null �� Ȯ���ϴ� ���
-- - is null, is not null
-- mybook���̺��� price�� null�� �� ã��
select * from mybook where price is null;
-- mybook���̺��� price�� null�� �ƴ� �� ã��
select * from mybook where price is not null;

-- nvl �Լ�
-- nvl(�Ӽ�, ��)
-- : null���� �ٸ� ������ ��ġ�Ͽ� �����ϰų� �ٸ� ������ ���
-- - null���� ������ �ٸ� ������ ���� ����
-- - �Ӽ��� null���̸� ������ ��ġ��
-- ? �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̽ÿ�.
--   ��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ���Ͻÿ�.
select * from customer;
select name, nvl(phone, '����ó����') "PHONE" from customer;

-- rownum ����
-- : ����Ŭ ���������� �����Ǵ� ���� �÷����� sql ��ȸ����� ������ ��Ÿ��
-- ? ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.
select rownum, custid, name, phone 
from customer
where rownum <= 2;

-- rownum ���� ���ǻ���
-- �����ټ����� ������ ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.
select rownum, custid, name, phone
from customer
where rownum <= 2
order by name;
-- ����Ŭ�� select�� ó������
-- 1. from customer : customer���̺��� ����
-- 2. where rownum <= 2 : ����Ŭ�� �����͸� ���� ������� 2�� ������ ����
-- 3. select rownum, custid, name, phone : �Ӽ��� ����
-- 4. order by name : �̸������� ����

-- �μ����Ǹ� ���
select rownum ����, custid, name, phone
from (select custid, name, phone
        from customer order by name)
where rownum <= 2;

























