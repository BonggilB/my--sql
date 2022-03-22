DROP DATABASE notice;
CREATE DATABASE notice;

USE notice;

CREATE TABLE qna(
	번호 INTEGER,
    제목 VARCHAR(40),
    내용 VARCHAR(255),
    작성자 VARCHAR(10),
    작성일 DATE
);

INSERT INTO qna VALUES(1,'회원가입방법1','어쩌구 저쩌구1.......','홍길동','2014-01-01');
INSERT INTO qna VALUES(2,'회원가입방법2','어쩌구 저쩌구2.......','이몽룡','2014-01-02');
INSERT INTO qna VALUES(3,'회원가입방법3','어쩌구 저쩌구3.......','성춘향','2014-01-03');
INSERT INTO qna VALUES(4,'회원가입방법4','어쩌구 저쩌구4.......','월매','2014-01-04');
INSERT INTO qna VALUES(5,'회원가입방법5','어쩌구 저쩌구5.......','변사또','2014-01-05');

SELECT * FROM qna WHERE 번호>=2 AND 번호<=4 ORDER BY 작성자;








