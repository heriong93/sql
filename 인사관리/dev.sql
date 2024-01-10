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
--���, ����, ����, �ܰ���ȸ, ��� 
INSERT INTO student (stu_num, stu_name, eng_score, math_score)
VALUES ('23-001', 'ȫ�浿', 70,85);
--�� �Է�
INSERT INTO student (stu_num, stu_name)
VALUES ('23-002', '��μ�');
--����
UPDATE student
SET eng_score = 85, 
        math_score = 75
WHERE stu_num = '23-001';
--���� 
DELETE FROM student 
WHERE stu_num ='23-002';
--�ܰ���ȸ 
SELECT *
FROM student
WHERE stu_num = '23-001';

--JDBC ��ġ : C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
--ojdbc6_g �� JAVA ������ ���� 
-- ECLIPSE > PACKAGE MANAGER > HGJAVA ������ ���콺 > CREATE BUILD PATH > CLASSPATH �߰� 
INSERT INTO student (stu_num, stu_name)
VALUES ('23-008', '��μ�');

INSERT INTO student (stu_num, stu_name)
VALUES ('23-007', '��μ�');

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
--���, ����, ����, �ܰ���ȸ, ��� 
INSERT INTO book (book_num,book_name, book_auth, book_comp, book_price)
VALUES ('23-001','�ڹ�','��ö��','����Ŭ',20000);
--�� �Է�
INSERT INTO book (book_num,book_name)
VALUES ('23-002','sql');

--����
UPDATE book
SET book_price =15000 
WHERE book_num = '23-002';
--���� 

DELETE FROM book 
WHERE book_num =' ';
--�ܰ���ȸ 
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
VALUES (board_seq.nextval, 'ù��° ��', 'ȫ�浿', 'JSP ������ ��������');

INSERT INTO board(board_no,title, writer, content)
VALUES (board_seq.nextval, '������ �ݿ���', '��ڻ�', '���ڵ�����');

INSERT INTO board(board_no,title, writer, content)
VALUES (board_seq.nextval, '�츮�� ȭ����!', '�踷��', '������ �����ؿ�');

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
responsibility varchar2(10) DEFAULT 'user'); -- ADMIN/ USER ����

DELETE FROM member
WHERE responsibility = 'User1';
INSERT INTO member values('user1', '1111', 'ȫ�浿', 'User');

INSERT INTO member values('user2', '2222', '��ö��', 'User');

INSERT INTO member values('user3', '3333', '������', 'Admin');
----------------------------------------------

create table product (
 product_code char(8) primary key, -- P2023-01
 product_name varchar2(100) not null,
 product_desc varchar2(300) not null,
 origin_price number not null,
 sale_price number,
 like_it number default 3, --��õ��
 image varchar2(30)
);


select *
from product;

insert into product values('P2023-01', '���׸��� ��Ƽ����', '���׸���� �����Դϴ�.', 5000, 4500, 5, '���׸���.jpg');

insert into product values('P2023-02', '��ī�󱸾� �ƶ��ī', '��ī�󱸾� ��ġĿ���Դϴ�.', 5000, 4500, 4, '��ī�󱸾� ��ġ.jpg');

insert into product values('P2023-03', '����� ���佺', '����� ���佺 ���ִ� Ŀ���Դϴ�.', 6000, 5000, 5, '��������佺.jpg');

insert into product values('P2023-04', '��Ƽ���Ǿ� ����ü��', '���� ���� �����ϴ� Ŀ���Դϴ�.', 4000, 3500, 5, '����ü��.jpg');

insert into product values('P2023-05', '�ɳ� ��ũ�����', '�ɳĿ��� �� �� ��� �����Դϴ�.', 4500, 3000, 5, '�ɳ� ��ũ�����.jpg');

insert into product values('P2023-06', '�ڽ�Ÿ��ī ������', '������ �� ���� ���� �����Դϴ�.', 3000, 2500, 3, '�ڽ�Ÿ��ī ������.jpg');

-------------------------------------------------------------------------------------
create table books (
 book_code varchar2(10) primary key,
 book_name varchar2(100) not null,
 book_author varchar2(100) not null,
 book_press varchar2(100) not null,
 book_price number not null
);

insert into books values('B001','�ڹٴ� ��մ�','���ڹ�','���÷���',20000);


insert into books values('B002','�ڵ��� ����� ��','��ȥ��','�����ڿ���',15000);

insert into books values('B003','������ ������','ȫ����','���ִ����ǻ�',25000);

insert into books values('B004','ū�� �ٰ��´�','�̿���','����Ѹ���',23000);

SELECT * 
FROM BOOKS
order by 1;