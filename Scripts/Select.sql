-- sql의 기본 select 구문
select MENU_NAME from TBL_MENU;


select #선택하다
 	menu_code ,
 	menu_name ,
 	menu_price 
  FROM tbl_menu; #menu table 에서
  
  -- CODE, 이름, 가격 , STATUS(상태), 카테고리를 조회해주세요
  
  SELECT 
  	 menu_code , 
  	 menu_name ,
  	 menu_price ,
  	 orderable_status ,
  	 category_code 
   FROM tbl_menu;
 
  SELECT 
  	 *
    FROM tbl_menu;
   
   -- 연산을 바로 실행함
	SELECT 6+3;
 
-- 내장 함수를 사용함
	SELECT NOW(); 
 	SELECT CONCAT('홍.','     ', '길동'); 
 -- 별칭을 지정함
	SELECT CONCAT('홍.','     ', '길동')  as 'NAME' ;

SELECT  '홍길동';
 
 