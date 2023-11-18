/* CAST Functions */

/* 명시적 형변환(Explicit Conversion)
 * cast (expression as 데이터 형식[(길이)]
 * convert (expression, 데이터 형식[(길이)])
 * 데이터 형식으로 가능한 것은 Binary, Char, Date, Detetime, decimal
 * json, Signed Integer, Time, unsigned integer 등이 있다. 
 * */

SELECT avg(menu_price) FROM tbl_menu;

SELECT CAST(avg(menu_price) AS SIGNED Integer) AS '평균가격' FROM tbl_menu;
SELECT CONVERt(avg(menu_price), SIGNED Integer) AS '평균 가격' FROM tbl_menu;

SELECT CAST('2023$05$30' AS Date);
SELECT CAST('2023/05/30' AS Date);
SELECT CAST('2023@05@30' AS Date);
