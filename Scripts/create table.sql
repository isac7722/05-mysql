/* DDL(Data Definition Language) */

/* create */
-- 테이블을 생성하기 위한 구문
-- if not Exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다

-- 테이블의 컬럼 설정
-- column_name data_type(length) [not null] [default value] [auto_increment] column_constraint;



-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb1 (
	pk INT PRIMARY KEY,
	fk INT , 
	coll varchar(255),
	CHECK(coll IN ('Y','N'))
	)ENGINE = INNODB;
)

DESCRIBE tb1;
INSERT INTO tb1 VALUES (2, 10, 'N');
SELECT * FROM tb1;


/* Auto_Increment */
-- insert 시 primary 키에 해당하는 컬럼에 자동으로 번호를 발생 (중복되지 않게) 시켜 저장할 수 있다
	CREATE TABLE IF NOT EXISTS tb2(
		pk int AUTO_INCREMENT PRIMARY KEY,
		fk int ,
		col1 varchar (255) ,
		CHECK (col1 IN('y','n'))
	) ENGINE = INNODB;
	

DESCRIBE tb2;

-- INSERT INTO tb2 VALUES (NULL, 10, 'Y');
-- SELECT * FROM tb2;
-- 
-- INSERT INTO tb2 VALUES ( 10, 'n');
-- SELECT * FROM tb2;
-- 
-- INSERT INTO tb2 VALUES ( 10, 'f');
-- SELECT * FROM tb2;

-- check 제약 조건에 위배된다.
-- INSERT INTO tb2 VALUES(30,'f');




-- alter
-- 테이블에 추가/ 변경 / 수정 / 삭제하는 모든 것은 alter 명령어를 사용해 적용한다.
-- 종류가 너무 많고 복잡하므로 대표적인 것만 살펴본다
ALTER TABLE tb2
ADD col2 int NOT NULL;

DESCRIBE tb2;

-- 테이블에 컬럼을 삭제하는 행위
ALTER TABLE tb2
DROP COLUMN col2;

DESCRIBE tb2;

-- 열의 이름 및 데이터 형식 변경
ALTER TABLE tb2
CHANGE COLUMN fk change_ke int NOT NULL;

DESCRIBE tb2;

-- 컬럼 수정시 컬럼의 값을 덮어씌운다 생각을 해야함
-- 컬럼의 이름만 바꿀 수 없다, 모든 것을 다 써줘야 한다.
-- ALTER TABLE tb2
-- CHANGE COLUMN change_ke fk;


-- 열의 제약조건 추가 및 삭제
-- 실행시 auto increment으로 인해 오류가 발생된다
ALTER TABLE tb2
DROP PRIMARY KEY;

-- auto_increment가 걸려 있는 컬럼은 primary key 제거가 안되므로
-- auto_increment를 modify 명령으로 제거한다.
ALTER TABLE tb2
MODIFY pk int;

-- auto_increment 옵션을 제거하여 primary_key 제약조건을 제거할 수 있다.
ALTER TABLE tb2
DROP PRIMARY KEY;

-- primary_key 제약조건 추가
ALTER TABLE tb2
ADD PRIMARY key(pk);

DESCRIBE tb2;

-- 컬럼 여러개 추가
ALTER TABLE tb2
ADD col3 date NOT NULL ,
ADD col4 TINYINT NOT NULL;

DESCRIBE tb2;

-- 


SELECT @@GLOBAL.SQL_MODE;
SET GLOBAL.SQL mode = '';


