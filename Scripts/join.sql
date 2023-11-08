/*join*/

SELECT 
	tm.menu_code ,
	tm.menu_name ,
	tm.menu_price ,
	tc.category_name 
  FROM tbl_menu tm
  JOIN tbl_category tc ON (tm.category_code = tc.category_code)
  WHERE tm.orderable_status = 'y';
  
 -- 교집합만 포함하는 것을 추가하는 것은 INNER JOIN
 -- RIGHT, LEFT JOIN의 차이는 어떤 테이블을 기준으로 삼냐이다
 
 -- inner join
 -- on은 테이블간의 연결할 조건을 의미한다
 -- where은 조회된 결과에서 필터링할 조건이다.
 SELECT
 	a.menu_name ,
 	b.category_name
   FROM tbl_menu a
--    INNER JOIN tbl_category b ON (a.category_code = b.category_code);
   JOIN tbl_category b ON (a.category_code = b.category_code);
  
  -- join 의 규칙
 
  -- Right JOIN
  SELECT
 	a.menu_name ,
 	b.category_name
   FROM tbl_menu a
   RIGHT JOIN tbl_category b ON (a.category_code = b.category_code);
 
  
  -- cross join
  -- 왼쪽에 있는 것이랑 오른쪽에 있는 것 다 매칭
    SELECT
 	a.menu_name ,
 	b.category_name
   FROM tbl_menu a
   CROSS JOIN tbl_category b ON (a.category_code = b.category_code);
   
 
  -- outer join
  SELECT 
  	a.menu_name , 
  	b.category_name
   FROM tbl_menu a
   RIGHT JOIN tbl_category b ON (a.category_code = b.category_code)
   WHERE a.menu_name  IS NULL;
  
  
  -- self join
  SELECT
  	b.category_code AS 'b의 code' , 
 	a.category_code AS 'a의 code' ,
  	a.category_name ,
  	b.category_name 
  FROM tbl_category a
  JOIN tbl_category b ON (a.category_code = b.ref_category_code);
  SELECT * FROM tbl_category ;
 
 
 -- Self Join 이해하기 위한 코드
--  SELECT 
--  category_code ,
--  category_name ,
--  ref_category_code 
--  	FROM tbl_category;
 
 
  	