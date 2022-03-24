-- 1번
DROP DATABASE IF EXISTS member_db; -- 기존의 db 삭제
DROP USER IF EXISTS member_db@localhost;  -- 기존의 user 삭제
CREATE DATABASE member_db; -- member_db 생성
CREATE USER member_db@localhost IDENTIFIED WITH mysql_native_password BY 'member_db'; -- 계정 생성
GRANT ALL PRIVILEGES ON member_db.* TO member_db@localhost; -- user의 db권한 부여
USE member_db; -- db change

-- 2번 login_info 테이블 생성
CREATE TABLE login_info(
	member_num INT PRIMARY KEY AUTO_INCREMENT, -- 정수형의 자동입력되는 기본키
    member_id VARCHAR(18) NOT NULL UNIQUE, -- 중복되지 않은 필수 문자열
    member_pass VARCHAR(18) NOT NULL -- 필수 문자열
);

-- 3번 자료입력
INSERT INTO login_info(member_id,member_pass) 
		        VALUES('pam7461','123456'); -- 아이디가 중복되지 않는 자료 입력
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7462','123456'); -- member_num은 자동입력
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7463','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7464','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7465','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7466','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7467','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7468','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7469','123456');
INSERT INTO login_info(member_id,member_pass) 
                VALUES('pam7470','123456');

-- 4번 데이터 선택(필드명을 변경하여 '회원번호' 내림차순 정렬로 출력)
SELECT member_num as 회원번호, member_id as 회원아이디, member_pass as 패스워드
FROM login_info
ORDER BY 회원번호 DESC;

-- 5번 notice 테이블 생성
CREATE TABLE notice(
	notice_num INT PRIMARY KEY NOT NULL AUTO_INCREMENT, -- 자동입력되는 정수형 기본키
    notice_tit VARCHAR(40) NOT NULL,
    notice_txt VARCHAR(1000),
    notice_date DATETIME DEFAULT CURRENT_TIMESTAMP,-- 자동입력되는 날짜
    user_name VARCHAR(30),
    user_num INT NOT NULL
);

-- 6번 자료입력(20건의 자료 입력)
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항1','1동해물과 백두산아 마르고','홍길동',1);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항2','2동해물과 백두산아 마르고','이몽룡',2);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항3','3동해물과 백두산아 마르고','성춘향',3);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항4','4동해물과 백두산아 마르고','김사또',4);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항5','5동해물과 백두산아 마르고','홍길순',5);            
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항6','6동해물과 백두산아 마르고','이승만',6);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항7','7동해물과 백두산아 마르고','박정희',7);            
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항8','8동해물과 백두산아 마르고','이순신',8);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항9','9동해물과 백두산아 마르고','김길동',10);            
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항10','10동해물과 백두산아 마르고','김사부',15);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항11','11동해물과 백두산아 마르고','박혁거세',10);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항12','12동해물과 백두산아 마르고','박목월',9);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항13','13동해물과 백두산아 마르고','정주영',8);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항14','14동해물과 백두산아 마르고','정몽주',8);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항15','15동해물과 백두산아 마르고','최치원',6);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항16','16동해물과 백두산아 마르고','조치원',8);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항17','17동해물과 백두산아 마르고','가가린',2);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항18','18동해물과 백두산아 마르고','윤봉길',3);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항19','19동해물과 백두산아 마르고','이명박',1);
INSERT INTO notice(notice_tit,notice_txt,user_name,user_num) 
            values('문의사항20','20동해물과 백두산아 마르고','박근혜',1);            
        

-- 7번 데이터 선택(필드명을 변경하여 '작성일' 오름차순, '일련번호' 내림차순 정렬 출력)
SELECT 
	notice_num as 일련번호, 
	notice_tit as 제목, 
    notice_txt as 내용, 
    notice_date as 작성일, 
    user_name as 작성자, 
    user_num as 회원번호
FROM 
    notice
ORDER BY 작성일 asc,
         일련번호 desc;
         
-- 8번 함수,조건 사용(성별로 인원수)
SELECT SUBSTR(user_name,1,1) as 성,CONCAT(COUNT(*),'명') as 인원수
FROM notice
-- WHERE SUBSTR(user_name,1,1)='조'
GROUP BY SUBSTR(user_name,1,1);

-- 9번 자료삭제(제목이 없는 자료 삭제)
DELETE FROM notice 
WHERE notice_tit IS NULL;


-- 10번 자료변경
UPDATE login_info
SET member_pass='qwer1234'
WHERE member_num=5;

-- 11번 인덱스 설정
CREATE INDEX idx_notice ON notice(notice_tit,user_name);

-- 12번 인덱스 검증
SELECT * FROM notice WHERE user_num>=5;-- query cost : 2.25, rows:20
SELECT * FROM notice WHERE notice_tit='문의사항5';-- query cost : 0.35, rows:1
SELECT * FROM notice WHERE user_name='이순신';-- query cost : 2.25, rows:20

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
CREATE VIEW my_view2(제목,작성일,작성자,회원아이디)
AS SELECT 제목,작성일,작성자,회원아이디
FROM my_view;
SELECT * FROM my_view2;

-- 15번 DB,USER 삭제
 DROP DATABASE IF EXISTS member_db; -- 기존의 db 삭제
 DROP USER IF EXISTS member_db@localhost;  -- 기존의 user 삭제
 -- REVOKE ALL ON member_db.* from member_db@localhost;






