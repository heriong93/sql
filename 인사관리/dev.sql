SELECT * 
FROM tab;

CREATE TABLE student (
stu_num             VARCHAR2(10) PRIMARY KEY,
stu_name           VARCHAR2(100) NOT NULL,
eng_score          NUMBER DEFAULT 80,
math_score        NUMBER DEFAULT 70 );

SELECT *
FROM student;
--등록, 수정, 삭제, 단건조회, 목록 
INSERT INTO student (stu_num, stu_name, eng_score, math_score)
VALUES ('23-001', '홍길동', 70,85);
--값 입력
INSERT INTO student (stu_num, stu_name)
VALUES ('23-002', '김민수');
--수정
UPDATE student
SET eng_score = 85, 
        math_score = 75
WHERE stu_num = '23-001';
--삭제 
DELETE FROM student 
WHERE stu_num ='23-002';
--단건조회 
SELECT *
FROM student
WHERE stu_num = '23-001';

--JDBC 위치 : C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
--ojdbc6_g 를 JAVA 폴더에 복사 
-- ECLIPSE > PACKAGE MANAGER > HGJAVA 오른쪽 마우스 > CREATE BUILD PATH > CLASSPATH 추가 
INSERT INTO student (stu_num, stu_name)
VALUES ('23-008', '김민수');

INSERT INTO student (stu_num, stu_name)
VALUES ('23-007', '김민수');

DELETE FROM student
WHERE stu_name = ' ';

------book table -----
CREATE TABLE book (
book_num             VARCHAR2(10) PRIMARY KEY,
book_name           VARCHAR2(100),
book_auth             VARCHAR2(100),
book_comp            VARCHAR2(100),
book_price             NUMBER);

SELECT *
FROM book;
--등록, 수정, 삭제, 단건조회, 목록 
INSERT INTO book (book_num,book_name, book_auth, book_comp, book_price)
VALUES ('23-001','자바','김철수','오라클',20000);
--값 입력
INSERT INTO book (book_num,book_name)
VALUES ('23-002','sql');

--수정
UPDATE book
SET book_price =15000 
WHERE book_num = '23-002';
--삭제 

DELETE FROM book 
WHERE book_num =' ';
--단건조회 
SELECT *
FROM book
WHERE book_num = ' ';

---------------------------1222
CREATE TABLE board (
board_no    number PRIMARY KEY,
title             varchar2(100) NOT NULL, 
content     varchar2(500) NOT NULL,
writer          VARCHAR2(50) NOT NULL,
write_date  DATE DEFAULT sysdate,
click_cnt     NUMBER DEFAULT 0,
image         VARCHAR2(100));

CREATE SEQUENCE board_seq;

INSERT INTO board(board_no,title, writer, content)
VALUES (board_seq.nextval, '첫번째 글', '홍길동', 'JSP 열심히 공부하자');

INSERT INTO board(board_no,title, writer, content)
VALUES (board_seq.nextval, '오늘은 금요일', '김박사', '불코딩하자');

INSERT INTO board(board_no,title, writer, content)
VALUES (board_seq.nextval, '우리반 화이팅!', '김막내', '열심히 공부해요');

SELECT * 
FROM board
ORDER BY 1;