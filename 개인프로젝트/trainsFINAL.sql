------------���̺� ���� -----------------------
CREATE TABLE trains (
    tr_num           VARCHAR2(100) PRIMARY KEY,
    tr_name         VARCHAR2(100) NOT NULL,
    tr_depart         VARCHAR2(100),
    tr_destin          VARCHAR2(100),
    tr_time             VARCHAR2(20),
    tr_seat             NUMBER(2));
    
    CREATE TABLE USERS (
    user_id         VARCHAR2(100) PRIMARY KEY,
    user_pw            VARCHAR2(100),
    user_name         VARCHAR2(100),
    user_phone         VARCHAR2(100));
    
     CREATE TABLE booking (
   booking_id         VARCHAR2(100),
   booking_train    VARCHAR2(100),
   tk_amount        NUMBER,
   booking_name VARCHAR(2));
   
---------------------���̺� �߰� ���� ����---------------------------------   

ALTER TABLE trains
MODIFY tr_time VARCHAR2(20);

ALTER TABLE USERS
ADD PRIMARY KEY (user_id);

ALTER TABLE trains
ADD PRIMARY KEY (tr_num);

ALTER TABLE BOOKING
ADD CONSTRAINT user_name FOREIGN KEY (booking_name)
REFERENCES USERS (user_name);

ALTER TABLE BOOKING
ADD  BOOKING_NAME VARCHAR2(100);

ALTER TABLE booking
add  tk_amount number;
ALTER TABLE USERS 
ADD TR_TOTAKE VARCHAR2(100);

DELETE 
FROM booking
WHERE booking_name is null;

-------------------Trains ���̺� ������ �߰�-------------

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('1010','������ȣ','����','�λ�','13:05',50);
INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('2020','������ȣ','�뱸','����','07:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('3045','������ȣ','����','�뱸','15:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('5030','������ȣ','����','��õ','14:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('7011','��¡��ȣ','�λ�','�뱸','17:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('3733','����ȣ','����','����','20:00',0);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('3966','����ȣ','����','�λ�','20:00',20);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('9966','����ȣ','����','����','18:00',50);

---------users ���̺� ���� �߰� -------------------------------
INSERT INTO users (user_id,user_pw,user_name, user_phone)
VALUES('rkawk01','12345','�հ���','010-1212-1212');

-------------���̺� ���� ���� --------

SELECT *
FROM trains;
    
select *
from booking;

SELECT *
FROM USERS;

----------------------����������Ʈ�� ����-------------------

 --1�� ������ȸ 
 --�����뼱 Ȯ�ο� ��� ��ȸ 
 SELECT *
FROM TRAINS
WHERE TR_DEPART = '����'
AND TR_DESTIN = '�λ�'
ORDER BY TR_TIME;

--���� ��ü ��� ��ȸ 
SELECT tr_num, tr_name,tr_time, tr_seat 
FROM trains 
WHERE tr_depart ='����'
AND tr_destin = '�λ�'
ORDER BY TR_TIME;


--2�� �ܿ� �¼� ��ȸ
SELECT tr_seat
FROM trains
WHERE tr_num = ' ';
                
--�¼� ���� �� ��ŭ ���̱�    (�������)                  
UPDATE trains 
SET tr_seat =(SELECT t.tr_seat - (b.tk_amount), TR_NUM
                    FROM trains t, booking b
                    where tr_num = booking_train
                    AND tr_num = '1010');

--3-1) ����� ��� 
--booking ���̺� ����---

insert into booking
values ('rhrnak01','7011',2,'����');

--���̵� �ߺ� ���� ������ ���� 

SELECT *
FROM USERS
WHERE USER_ID = 'rhrnak01'
AND USER_PW = '12345';

--ȸ������
INSERT INTO users (user_id, user_pw, user_name, user_phone)
VALUES ('ekdrms02','12345','�����','010-3434-3434');

--3-2) �α��� 

SELECT *
FROM USERS
WHERE USER_ID = 'rhrnak01'
AND USER_PW = '12345';


--3-2)����
--���� ���� ���� ���� Ȯ�� �� ����
SELECT * 
FROM trains 
WHERE tr_num = '1010';

--3-2) �α��� �� ���� �߰� 
INSERT INTO booking
VALUES('ekdrms02','1010',2,'�����');

--���̺� ���� (�����ڸ�, ������ȣ)
SELECT b.booking_train,b.booking_name
FROM trains t, users u , booking b
WHERE u.user_id = b.booking_id
AND t.tr_num = b.booking_train;

--4) ���� ��ȸ  

--����� ���� ��� Ȯ�� 
select *
from booking
where booking_id ='ekdrms02' ;

--������ȸ�� ���� 
SELECT t.tr_num,t.tr_name,b.booking_name,t.tr_time  
FROM users u,trains t,booking b   
WHERE t.tr_num = b.booking_train   
AND u.user_name = b.booking_name 
AND U.USER_ID = 'qkrdPeka'
ORDER BY T.TR_TIME;

--5)������� (����) 
DELETE 
FROM booking
WHERE booking_train = '1010'
AND booking_id = 'rhrnak03';

