-- DISTINCT

SELECT 
	category_code 
  FROM tbl_menu
  ORDER BY category_code ;
  
 SELECT 
	DISTINCT category_code
  FROM tbl_menu
  ORDER BY category_code ;
  
  SELECT 
	count(DISTINCT category_code)
  FROM tbl_menu
  ORDER BY category_code ;
  
 
 -- NULL값을 포함한 열의 DISTINCT
 SELECT 
 	ref_category_code
   FROM tbl_category;
  
 SELECT 
 	DISTINCT ref_category_code
   FROM tbl_category;
  
  -- 열이 여러개인 값의 중복 제거
  SELECT DISTINCT 
  	category_code,
  	orderable_status
  	FROM tbl_menu
  	ORDER BY category_code ;
  
  -- SELECT를 조회를 할 때 , 조회한 값이 다 같아야 에러가 안난다

  
  