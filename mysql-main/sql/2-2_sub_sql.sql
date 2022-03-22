SELECT * FROM book;
/*
book테이블에서 price가 14450이상인 도서정보를 출력하시오
*/
SELECT * 
FROM book
WHERE price >= (
	SELECT AVG(price)
    FROM book
); 


/*
book테이블에서 price가 가장 큰 도서명을 출력하시오
*/
SELECT bookname
FROM book
WHERE price = (
	SELECT MAX(price)
    FROM BOOK
);


/*
    orders.saleprice가 가장 큰 책의 book.publisher를 출력하시오
*/
SELECT book.publisher
FROM book JOIN orders ON book.bookid = orders.bookid
WHERE orders.saleprice = (
	SELECT MAX(orders.saleprice)
    FROM orders
);

SELECT name,phone
FROM customer
WHERE custid = (
	SELECT custid
	FROM orders
	WHERE saleprice = (
			SELECT MAX(saleprice)
			FROM orders
			)
    );


/*
    튜플변수 테이블의 이름을 변경
    book => data1, orders => data2 바꿔서 bookid 일치하는 모든자료를 출력
*/
SELECT *
FROM book JOIN orders ON book.bookid = orders.bookid;

SELECT *
FROM book data1 JOIN orders data2 ON data1.bookid = data2.bookid;












