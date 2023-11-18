/* where */

-- 값이 같은 친구를 조회하는 방법
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
	ORDERABLE_STATUS 
  FROM TBL_MENU
 WHERE MENU_PRICE = 13000;


-- 같지 않은 상태를 조회하는 방법
SELECT 
	menu_code,
	menu_name,
	ORDERABLE_STATUS 
  FROM TBL_MENU
 WHERE 
-- 	ORDERABLE_STATUS <> 'Y';
	ORDERABLE_STATUS != 'Y';

-- 가격이 20000원 이상인 메뉴를 조회해주세요
-- 코드, 이름, 가격을 보여주고 코드를 기준으로 내림차순으로 정렬해주세요
SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM TBL_MENU 
 WHERE MENU_PRICE >= 20000
 ORDER BY tm.MENU_CODE DESC;

-- 가격이 5000 이상이면서 판매중인 제품을 조회
-- 코드, 이름, 가격, 상태

 SELECT
	menu_code,
	menu_name,
	menu_price,
	orderable_status
  FROM tbl_menu
 WHERE menu_price >= 5000 
   AND orderable_status = 'Y';
	
-- 제품이 판매 중이거나 또는 CATEGORY_CODE가 10인 목록조회
-- 코드, 이름, 가격, 카테고리 코드,상태

SELECT 
    menu_name, 
    menu_price, 
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    orderable_status = 'Y' OR
    category_code = 10
ORDER BY 
    category_code;
   
SELECT * FROM TBL_MENU;


SELECT 
	MENU_CODE ,
	MENU_NAME ,
	MENU_PRICE ,
	CATEGORY_CODE ,
	ORDERABLE_STATUS 
  FROM TBL_MENU
 WHERE CATEGORY_CODE = 4 
 	OR MENU_PRICE =9000
   AND MENU_CODE > 10;
   
 -- 범위를 조회하는 경우
SELECT 
 	MENU_CODE ,
 	MENU_NAME ,
 	MENU_PRICE ,
 	CATEGORY_CODE ,
 	ORDERABLE_STATUS
  FROM TBL_MENU
 WHERE 
 	MENU_PRICE >= 10000
   AND MENU_PRICE <= 25000
 ORDER BY MENU_PRICE ;

SELECT  
	MENU_NAME ,
	MENU_PRICE ,
	CATEGORY_CODE
  FROM TBL_MENU
 WHERE MENU_PRICE BETWEEN 10000 AND 25000;


-- 범위에 해당하지 않은 목록조회
SELECT 
	MENU_NAME,
	MENU_PRICE,
	CATEGORY_CODE
  FROM TBL_MENU
 WHERE MENU_PRICE NOT BETWEEN 10000 AND 25000
 ORDER BY MENU_PRICE DESC;

-- 값이 포함되어 있는지 확인하는 방법
SELECT 
	MENU_NAME ,
	MENU_PRICE ,
	CATEGORY_CODE
  FROM TBL_MENU
 WHERE MENU_NAME LIKE '%마늘%'
 ORDER BY MENU_NAME;
 
-- 가격이 5000원 이상이고 카테고리 코드가 10인 녀석 중 갈치라는 이름이 포함된 메뉴를 조회해주세요
-- CODE, NAME, CATEGORY_CODE, PRICE
SELECT 
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE menu_price > 5000 
  AND category_code = 10
  AND menu_name LIKE '%갈치%';


-- like의 부정문을 알아본다.
SELECT 
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE menu_price > 5000 
  AND category_code = 10
  AND menu_name NOT LIKE '%갈치%';

-- 카테고리 코드가 한식(4) 중식(5) 일식(6) 메뉴를 조회하자
SELECT 
	menu_name ,
	category_code
  FROM tbl_menu
 WHERE category_code = 5
   OR category_code = 6
   OR category_code = 4;
 
-- in()
  SELECT 
	menu_name ,
	category_code
  FROM tbl_menu
 WHERE category_code IN (4,5,6);
 
-- 포함하지 않은 값을 조회
 SELECT 
	menu_name ,
	category_code
  FROM tbl_menu
 WHERE category_code NOT IN (4,5,6);

-- null을 조회하기
SELECT 
	category_code ,
	category_name ,
	ref_category_code 
  FROM tbl_category 
 WHERE ref_category_code IS NULL;
 
-- null이 아닌 목록조회
SELECT 
	category_code ,
	category_name ,
	ref_category_code 
  FROM tbl_category
 WHERE ref_category_code IS NOT NULL;