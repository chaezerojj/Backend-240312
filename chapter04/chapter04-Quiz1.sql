-- 01. ���� �����Լ��� ����� �����ÿ�.
select abs(-15) from dual; -- 15
select ceil (15.7) from dual; -- 16
select cos(3.14159) from dual; -- -0.99999999999647923060461239250850048324
select floor(15.7) from dual; -- 15
select log(10, 100) from dual; -- 2
select mod(11, 4) from dual; -- 3
select power(3, 2) from dual; -- 9
select round(15.7) from dual; -- 16
select sign(-15) from dual; -- -1
select trunc(15.7) from dual; -- 15
select chr(67) from dual; -- C
select concat('HAPPY', 'Birthday') from dual; -- HAPPYBirthday
select lower('Birthday') from dual; -- birthday
select lpad('Page 1', 15, '*.') from dual; -- *.*.*.*.*Page 1
select ltrim('Page 1', 'ae') from dual; -- Page 1
select replace ('JACK', 'J', 'BL') from dual; -- BLACK
select rpad('Page 1', 15, '*.') from dual; -- Page 1*.*.*.*.*
select rtrim('Page 1', 'ae') from dual; -- Page 1
select substr('ABCDEFG', 3, 4) from dual; -- CDEF
select trim(leading 0 from '00AA00') from dual; -- AA00
select upper('Birthday') from dual; -- BIRTHDAY
select ascii('A') from dual; -- 65
select instr('CORPORATE FLOOR', 'OR', 3, 2) from dual; -- 14
select length('Birthday') from dual; -- 8
select add_months('14/05/01', 1) from dual; -- 14/06/01
select last_day(sysdate) from dual; -- 24/04/30
select next_day(sysdate, 'ȭ') from dual; -- 24/04/30
select round(sysdate) from dual; -- 24/04/26
select sysdate from dual; -- 24/04/25
select to_char(sysdate) from dual; -- 24/04/25
select to_char(123) from dual; -- 123
select to_date('12 05 2020', 'DD MM YYYY') from dual; -- 20/05/12
select to_number('12.3') from dual; -- 12.3
select decode(1, 1, 'aa', 'bb') from dual; -- aa
select nullif(123, 345) from dual; -- 123
select nvl(null, 123) from dual; -- 123

-- 02. ������ ���� Mybook ���̺��� ������ �� null�� ���� sql���� ���ϰ�, 
--     ����� ���鼭 null�� ���� ���䵵 �����غ��ÿ�.
select * from mybook;
select bookid, nvl(price, 0) from mybook;
select * from mybook where price is null;
select * from mybook where price='';
select bookid, price+100 from mybook;
select sum(price), avg(price), count(*) from mybook where bookid >= 4;
select count(*), count(price) from mybook;
select sum(price), avg(price) from mybook;

-- 03. rownum�� ���� ���� sql���� ���Ͻÿ�. �����ʹ� ���缭�� �����ͺ��̽��� �̿��Ѵ�.
select * from book;
select * from book where rownum <= 5;
select * from book where rownum <= 5 order by price;
select * from 
            (select * from book order by price) b 
where rownum <= 5;
select * from
            (select * from book where rownum <= 5) b
order by price;
select * from
            (select * from book where rownum <= 5) b;