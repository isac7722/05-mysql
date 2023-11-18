/* CONSTRAINTS */

/* 제약 조건
 * 테이블 작성 시 각 컬럼에 값 기록에 대한 제약조건을 설정할 수 있다.
 * 데이터 무결성 보장을 목적으로 한다.
 * 입력/수정하는 데이터에 문제가 없는지 자동으로 검사해 주게 하기 위한 목적이다.
 * primary Key, not null, unique, check, foreign key
 * */

-- not null
-- null 값을 허용하지 않는다.
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull(
	user_no int NOT NULL,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_namee varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255)
)ENGINE=innodb;

INSERT INTO user_notnull
	(USER_no, user_id, user_pwd, user_namee, gender, phone, email)
 VALUES
 (1,'user01', 'pass01', '홍길동','남', '010-2322-2323', 'hong123@gmail.com' ),
 (2,'user02', 'pass02', '김길동','여', '010-2322-2323', 'kim123@gmail.com' ),
 (3,'user03', 'pass03', '고길동','남', '010-2322-2323', 'ko123@gmail.com' );
 


-- not null 제약 조건은 null을 허용하지 않기 때문에 아래의 경우 오류가 발생된다.
-- 값을 넣어주거나 기본 값 설정을 해주어야 한다.
INSERT INTO user_notnull
	(USER_no, user_id, user_pwd, user_namee, gender)
 VALUES
 (4,'user03', 'pass03', '고길동','남');

SELECT * FROM user_notnull;

/* unique 제약 조건*/
-- unique 제약 조건은 중복되는 값을 허용하지 않는 제약조건이다.
DROP TABLE IF EXISTS user_unique;

CREATE TABLE IF NOT EXISTS user_unique(
	user_no int NOT NULL UNIQUE,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_namee varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255) NOT NULL,
	email varchar(255),
	UNIQUE(phone)
)ENGINE=innodb;



CREATE TABLE IF NOT EXISTS user_unique_test(
	user_no int NOT NULL UNIQUE,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_namee varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255),
	email varchar(255),
	UNIQUE(phone)
)ENGINE=innodb;


INSERT INTO user_unique
	(USER_no, user_id, user_pwd, user_namee, gender, phone, email)
 VALUES
 (1,'user01', 'pass01', '홍길동','남', '010-2322-2324', 'hong123@gmail.com' ),
 (2,'user02', 'pass02', '김길동','여', '010-2322-2325', 'kim123@gmail.com' ),
 (3,'user03', 'pass03', '고길동','남', '010-2322-2326', 'ko123@gmail.com' );
 

-- 아래의 경우 null을 값으로 인식하지 않기 때문에 unique 제약조건을 위배하지 않는다.
INSERT INTO user_unique_test
	(USER_no, user_id, user_pwd, user_namee, gender, phone, email)
 VALUES
 (1,'user01', 'pass01', '홍길동','남', null, 'hong123@gmail.com' ),
 (2,'user02', 'pass02', '김길동','여', null, 'kim123@gmail.com' ),
 (3,'user03', 'pass03', '고길동','남', null, 'ko123@gmail.com' );
 
-- 값을 넣어주는 과정에서 중복되는 값을 넣으면 에러가 발생된다.
UPDATE user_unique_test 
   SET phone = "123456"
 WHERE user_no IN (1,2,3);

SELECT * FROM user_unique_test;

SELECT * FROM user_unique;


/* Primary key */
/* 테이블에서 한 행의 정보를 찾기 위해 사용 할 컬럼을 의미한다.
 * 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
 * not null + unique 제약조건을 의미
 * 한 테이블당 한 개만 설정할 수 있다..
 * 컬럼 레벨, 테이블 레벨 둘 다 설정 가능하다.
 * 한 개 컬럼에 설정할 수 있으며, 여러 개의 컬럼을 묶어서 설정하는 것도 가능하다.(복합키)
 * */
DROP TABLE IF EXISTS user_primarykey;


CREATE TABLE IF NOT EXISTS user_primarykey(
	user_no int,
	user_id varchar(255) NOT NULL,
	user_pwd varchar(255) NOT NULL,
	user_namee varchar(255) NOT NULL,
	gender varchar(3),
	phone varchar(255),
	email varchar(255),
	PRIMARY KEY (user_no)
)ENGINE=innodb;

INSERT INTO user_primarykey
	(USER_no, user_id, user_pwd, user_namee, gender, phone, email)
 VALUES
 (1,'user01', 'pass01', '홍길동','남', null, 'hong123@gmail.com' ),
 (2,'user02', 'pass02', '김길동','여', null, 'kim123@gmail.com' ),
 (3,'user03', 'pass03', '고길동','남', null, 'ko123@gmail.com' );

-- primary key는 unique 제약조건으로 인해 중복되는 값을 허용하지 않는다.
INSERT INTO user_primarykey
	(USER_no, user_id, user_pwd, user_namee, gender, phone, email)
 VALUES
 (1,'user01', 'pass01', '홍길동','남', null, 'hong123@gmail.com' );

UPDATE user_primarykey 
   SET user_no = 2
 WHERE user_no = 1;


-- not null 제약조건으로 인해 null 값을 허용하지 않는다.
INSERT INTO user_primarykey
 (USER_no, user_id, user_pwd, user_namee, gender, phone, email)
 VALUES
 (null,'user01', 'pass01', '홍길동','남', null, 'hong123@gmail.com' );

SELECT * FROM user_primarykey;


-- FOREIGN KEY
-- 참조 (REFERENCES)된 다른 테이블에서 제공하는 값만 사용할 수 있다.
-- 참조 무결성을 위배하지 않기 위해서 사용
-- FOREING KEY 제약조건에 의해서
-- 테이블 간의 관계(RELATIONSHIP)가 형성 됨
-- 제공되는 값 외에는 NULL을 사용할 수 있음

DROP TABLE IF EXISTS user_grade;

CREATE TABLE IF NOT EXISTS user_grade(
	grade_code int NOT NULL UNIQUE,
	grade_name varchar(255) NOT null
)ENGINE=innodb;

INSERT INTO user_grade
VALUES
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원'),
(50, '테스트회원');


DROP TABLE IF EXISTS user_foregnkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) 
		REFERENCES user_grade (grade_code)
) ENGINE=INNODB;

INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender,phone, email, grade_code)
VALUES 
	(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
	(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);


INSERT INTO user_foreignkey1
	(user_no, user_id, user_pwd, user_name, gender,phone, email, grade_code)
VALUES 
	(3, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 50);
	

SELECT * FROM user_grade;

describe user_foreignkey1;

SELECT * FROM user_foreignkey1;