/*book 테이블에서  publisher가 '대한미디어'인 자료를 중복되지 않게 출력하시오*/
SELECT DISTINCT publisher FROM book WHERE publisher='대한미디어';
/*book테이블의 모든 자료를 '일련번호','제목','출판사','가격'으로 변경하여 출력하시오*/
SELECT bookid AS '일련번호',bookname AS '제목',publisher AS '출판사', price AS '가격'
FROM book;
/*book테이블의 모든 자료를 '일련번호','제목','출판사','가격'으로 변경하고 가격이 12000이상인 자료를 출력하시오*/
/*SELECT bookid AS '일련번호',bookname AS '제목',publisher AS '출판사', price AS '가격'
FROM book
WHERE 가격>=12000;*/


/*book 테이블에서 대한미디어의 가격 합계를 출력하시오*/
SELECT publisher AS '출판사',SUM(price) AS '가격합계'
FROM book
WHERE publisher = '대한미디어';

/*book 테이블에서 '대한미디어'의 거래건수를 출력하시오*/
SELECT publisher AS '출판사',COUNT(price) AS '거래건수'
FROM book
WHERE publisher = '대한미디어';
/*book 테이블에서 판매가의 합계,평균,최대,최소,갯수를 출력*/
SELECT SUM(price) AS '합계',
       AVG(price) AS '평균',
       MAX(price) AS '최대값',
       MIN(price) AS '최소값',
       COUNT(price) AS '갯수'
FROM book;

/*book 테이블에서 각각의 publisher별 가격 합계를 출력하시오*/
SELECT publisher AS '출판사',COUNT(publisher) AS '거래건수',SUM(price) AS '가격합계'
FROM book
GROUP BY publisher;

/*book 테이블에서 각각의 publisher별 가격 합계를 출력하시오*/
SELECT publisher AS '출판사',COUNT(publisher) AS '거래건수',SUM(price) AS '가격합계'
FROM book
GROUP BY publisher;


/*ORDER 테이블을 출력하시오*/
SELECT * FROM orders;

/*ORDER 테이블을 '주문번호','구매자번호','책번호','구입가격','구입일자' 출력하시오*/
SELECT orderid AS '주문번호',custid AS '구매자번호',bookid AS '책번호',saleprice AS '구입가격',orderdate AS '구입일자'
FROM orders;

/*ORDER 테이블을 '구매자번호','구입가격'의 합계 출력하시오. 단 구매자번호별로 구하시오*/
SELECT custid AS '구매자번호',SUM(saleprice) AS '구입가격의 합계'
FROM orders
GROUP BY custid;

/*ORDER 테이블을 '구매자번호','구입가격'의 합계 출력하시오. 단 구매자번호별로 구매건수가 3건 이상인것*/
SELECT custid AS '구매자번호',SUM(saleprice) AS '구입가격의 합계'
FROM orders
GROUP BY custid
HAVING COUNT(custid) >=3;

/* 
   orders 테이블에서 saleprice가 10000~15000 사이의 자료를 대상으로 
   custid별 'custid','saleprice'합계,'거래건수'를 출력하시오
   단 거래건수가 2건 이상인 자료를 대상으로 하시오 
*/

   SELECT custid,SUM(saleprice) AS '합계', COUNT(*) AS '거래건수'
   FROM orders
   WHERE saleprice BETWEEN 10000 AND 15000
   group by custid
   HAVING COUNT(custid)>=2;
   
   
   /*book테이블에서 bookname,publisher,price를 publisher의 오름차순으로 정렬하여 출력하시오*/
   SELECT bookname,publisher,price
   FROM book
   ORDER BY publisher ASC;
   
   /*book테이블에서 bookname,publisher,price를 publisher의 오름차순으로 정렬하고, 
     동일한 출판사의 경우 bookname의 내림차순으로 출력하시오*/
   SELECT bookname,publisher,price
   FROM book
   ORDER BY publisher ASC,bookname DESC;
   
   /*
   orders테이블에서 custid가 3이하인 고객중, 2회이상 거래된 고객을 대상으로 
   custid별 custid,saleprice의 합계,판매개수를 custid의 내림차순으로 정렬하여 출력하시오
   */
  SELECT custid,SUM(saleprice) AS '합계',COUNT(*) AS '판매개수'
  FROM orders
  WHERE custid<=3
  GROUP BY custid
  HAVING COUNT(*)>=2
  ORDER BY custid DESC;
   
   