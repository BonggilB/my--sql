DROP DATABASE IF EXISTS school_db;
DROP USER IF EXISTS school_db@localhost;
CREATE DATABASE school_db;
CREATE USER school_db@localhost IDENTIFIED WITH mysql_native_password BY 'school_db';
GRANT ALL PRIVILEGES ON school_db.* TO school_db@localhost WITH GRANT OPTION;
USE school_db;
/* 안됨
CREATE TABLE 학생 (
	학번 VARCHAR(10),
    성명 VARCHAR(20),
    성별 ENUM('남','여'),
	생년월일 DATE,
    주소 VARCHAR(50),
    전화번호 VARCHAR(20),
	학과 VARCHAR(20),
    수강과목1 VARCHAR(20),
    수강과목2 VARCHAR(20),
    수강과목3 VARCHAR(20),
    수강과목4 VARCHAR(20),
    수강과목5 VARCHAR(20)
);
INSERT INTO 학생 VALUES('20220101','홍길동','남','2000-01-01','경기도 부천시','010-1111-1111','국어','영어','음악','체육','컴공');
INSERT INTO 학생 VALUES('20220102','김길동','남','1999-01-01','경기도 보충시','010-1111-1112','국어','영어','음악','체육','컴공');
INSERT INTO 학생 VALUES('20220103','박길동','남','2002-01-01','경기도 몇시','010-1111-1113','국어','영어','음악','체육','컴공');
INSERT INTO 학생 VALUES('20220104','이길동','남','2004-01-01','경기도 두시','010-1111-1114','국어','영어','음악','체육','컴공');
INSERT INTO 학생 VALUES('20220105','장길동','남','2005-01-01','경기도 홍시','010-1111-1115','국어','영어','음악','체육','컴공');
DELETE FROM 학생 WHERE 성명='홍길동';
-- SELECT * FROM 학생;
INSERT INTO 학생 VALUES('20220106','이몽룡','남','2000-01-01','서울시 구로구','010-777-7777',null,null,null,null,null);
UPDATE 학생 SET 주소='경기도 광명시' WHERE 성명='이몽룡';
-- SELECT * FROM 학생;
*/

/*요긴 잠시 주석 잘됨
CREATE TABLE 인적사항(
	학번 VARCHAR(10) PRIMARY KEY NOT NULL UNIQUE,
    성명 VARCHAR(10) NOT NULL,
    성별 VARCHAR(10) NOT NULL,
    주소 VARCHAR(100),
    전화번호 VARCHAR(20)
);
-- 개체 무결성 - 기본키 NOT NULL이고 중복 불가능
CREATE TABLE 수강과목(
	수강과목1 VARCHAR(20),
    수강과목2 VARCHAR(20),
    수강과목3 VARCHAR(20),
    수강과목4 VARCHAR(20),
    수강과목5 VARCHAR(20),
    학번 VARCHAR(20),
    FOREIGN KEY (학번) REFERENCES 인적사항
);
-- 참조무결성 - 외래키 값은 null이거나 참조 릴레이션의 기본키값과 일치
INSERT INTO 인적사항 VALUES('101','홍길동','남','서울시','111111');
INSERT INTO 인적사항 VALUES('102','이몽룡','남','서울시','222222');
INSERT INTO 인적사항 VALUES('103','성춘향','여','인천시','333333');
INSERT INTO 인적사항 VALUES('104','월매','여','부산시','444444');
INSERT INTO 인적사항 VALUES('105','변사또','남','경기도','555555');
INSERT INTO 인적사항 VALUES('201','변사또','남','대구시','666666');


INSERT INTO 수강과목 VALUES('국어','영어','수학','과학','사회','101');
INSERT INTO 수강과목 VALUES('국어','영어','수학','과학','사회','102');
INSERT INTO 수강과목 VALUES('국어','영어','수학','과학','사회','103');
INSERT INTO 수강과목 VALUES('국어','영어','수학','과학','사회','104');
INSERT INTO 수강과목 VALUES('국어','영어','수학','과학','사회','105');
INSERT INTO 수강과목 VALUES('KOOK','YOUNG','SOO','GWA','SA','NULL'); -- 존재해서는 안됨
-- 참조무결성 - 외래키 값은 null이거나 참조 릴레이션의 기본키값과 일치

SELECT * FROM 인적사항,수강과목 WHERE 인적사항.학번 = 수강과목.학번;
*/



CREATE TABLE 학생_INFO(
	학번 VARCHAR(10) PRIMARY KEY,
    성명 VARCHAR(20)
);
CREATE TABLE 연락처(
	전화번호 VARCHAR(20),
    주소 VARCHAR(100),
    학번 INT,
    FOREIGN KEY(학번) REFERENCES 학생_INFO(학번)
);
CREATE TABLE 성별(
	성별 ENUM('남','여'),
    학번 VARCHAR(10),
    FOREIGN KEY (학번) REFERENCES 연락처(학번)
);