/* DML(Data Manipulation Language) */

-- insert , update , delete , select(dql)- data query language
-- 데이터 조작언어, 테이블에 값을 삽입하거나, 수정하거나
-- 삭제하거나, 조회하는 언어

INSERT INTO tbl_menu VALUES(
	NULL, -- menu_code
	'바나나해장국', -- menu_name
	8500, -- menu_price
	
	4,
	'Y'
)

SELECT * FROM tbl_menu ;

INSERT INTO tbl_menu 
	(
		menu_code , 
		menu_name ,
		menu_price ,
		category_code ,
		orderable_status 
	)
	VALUES(
	NULL, -- menu_code
	'바나나해장국', -- menu_name
	8500,
	4,
	'Y'
)