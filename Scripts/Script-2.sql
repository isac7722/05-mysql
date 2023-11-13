/* CONSTRAINTS */

/* 제약조건
 * 테이블 작성시 각 컬럼에 값 기록에 대한 제약조건을 설정할 수있다.
 * 데이터 무결성 보장을 목적으로 한다.
 * 입력 / 수정하는 데이터에 문제가 없는지 자동으로 검사해 주게 하기 위한 목적이다.
 * primary key, not null, unique, check, foreign key
 */
 

-- not null
-- null 값을 허용하지 않는다
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull(
	user_no int NOT NULL,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255)
) ENGINE = innodb;

INSERT INTO user_notnull 
	(USER_no, user_id, user_pwd, user_name, gender, phone, email)
	VALUES
	(1, 'user01','pass01','홍길동','남','010-1234-5678','hong123@gmail.com'),
	(2, 'user02','pass02','김길동','여','010-1234-5678','kim123@gmail.com'),
	(3, 'user03','pass03','고길동','남','010-1234-5678','ko123@gmail.com');
	
SELECT * FROM user_notnull ;


INSERT INTO user_notnull 
	(USER_no, user_id, user_pwd, user_name, gender, phone)
	VALUES
	(4, 'user03','pass03','고길동','남','010-1234-5678');

-- not null 제약 조건은 null을 허용하지 않기 때문에 아래의 경우 오류가 발생된다
-- 값을 넣어주거나 기본 값 설정을 해주어야 한다.

DROP TABLE IF EXISTS user_unique;
CREATE TABLE IF NOT EXISTS user_unique(
	user_no int NOT NULL UNIQUE,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255),
	UNIQUE(phone)
) ENGINE = innodb;


SELECT * FROM user_unique ;

INSERT INTO user_unique
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
	VALUES
	(1, 'user01','pass01','홍길동','남','010-1234-5678','hong123@gmail.com'),
	(2, 'user02','pass02','김길동','여','010-2321-4234','kim123@gmail.com'),
	(3, 'user03','pass03','고길동','남','010-3434-5678','ko123@gmail.com');


CREATE TABLE IF NOT EXISTS user_unique_test(
	user_no int NOT NULL UNIQUE,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_name varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255),
	email varchar(255),
	UNIQUE(phone)
) ENGINE = innodb;


SELECT * FROM user_unique_test ;
INSERT INTO user_unique_test
	(user_no, user_id, user_pwd, user_name, gender, phone, email)
	VALUES
	(1, 'user01','pass01','홍길동','남',null,'hong123@gmail.com'),
	(2, 'user02','pass02','김길동','여',null,'kim123@gmail.com'),
	(3, 'user03','pass03','고길동','남',null,'ko123@gmail.com');