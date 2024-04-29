-- D:\dev\database\workspace\chapter07\chapter07-02.sql

-- 보안과 권한

-- 데이터베이스 - 로그인 사용자별로 관리됨
-- 데이터베이스에 접근하는 각 사용자는 사용자 ID를 가지고 있으며 비밀번호로 접근 허용됨

-- ? 권한 권리
-- 모든 각각의 테이블, 각각의 sql문도 사용자 별로 접근하여 적용할 수 있는 권한이 따로 관리됨

-- ? 테이블스페이스와 로그인 사용자 관리
-- 오라클의 데이터 파일은 논리적인 개념인 테이블스페이스(tablespace)단위로 사용됨

-- 오라클에서 테이블스페이스를 만들고 신규 사용자를 생성하여 할당하는 과정 살펴보기

-- 오라클에서 제공하는 USER는 system, sys가 있음
-- ? CDB, PDB
-- CDB
-- - 기본적으로 db가 생성되면 default로 존재하는 cdb 전체 데이터
-- e.g., 아파트
-- PDB
-- - 사용자 스키마, 데이터, 코드와 기타 데이터베이스 관련 오브젝트를 담고 있는 유저가 만든 개체
-- - 하나의 CDB는 복수 개의 PDB를 가질 수 있음
-- e.g., 아파트 안의 각 입주자들을 뜻함
-- CDB User는 앞에 C##을 붙여야 함

-- xe버전의 경우, xepdb1이라는 이름으로 PDB가 생성되어 있음

-- 테이블스페이스 생성하기
-- 테이블스페이스
-- : 오라클에서 데이터를 저장할 때 사용하는 논리적인 저장공간
-- 테이블스페이스 2가지 유형
-- - 자동으로 만들어지는 시스템 테이블스페이스
-- - 사용자가 필요에 따라 만들어 사용하는 사용자 테이블스페이스
-- e.g., 데이터를 백업하기 위해서 등

-- 사용자 테이블스페이스 생성
-- - DBA(최고 관리자)권한이 부여된 system계정으로만 생성 가능
-- * create tablespace 문법
/*
    create tablespace 테이블스페이스명
        datafile '저장될 경로 및 사용할 파일명'
        size 저장공간
*/
-- 10m의 용량을 가진 테이블스페이스를 mb_tbs, mb_test를
-- D:\dev\database\workspace\chapter07 폴더에 생성하시오.
-- 이때 데이터 파일 이름은 각각 md_tbs_data01.dbf, md_test_data01.dbf
-- (폴더 위치는 폴더가 없으면 미리 생성해야 함)
create tablespace md_tbs
    datafile 'D:\dev\database\workspace\chapter07\md_tbs_data01.dbf'
    size 10M;
create tablespace md_test
    datafile 'D:\dev\database\workspace\chapter07\md_test_data01.dbf'
    size 10M;

-- drop tablespace
-- : 테이블스페이스 삭제 시 사용하는 명령어
-- drop tablespace 문법
/*
    drop tablespace 테이블스페이스명
        [including contents [and datafiles][cascade constaints]];
*/
-- including contents
-- : 테이블스페이스의 모든 데이터를 삭제함
-- and datafiles
-- : os상의 물리적인 데이터 파일 삭제
-- (이 옵션이 없다면 실제 데이터 파일은 삭제되지 않음)
-- cascade constraints
-- : 다른 테이블스페이스의 테이블로부터 참조되는 제약조건들까지 모두 삭제함

-- md_test 테이블스페이스를 데이터 파일까지 포함하여 모두 삭제하시오.
drop tablespace md_test including contents and datafiles;

-- 신규 사용자 계정 생성하기
-- create user
-- : 사용자 계정을 생성하는 명령어
/*
    create user [사용자이름]
        identified by [비밀번호]
        default tablespace [테이블스페이스];
*/
-- default tablespace를 지정하지 않으면 오라클에서 기본으로 users테이블스페이스 할당함

-- alter user
-- : 비밀번호와 같은 사용자 계정의 설정을 변경하는 명령어
-- ansqjq
/*
    alter user [사용자이름]
        identified by [비밀번호];
*/

-- drop user
-- : 사용자 계정을 삭제하는 명령어
-- - cascade를 사용하면 삭제 시점에 사용자가 보유한 모든 데이터를 같이 삭제함
-- 문법
/*
    drop user [사용자이름] cascade;
*/

-- 새로운 사용자 mdguest를 생성하시오. 
-- 비밀번호는 mdguest, 테이블스페이스는 기본값인 users로 설정한다.
create user mdguest
    identified by mdguest;

-- 새로운 사용자 mdguest2를 생성하시오. 비밀번호는 mdguest2,
-- 테스트스페이스는 앞에서 생성한 md_tbs로 설정한다.
create user mdguest2
    identified by mdguest2
    default tablespace md_tbs;















