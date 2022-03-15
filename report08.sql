-- 1번
DROP DATABASE IF EXISTS member_db; -- 기존의 db 삭제
DROP USER IF EXISTS member_db@localhost; -- 기존의 user 삭제

CREATE DATABASE member_db; -- member_db 생성
CREATE USER member_db@localhost IDENTIFIED WITH mysql_native_password BY 'member_db'; -- 계정 생성

GRANT ALL PRIVILEGES ON member_db.* TO member_db@localhost;
USE member_db; -- db change

-- 2번
CREATE TABLE login_info(
	member_num INT PRIMARY KEY AUTO_INCREMENT, -- 정수형의 자동입력되는 기본키
    member_id VARCHAR(18) NOT NULL UNIQUE, -- 중복되지 않은 필수 문자열
    member_pass VARCHAR(18) NOT NULL -- 필수 문자열
);

-- 3번 자료입력
INSERT INTO login_info(member_id,member_pass)
					VALUES('igh0501','123456'); -- 아이디가 중복되지 않는 자료 입력
INSERT INTO login_info(member_id,member_pass)
					VALUES('igh0502','123456'); -- member_num은 자동입력
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0503','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0504','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0505','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0506','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0507','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0508','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0509','123456');
INSERT INTO login_info(member_id,member_pass) 
					VALUES('igh0510','123456');


-- 4번 데이터 선택(필드명을 변경하여 '회원번호' 내림차순 정렬로 출력)
SELECT member_num AS 회원번호, member_id AS 회원아이디, member_pass AS 패스워드
FROM login_info
ORDER BY 회원번호 DESC;

-- 5번 notice 테이블 생성
CREATE TABLE  notice(
	notice_num INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- 자동입력되는 정수형 기본키
    notice_tit VARCHAR(40) NOT NULL,
    notice_txt VARCHAR(1000),
    notice_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 자동입력되는 날짜
    user_name VARCHAR(30),
    user_num INT NOT NULL
);

-- 6번 자료입력 (20건의 자료 입력)
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항1','동해물과 백두산이 마르고','홍길동',1);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항2','동해물과 백두산이 마르고','고길동',2);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항3','동해물과 백두산이 마르고','박길동',3);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항4','동해물과 백두산이 마르고','곽길동',4);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항5','동해물과 백두산이 마르고','귉길동',5);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항6','동해물과 백두산이 마르고','둵길동',6);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항7','동해물과 백두산이 마르고','빡길동',7);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항8','동해물과 백두산이 마르고','뽱길동',8);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항9','동해물과 백두산이 마르고','뿡길동',9);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항10','동해물과 백두산이 마르고','삥길동',10);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항11','동해물과 백두산이 마르고','뀨길동',11);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항12','동해물과 백두산이 마르고','냥길동',12);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항13','동해물과 백두산이 마르고','멍길동',13);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항14','동해물과 백두산이 마르고','왕길동',14);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항15','동해물과 백두산이 마르고','헿길동',15);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항16','동해물과 백두산이 마르고','힣길동',16);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항17','동해물과 백두산이 마르고','훟길동',17);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항18','동해물과 백두산이 마르고','켁길동',18);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항19','동해물과 백두산이 마르고','뫌길동',19);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num)
			values('문의사항20','동해물과 백두산이 마르고','멝길동',20);
            
-- 7번 데이터 선택(필드명을 변경하여 '작성일' 오름차순, '일련번호' 내림차순 정렬로 출력)
SELECT
	notice_num AS 일련번호,
	notice_tit AS 제목, 
    notice_txt AS 내용, 
    notice_date AS 작성일,
	user_name AS 작성자, 
    user_num AS 회원번호
FROM notice
ORDER BY 작성일 ASC,
	     일련번호 DESC;

-- 8번 함수,조건 사용 사용(성별로 인원수)
SELECT SUBSTR(user_name,1,1) AS 성,CONCAT(count(*),'명') AS 인원수
FROM notice
GROUP BY SUBSTR(user_name,1,1);

-- 9번 자료삭제(제목이 없는 자료 삭제)
DELETE FROM notice
WHERE notice_tit IS NULL;

-- 10번 자료변경
UPDATE login_info
SET member_pass='qwer1234'
WHERE member_num=5;

-- 11번 인덱스 인덱스 설정
CREATE INDEX idx_notice ON notice(notice_tit,user_name);

-- 12번 인덱스 검증
SELECT * FROM notice WHERE user_num>=5; -- query cost : 2.25, rows: 20
SELECT * FROM notice WHERE notice_tit='문의사항5';-- query cost :0.35, rows:1
SELECT * FROM notice WHERE user_name='뀨길동';
SELECT * FROM notice WHERE notice_num<=10 AND notice_tit>='문의사항5';

-- 13번 뷰생성
CREATE VIEW my_view(
	회원아이디,
    제목,
    내용,
    작성일,
    작성자
)
AS SELECT 
		notice.user_num,
		notice.notice_tit,
        notice.notice_txt,
        notice.notice_date,
        notice.user_name
FROM notice JOIN login_info ON notice.user_num = login_info.member_num;
SELECT * FROM my_view;

-- 14번 뷰2 생성
CREATE VIEW my_view2(
	제목,
    작성일,
    작성자,
    회원아이디
)
AS SELECT 제목,작성일,작성자,회원아이디
FROM my_view;
SELECT * FROM my_view2;
/*-- 이건 왜 안되지
INSERT INTO my_view2 VALUES('제목'1,'이이가','가각','OEJSDJUF');
*/
DELETE FROM my_view2 WHERE 작성자='박길동';

-- 15번 DB,USER 삭제
DROP DATABASE IF EXISTS member_db; -- 기존의 db 삭제
DROP USER IF EXISTS member_db@localhost; -- 기존의 user 삭제