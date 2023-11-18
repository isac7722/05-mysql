/* DDL(data Definition Language) */

/* create */
-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다..

-- 테이블의 컬럼 설정
-- column_name  data_type(length) 
-- [not null] [default value] [auto_increment] column_constraint;


-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY,
	fk int  ,
	col1 varchar(255),
	check(col1 IN ('Y','N'))
) ENGINE = INNODB;

DESCRIBE tb1;
INSERT INTO tb1 values(3,"10","N");
SELECT * FROM tb1;

DROP TABLE tb2;

/* Auto_Increment */
-- insert 시 primary키에 해당하는 컬럼에 자동으로 번호를 발생(중복되지 않게) 시켜 저장할 수 있다.
CREATE TABLE IF NOT EXISTS tb2(
	pk int AUTO_INCREMENT PRIMARY KEY,
	fk int ,
	col1 varchar(255),
	CHECK (col1 IN ('y','n'))
)ENGINE=INNODB;

INSERT INTO tb2 VALUES (NULL, 10, 'Y');
SELECT  * FROM tb2;
INSERT INTO tb2 VALUES (null,10,'n');
SELECT * FROM tb2;

-- check 제약 조건에 위배된다. 
-- INSERT INTO tb2 VALUES (30,'f');

-- alter
-- 테이블에 추가/변경/수정/삭제하는 모든 것은 alter 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하므로 대표적인 것만 살펴본다.
ALTER TABLE tb2 
ADD col2 int NOT NULL;

DESCRIBE tb2;

-- 테이블에 컬럼을 삭제하는 행위
ALTER TABLE tb2 
DROP column col2;

DESCRIBE tb2;

-- 열의 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_ke int NOT NULL;

-- 컬럼 수정시 컬럼의 값을 덮어씌운다 생각을 해야함
-- ALTER TABLE tb2
-- CHANGE COLUMN change_ke fk;
DESCRIBE tb2;

-- 열의 제약 조건 추가 및 삭제 
-- 실행시 auto_increment으로 인해 오류가 발생된다..
ALTER TABLE tb2
DROP PRIMARY KEY;

-- auto_increment가 걸려 있는 컬럼은 primary key 제거가 안되므로
-- auto_increment를 modify 명령으로 제거한다
ALTER TABLE tb2
MODIFY pk int;

-- auto_increment 옵션을 제거하여 primary key 제약 조건을 제거할 수 있다.
ALTER TABLE tb2
DROP PRIMARY KEY;

-- primary key 제약조건 추가
ALTER TABLE tb2
ADD PRIMARY KEY(pk);


DELETE FROM tb2;
SELECT * FROM tb2;

ALTER TABLE tb2
ADD PRIMARY KEY(fk);

DESCRIBE tb2;

-- 컬럼 여러개 추가
ALTER TABLE tb2  
ADD col3 date NOT NULL,
ADD col4 TINYINT NOT NULL;

DELETE FROM tb2;

DESCRIBE tb2;

-- DATE 형이 0으로 추가가 안 되는 것은 mysql 5.7 버전 이후 select @@Global.sql_mode 했을 때ㅐ
-- 나온 결과 ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,
-- NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,
-- NO_ENGINE_SUBSTITUTION
-- 에서 no_zero_date 때문이며 0으로 채워진 Date 컬럼이 존재하면 안되기 때문이다.

-- root 계정으로 실행해야 한다.
SELECT @@GLOBAL.SQL_MODE;
set GLOBAL sql_mode = '';


SELECT * FROM tb2;

/* drop */
-- 테이블을 삭제하기 위한 구문
-- IF EXISTS를 적용하면 존재하지 않는 테이블 삭제 구문이라도 에러가 발생하지 않는다.

-- drop [TEMPORARY] table [IF EXISTS] table_name [, table_name]....

-- tb3 테이블 생성
CREATE TABLE IF NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY key,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

DROP TABLE IF EXISTS TB3;
-- 삭제하고자 하는 테이블이 없는 경우 아래의 코드는 에러를 발생시킨다.
-- 보통 테이블 생성 구문은 여러개의 테이블을 한번에 생성하기 때문에 아래와 같은 오류가 발생되면 열받는다.
DROP TABLE TB3;
SHOW TABLES;

-- 다중 삭제를 위해서 여러개의 테이블을 생성한다
CREATE TABLE IF NOT EXISTS tb3(
	pk int AUTO_INCREMENT PRIMARY key,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tb4(
	pk int AUTO_INCREMENT PRIMARY key,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

SHOW TABLES;
-- 여러개의 테이블을 삭제하는 경우 아래와 같이 ,로 나열한다.
DROP TABLE TB3, TB4;
DROP TABLE IF EXISTS TB3, TB4;
SHOW TABLES;


-- 테이블을 초기화 하는 구문

CREATE TABLE IF NOT EXISTS tb5(
	pk int AUTO_INCREMENT PRIMARY key,
	fk int,
	col1 varchar(255),
	check(col1 IN ('Y', 'N'))
) ENGINE=INNODB;


INSERT INTO tb5 values (NULL, 1, 'Y');
INSERT INTO TB5 values (NULL, 1, 'Y');
INSERT INTO TB5 values (NULL, 1, 'Y');
INSERT INTO TB5 values (NULL, 1, 'Y');

SELECT * FROM tb5;

DELETE 
  FROM tb5
 WHERE pk=4;
 
SELECT * FROM tb5;

INSERT INTO TB5 values (NULL, 1, 'Y');

truncate tb5;

SELECT * FROM tb5;

INSERT INTO TB5 values (NULL, 1, 'Y');

