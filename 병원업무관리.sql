-- ----------------------------------------------------------
-- 								병원업무관리 프로젝트
-- ---------------------------------------------------------- 

-- ----------------------------------------------------------
-- 								DB초기화
-- ---------------------------------------------------------- 
DROP DATABASE IF EXISTS 병원업무관리_DB;
DROP USER IF EXISTS igh05001@localhost;
CREATE DATABASE 병원업무관리_DB;
CREATE USER igh05001@localhost IDENTIFIED WITH mysql_native_password BY 'qwer1234!';
GRANT ALL PRIVILEGES ON 병원업무관리_DB.* TO igh05001@localhost WITH GRANT OPTION;

USE 병원업무관리_DB;

CREATE TABLE 의사(
	의사ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    담당진료과목 VARCHAR(20) NOT NULL,
    성명 VARCHAR(20) NOT NULL,
    성별 VARCHAR(10) NOT NULL,
    연락처 VARCHAR(20) NOT NULL UNIQUE,
    이메일 VARCHAR(20) UNIQUE,
    직급 VARCHAR(10)
);
-- ----------------------------------------------------------
-- 								간호사 테이블 정의
-- ---------------------------------------------------------- 
CREATE TABLE 간호사(
	간호사ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    담당업무 VARCHAR(40) NOT NULL,
    성명 VARCHAR(20) NOT NULL,
    성별 VARCHAR(10) NOT NULL,
    이메일 VARCHAR(20) NOT NULL,
    직급 VARCHAR(10) NOT NULL
);


-- ----------------------------------------------------------
-- 								환자 테이블 정의
-- ---------------------------------------------------------- 
CREATE TABLE 환자(
	환자ID VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    환자성명 VARCHAR(20) NOT NULL,
    주민번호 VARCHAR(14) NOT NULL UNIQUE,
    성별 VARCHAR(20) NOT NULL,
    주소 VARCHAR(50) NOT NULL,
    연락처 VARCHAR(20) NOT NULL,
    이메일 VARCHAR(20) UNIQUE,
    직업 VARCHAR(20) NOT NULL,
    담당의사ID VARCHAR(10) ,
    담당간호사ID VARCHAR(10),
    FOREIGN KEY (담당의사ID) REFERENCES 의사(의사ID),
    FOREIGN KEY (담당간호사ID) REFERENCES 간호사(간호사ID)
);



-- ----------------------------------------------------------
-- 								진료 테이블 정의
-- ----------------------------------------------------------
CREATE TABLE 진료(
	진료ID INT NOT NULL UNIQUE,
    의사ID VARCHAR(10) NOT NULL,
    환자ID VARCHAR(10) NOT NULL,
    진료내용 VARCHAR(100) NOT NULL,
    진료날짜 DATE NOT NULL,
    PRIMARY KEY (진료ID,의사ID,환자ID),
    FOREIGN KEY (의사ID) REFERENCES 의사(의사ID),
    FOREIGN KEY (환자ID) REFERENCES 환자(환자ID)
);

INSERT INTO 의사 VALUES('1001','흉부외과','이태영', '남','010-1111-1111','igh0502@naver.com','원장');
INSERT INTO 의사 VALUES('1002','일반외과','김민성', '여','010-1111-1112','igh0503@naver.com','전문하사');
INSERT INTO 의사 VALUES('1003','호흡기내과','오선기', '남','010-1111-1113','igh0504@naver.com','대리');
INSERT INTO 의사 VALUES('1004','소화기내과','조민혁', '여','010-1111-1114','igh0505@naver.com','과장');
INSERT INTO 의사 VALUES('1005','소화전내과','델리만쥬', '남','010-1111-1115','igh0506@naver.com','차장');
-- 간호사 자료 삽입
INSERT INTO 간호사 VALUES('2001','우크라이나','김선기','여','kimch@naver.com','테란-주임원사');
INSERT INTO 간호사 VALUES('2002','외래','조태영','남','kimch1@naver.com','저그-오버로드');
INSERT INTO 간호사 VALUES('2003','병실','오민성','남','kimch2@naver.com','프로토스-포톤캐논');
INSERT INTO 간호사 VALUES('2004','병실','이민혁','여','kimch3@naver.com','테란-시즈탱크');
INSERT INTO 간호사 VALUES('2005','응급실','김이박','여','kimch4@naver.com','중립-시민');
-- 환자 자료 삽입
INSERT INTO 환자 VALUES('3001','조민성','980903-1234567','남','전주 백마원룸 딱대라','011-111-1111',null,'된장 소믈리에','1001','2001');
INSERT INTO 환자 VALUES('3002','이승만','980904-1234567','여','전주 백마원룸옆집','011-111-1112',null,'기호2번','1002','2003');
INSERT INTO 환자 VALUES('3003','윤보선','980905-1234567','여','전주 백마원룸 앞 붕어빵집','011-311-1111',null,'123','1004','2005');
INSERT INTO 환자 VALUES('3004','박정희','980906-1234567','남','전주 백마원룸 인삼밭 비닐속','014-111-1111',null,'4213','1001','2002');
INSERT INTO 환자 VALUES('3005','최규하','980907-1234567','여','전주 백마원룸 기둥뒤 공간','011-511-1111',null,'#@!@!','1003','2004');
INSERT INTO 환자 VALUES('3006','전두환','980908-1234567','남','전주 백마원룸1','011-111-1116',null,'된장 소믈리에','1004','2001');
INSERT INTO 환자 VALUES('3007','노태우','980909-1234567','여','전주 백마원룸2','011-111-1117',null,'된장 소믈리에','1004','2001');
INSERT INTO 환자 VALUES('3008','김영삼','980910-1234567','여','전주 백마원룸3','011-111-1118',null,'된장 소믈리에','1004','2004');
INSERT INTO 환자 VALUES('3009','김대중','980911-1234567','여','전주 백마원룸4','011-111-1119',null,'된장 소믈리에','1003','2003');
INSERT INTO 환자 VALUES('3010','노무현','980912-1234567','남','전주 백마원룸5','011-111-1101',null,'된장 소믈리에','1003','2002');

-- 진료 자료 삽입
INSERT INTO 진료 VALUES('2201001','1001','3001','된장먹다가 체함','2022-01-02');
INSERT INTO 진료 VALUES('2201002','1001','3002','체하다가 된장먹음','2022-01-02');
INSERT INTO 진료 VALUES('2201003','1002','3003','술마시고 전봇대랑싸움','2022-01-02');
INSERT INTO 진료 VALUES('2201004','1002','3004','술마시고 방지턱이랑싸움','2022-01-02');
INSERT INTO 진료 VALUES('2201005','1001','3005','술마시고 방지턱이랑대화','2022-01-02');
INSERT INTO 진료 VALUES('2201006','1002','3006','술마시고 전봇대랑대화','2022-01-02');
INSERT INTO 진료 VALUES('2201007','1002','3007','전봇대랑싸우고 술마심','2022-01-02');
INSERT INTO 진료 VALUES('2201008','1003','3008','방지턱이랑싸우고 술마심','2022-01-03');
INSERT INTO 진료 VALUES('2201009','1004','3009','방지턱이랑술마시고 싸움','2022-01-04');

DESC 의사;
DESC 간호사;
DESC 환자;
DESC 진료;

SELECT 의사.성명,환자.환자성명,진료.진료날짜,진료.진료내용
FROM 의사 JOIN 환자 ON 의사.의사ID=환자.의사ID JOIN 진료 ON 진료.의사ID=의사.의사ID;