DROP DATABASE IF EXISTS 학교;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 학교
-- -----------------------------------------------------
-- 학교종이 땡땡땡

-- -----------------------------------------------------
-- Schema 학교
--
-- 학교종이 땡땡땡
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `학교` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `학교` ;

-- -----------------------------------------------------
-- Table `학교`.`학생`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학교`.`학생` (
  `학번` VARCHAR(10) NOT NULL,
  `성명` VARCHAR(20) NULL,
  PRIMARY KEY (`학번`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `학교`.`연락처`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학교`.`연락처` (
  전화번호 VARCHAR(20) NULL,
  주소 VARCHAR(45) NULL,
  학번 VARCHAR(10) NULL,
    FOREIGN KEY (`학생_학번`)
    REFERENCES `학교`.`학생` (`학번`));


-- -----------------------------------------------------
-- Table `학교`.`성별`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `학교`.`성별` (
  `성별` ENUM('남', '여') NULL,
  `학생_학번` VARCHAR(10) NULL,
  INDEX `fk_성별_학생1_idx` (`학생_학번` ASC) VISIBLE,
  CONSTRAINT `fk_성별_학생1`
    FOREIGN KEY (`학생_학번`)
    REFERENCES `학교`.`학생` (`학번`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO 학생 VALUES('101','홍길동');
INSERT INTO 학생 VALUES('102','이몽룡');
INSERT INTO 학생 VALUES('103','성춘향');
INSERT INTO 학생 VALUES('104','월매');
INSERT INTO 학생 VALUES('105','변사또');

INSERT INTO 성별 VALUES('남','101');
INSERT INTO 성별 VALUES('여','104');
INSERT INTO 성별 VALUES('남','105');
INSERT INTO 성별 VALUES('남','106');

INSERT INTO 연락처 VALUES('1111111','부천','101');
INSERT INTO 연락처 VALUES(NULL,'인천','104');
INSERT INTO 연락처 VALUES('2222222','서울','105');
INSERT INTO 연락처 VALUES('3333333','부천','104');

SELECT  A.학번 학번,A.성명 성명,B.성별 성별, C.전화번호 전화번호
FROM 학생 A JOIN 성별 B ON A.학번=B.학번 JOIN 연락처 C ON A.학번=C.학번;
