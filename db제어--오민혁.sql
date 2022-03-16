-- -------------------------------------------------
-- 	권한설정
-- -------------------------------------------------
CREATE USER  igh05001@localhost IDENTIFIED WITH mysql_native_password BY  'qwer1234!';
GRANT ALL PRIVILEGES ON 도서관리_DB.* TO igh05001@localhost WITH GRANT OPTION;


