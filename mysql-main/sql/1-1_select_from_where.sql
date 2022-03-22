SELECT * FROM book;
select bookid, bookname, price FROM book;
/* 북 테이블에서 price가 10000이상인 bookname을 출력하라 */ 
SELECT bookname FROM book;
SELECT bookname FROM book WHERE price >= 10000;
/* 북 테이블에서 price가 10000~20000사이인 bookname을 출력하라 */ 
SELECT bookname FROM book WHERE price >= 10000 AND price <= 20000;
SELECT bookname FROM book WHERE price BETWEEN 10000 AND 20000;
/* 북 테이블에서 bookname이 '축구'로 시작하는 모든 자료를 출력하라 */ 
SELECT * 
FROM book
WHERE bookname LIKE '축구%';
/* 북 테이블에서 bookname이 '이야기'로 끝나는 모든 자료를 출력하라 */ 
SELECT * 
FROM book
WHERE bookname LIKE '%이야기';
/* 북 테이블에서 bookname이 '축구'로 시작하거나 '이야기'로 끝나는 모든 자료를 출력하라 */ 
SELECT * 
FROM book
WHERE bookname LIKE '축구%' OR bookname LIKE '%이야기';

/* 북 테이블에서 publisher이 '대한미디어' 이거나 '굿스포츠'인 모든 자료를 출력하라 */ 
SELECT * 
FROM book
WHERE publisher = '대한미디어' OR publisher = '굿스포츠';

SELECT * 
FROM book
WHERE publisher IN('대한미디어', '굿스포츠');

/* 북 테이블에서 publisher가 '대한미디어'가 아니고 '굿스포츠'도 아닌 모든 자료를 출력하라 */ 
SELECT * 
FROM book
WHERE publisher <> '대한미디어' AND publisher <> '굿스포츠';
SELECT * 
FROM book
WHERE publisher NOT IN('대한미디어', '굿스포츠');

/* 북 테이블에서 publisher가 NULL인 모든 자료를 출력하라 */
SELECT * FROM book WHERE publisher IS NULL;
/* 북 테이블에서 publisher가 NULL이 아닌 모든 자료를 출력하라 */
SELECT * FROM book WHERE publisher IS NOT NULL;
