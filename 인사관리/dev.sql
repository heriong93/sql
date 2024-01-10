SELECT * 
FROM tab;

CREATE TABLE student (
stu_num             VARCHAR2(10) PRIMARY KEY,
stu_name           VARCHAR2(100) NOT NULL,
eng_score          NUMBER DEFAULT 80,
math_score        NUMBER DEFAULT 70 );

SELECT *
FROM student
order by stu_num;
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

--------------------12/26
SELECT *
FROM tab;

select *
from member;

alter table member add image varchar2(100);

CREATE TABLE member (
id varchar2(20) primary key,
pw varchar2(10) not null,
name varchar2(100) not null,
responsibility varchar2(10) DEFAULT 'user'); -- ADMIN/ USER 구분

DELETE FROM member
WHERE responsibility = 'User1';
INSERT INTO member values('user1', '1111', '홍길동', 'User');

INSERT INTO member values('user2', '2222', '김철수', 'User');

INSERT INTO member values('user3', '3333', '관리자', 'Admin');
----------------------------------------------

create table product (
 product_code char(8) primary key, -- P2023-01
 product_name varchar2(100) not null,
 product_desc varchar2(300) not null,
 origin_price number not null,
 sale_price number,
 like_it number default 3, --추천수
 image varchar2(30)
);


select *
from product;

insert into product values('P2023-01', '과테말라 안티구아', '과테말라산 원두입니다.', 5000, 4500, 5, '과테말라.jpg');

insert into product values('P2023-02', '니카라구아 아라비카', '니카라구아 더치커피입니다.', 5000, 4500, 4, '니카라구아 더치.jpg');

insert into product values('P2023-03', '브라질 산토스', '브라질 산토스 맛있는 커피입니다.', 6000, 5000, 5, '브라질산토스.jpg');

insert into product values('P2023-04', '에티오피아 예가체프', '제가 가장 좋아하는 커피입니다.', 4000, 3500, 5, '예가체프.jpg');

insert into product values('P2023-05', '케냐 오크라톡신', '케냐에서 온 톡 쏘는 원두입니다.', 4500, 3000, 5, '케냐 오크라톡신.jpg');

insert into product values('P2023-06', '코스타리카 따라주', '따라할 수 없는 맛의 원두입니다.', 3000, 2500, 3, '코스타리카 따라주.jpg');

-------------------------------------------------------------------------------------
create table books (
 book_code varchar2(10) primary key,
 book_name varchar2(100) not null,
 book_author varchar2(100) not null,
 book_press varchar2(100) not null,
 book_price number not null
);

insert into books values('B001','자바는 재밌다','김자바','잡플레닛',20000);


insert into books values('B002','코딩은 어려운 것','박혼란','개발자월드',15000);

insert into books values('B003','오늘은 뭐먹지','홍버거','맛있는출판사',25000);

insert into books values('B004','큰게 다가온다','이예담','모두한마음',23000);

SELECT * 
FROM BOOKS
order by 1;