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















