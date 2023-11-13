/* DDL(Data Definition Language) */

/* create */
-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정
-- column_name data_type(length)
-- [not null] [default value] [auto_increment] column_constraint;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb1 (
   pk INT PRIMARY KEY,
   fk int,
   col1 varchar(255),
   check(col1 IN ('Y', 'N')) # col1에 들어갈 수 있는 거 제약
) ENGINE = INNODB;

DESCRIBE tb1;
INSERT INTO tb1 values(3, "10", 'Y');

SELECT * FROM tb1;

DROP TABLE tb2;

/* Auto_Increment */
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.
CREATE TABLE IF NOT EXISTS tb2(
   pk int AUTO_INCREMENT PRIMARY KEY,
   fk int,
   col1 varchar(255),
   CHECK (col1 IN ('Y', 'N') # 체크 제약 조건
   )) ENGINE = innodb;

DESCRIBE tb2;

INSERT INTO tb2 VALUES (NULL, 10, 'Y'); # 대소문자를 취급하지 않는다.

INSERT INTO tb2 VALUES (/*NULL*/, 10, 'N'); # PRIMARY key를 넣지 않았기 때문에 정상 작동하지 않는다.

-- check 제약 조건에 위배된다.
-- INSERT INTO tb2 VALUES (30, 'F'); 

-- alter
-- 테이블에 추가/변경/수정/삭제하는 모든 것을 alter 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하므로 대표적인 것만 살펴본다.

ALTER TABLE tb2 # 테이블의 구조를 변경
ADD col2 int NOT NULL;

DESCRIBE tb2;

-- 테이블의 컬럼을 삭제하는 행위
ALTER TABLE tb2
DROP column col2;

DESCRIBE tb2;

-- 열의 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_ke int NOT NULL; # 이름만 바꾸는 게 아니라 덮어 씌운다고 보는게 더 낫다.

-- 컬럼 수정시 커럼의 값을 덮어씌운다 생각을 해야 함.
-- ALTER TABLE tb2
-- CHANGE COLUMN change_ke fk; # 이름만 바꾸는 것은 불가능하다. 변경되는 이름, 타입은 필수이고 , 제약 조건 등을 입력해줘야 한다.
DESCRIBE tb2;

-- 열의 제약 조건 추가 및 삭제
-- 실행시 auto_increment으로 인해 오류가 발생한다.
ALTER TABLE tb2
DROP PRIMARY KEY; # 프라이머리 키는 유일한 키이기 때문에 따로 추가적으로 입력해줄 필요가 없다.

-- auto_increment가 걸려있는 칼럼은 primary key 제거가 안되므로
-- auto_increment를 modify 명령으로 제거한다.
ALTER TABLE tb2
MODIFY pk int;

-- auto_increment 옵션을 제거하여 primary key 제약 조건을 제거할 수 있다.
ALTER TABLE tb2
DROP PRIMARY KEY;

-- primary key 제약 조건 추가
ALTER TABLE tb2
ADD PRIMARY key(pk); # 기본 키가 항상 제일 앞일 필요는 없다. 프라이머리 키를 지정하면 자동으로 NOT NULL 조건이 추가된다.

DELETE FROM tb2; # delete는 테이블의 데이터를 삭제하는 것이고, 테이블 구조는 drop으로 삭제하는 것이다.
SELECT * FROM tb2;

ALTER TABLE tb2
ADD PRIMARY key(change_ke);

DESCRIBE tb2;

-- 칼럼 여러 개 추가
ALTER TABLE tb2
ADD col3 date NOT NULL, # 만약 데이터 값이 존재하면 NOT NULL 조건은 무결성 원칙에 위배되서 오류가 난다. 이를 해결하기 위해 root 계정에서 전역 설정을 변경해야 한다.
ADD col4 TINYINT NOT NULL;

DESCRIBE tb2;

/* drop */
-- 테이블을 삭제하기 위한 구문
-- IF EXISTS를 적용하면 존재하지 않는 테이블 삭제 구문이라도 에러가 발생하지 않는다.

-- drop [TEMPORARY] table [IF EXISTS] table_name [, table_name]....

-- tb3 테이블 생성
CREATE TABLE IF NOT EXISTS tb3(
   pk int AUTO_INCREMENT PRIMARY key,
   fk int,
   col1 varchar(255),
   CHECK(col1 IN ('Y', 'N'))
)ENGINE = innodb;

DROP TABLE IF EXISTS tb3;
-- 삭제하고자 하는 테이블이 없는 경우 아래의 코드는 에러를 발생시킨다.
-- 보통 테이블 생성 구문은 여러 개의 테이블을 한번에 생성하기 때문에 아래와 같은 오류가 발생되면 열 받는다.
DROP TABLE tb3;
SHOW TABLES;

-- 다중 삭제를 위해서 여러 개의 테이블을 만든다.
CREATE TABLE IF NOT EXISTS tb3(
   pk int AUTO_INCREMENT PRIMARY key,
   fk int,
   col1 varchar(255),
   CHECK(col1 IN ('Y', 'N'))
)ENGINE = innodb;

CREATE TABLE IF NOT EXISTS tb4(
   pk int AUTO_INCREMENT PRIMARY key,
   fk int,
   col1 varchar(255),
   CHECK(col1 IN ('Y', 'N'))
)ENGINE = innodb;

SHOW TABLES;
-- 여러 개의 테이블을 삭제하는 경우 아래와 같이 ','로 나열한다.
DROP TABLE tb3, tb4;
DROP TABLE IF EXISTS tb3, tb4;
SHOW TABLES;

-- 테이블을 초기화하는 구문
CREATE TABLE IF NOT EXISTS tb5(
   pk int AUTO_INCREMENT PRIMARY key,
   fk int,
   col1 varchar(255),
   CHECK(col1 IN ('Y', 'N'))
)ENGINE = innodb;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
INSERT INTO tb5 VALUES (NULL, 1, 'Y');
SELECT * FROM tb5;

DELETE FROM tb5   WHERE pk = 4;
   
SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');

truncate tb5;

SELECT * FROM tb5;

INSERT INTO tb5 VALUES (NULL, 1, 'Y');