/*where*/

SELECT
	menu_code , 
	menu_name , 
	menu_price ,
	ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE ORDERABLE_STATUS = 'Y';
 
SELECT 
	menu_name,
	menu_price,
	orderable_status
from TBL_MENU TM 
WHERE MENU_PRICE = 13000;

select
	menu_code,
	menu_name,
	ORDERABLE_STATUS
	from TBL_MENU
	WHERE 
	ORDERABLE_STATUS != 'Y';

-- 가격이 20000원 이상인 메뉴를 조회해 주세요
-- 코드, 이름, 가격을 보여주고 코드를 기준으로 내림차순으로 정렬해주세요

SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM TBL_MENU
  WHERE MENU_PRICE  >= 20000
  ORDER BY MENU_code  DESC ;
 
 
 -- 가격이 5000원 이상이면서 판매중인 제품을 조회
 -- 코드, 이름, 가격, 상태
 
 SELECT
 	menu_code,
 	menu_name,
 	menu_price,
 	orderable_status
   FROM TBL_MENU TM 
  WHERE MENU_PRICE >= 5000 
  	AND ORDERABLE_STATUS = 'Y'
  	
 -- 제품이 판매 중이거나 혹은 CATEGORY_CODE 10인 목록 조회
 -- 카테고리,코드, 이름, 가격, 상태
 
 SELECT 
 	CATEGORY_CODE,
 	menu_code,
 	menu_price,
 	menu_name,
 	orderable_status
   FROM TBL_MENU
 WHERE CATEGORY_CODE = 10
 	OR ORDERABLE_STATUS = 'Y'
 
 	
 SELECT 
 	MENU_CODE,
 	MENU_NAME,
 	CATEGORY_CODE,
 	ORDERABLE_STATUS
 	FROM TBL_MENU
 	WHERE CATEGORY_CODE  = 4
 	OR MENU_PRICE  = 9000
 	AND MENU_CODE > 10;
 
 
 SELECT 
 	MENU_CODE,
 	MENU_NAME,
 	MENU_PRICE,
 	CATEGORY_CODE,
 	ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE
 	MENU_PRICE >= 10000
   AND MENU_PRICE <= 25000
  ORDER BY MENU_PRICE;
   
 
 SELECT 
 	menu_name ,
 	menu_price ,
 	category_code
  FROM TBL_MENU TM 
  WHERE MENU_PRICE BETWEEN 10000 AND 25000;
 
 
 SELECT
	 MENU_NAME,
	 MENU_PRICE,
	 CATEGORY_CODE
   FROM TBL_MENU TM 
  WHERE MENU_PRICE NOT BETWEEN 10000 AND 25000
  ORDER BY MENU_PRICE DESC;
 
 
 -- 값이 포함되어 있는지 확인하는 방법
 SELECT 
 	MENU_NAME,
 	MENU_PRICE,
 	CATEGORY_CODE
  FROM TBL_MENU TM 
 WHERE MENU_NAME LIKE '%마늘%'
 ORDER BY MENU_NAME 
 
-- 가격이 5000원 이상이고 카테고리 코드가 10번인 녀석 중 갈치라는 이름이 포함된 메뉴를 조회해주세요
-- code, name, category_code, price
 
 SELECT 
 	MENU_NAME,
 	MENU_PRICE,
 	MENU_CODE,
 	CATEGORY_CODE
  FROM TBL_MENU TM 
  WHERE 
  	MENU_PRICE >= 5000
  AND CATEGORY_CODE = 10
  AND MENU_NAME LIKE '%갈치%'
  ORDER BY MENU_NAME ;
 
 -- like의 부정문
  SELECT 
 	MENU_NAME,
 	MENU_PRICE,
 	MENU_CODE,
 	CATEGORY_CODE
  FROM TBL_MENU TM 
  WHERE 
  	MENU_PRICE >= 5000
  AND CATEGORY_CODE = 10
  AND MENU_NAME NOT LIKE '%갈치%'
  ORDER BY MENU_NAME ;
 
 
 
 SELECT * FROM tbl_category;

-- 한식(4) 중식(5) 일식(6) 메뉴를 조회하자
SELECT 
	menu_name,
	category_code
  FROM tbl_menu
  WHERE category_code  = 5
  	OR category_code  = 6
  	OR category_code  = 4;
  
  -- in()
SELECT 
	menu_name,
	category_code
  FROM tbl_menu
  WHERE category_code IN (4,5,6);
  
 
 -- 포함하지 않는 값을 조회
 SELECT 
	menu_name,
	category_code
  FROM tbl_menu
  WHERE category_code NOT IN (4,5,6);
 
 
 -- 값이 비어 있는 것을 확인 하기 위해서은 IS NULL을 활용
 SELECT 
 	category_code,
 	category_name,
 	ref_category_code
   FROM tbl_category
   WHERE ref_category_code IS NULL ;

  
  SELECT 
 	category_code,
 	category_name,
 	ref_category_code
   FROM tbl_category 
  WHERE ref_category_code IS NOT NULL ;
