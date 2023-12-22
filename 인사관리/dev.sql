SELECT * 
FROM tab;

CREATE TABLE student (
stu_num             VARCHAR2(10) PRIMARY KEY,
stu_name           VARCHAR2(100) NOT NULL,
eng_score          NUMBER DEFAULT 80,
math_score        NUMBER DEFAULT 70 );

SELECT *
FROM student;
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