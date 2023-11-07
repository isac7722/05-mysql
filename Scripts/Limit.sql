/*LIMIT*/

SELECT 
	menu_code,
	menu_name,
	menu_price
  FROM tbl_menu
  ORDER BY menu_price DESC ;
  
 SELECT 
 	menu_code,
 	menu_name,
 	menu_price
   FROM tbl_menu
   ORDER BY menu_code
   LIMIT 7,5; -- 앞 숫자: 몇번 부터 출력 할거야? 뒷 숫자 : 숫자 몇개를 출력할거야?
   
   
 SELECT 
 	menu_code,
 	menu_name,
 	menu_price
 	FROM tbl_menu
 	ORDER BY
 	menu_price DESC, 
 	menu_name ASC
 	LIMIT 5 ;
   
 