------------���̺� ���� -----------------------
CREATE TABLE trains (
    tr_num           VARCHAR2(100),
    tr_name         VARCHAR2(100) NOT NULL,
    tr_depart         VARCHAR2(100),
    tr_destin          VARCHAR2(100),
    tr_time             VARCHAR2(20),
    tr_seat             NUMBER(2));
    
    CREATE TABLE USERS (
    user_id         VARCHAR2(100),
    user_pw            VARCHAR2(100),
    user_name         VARCHAR2(100),
    user_phone         VARCHAR2(100));
    
     CREATE TABLE booking (
   booking_id         VARCHAR2(100),
   booking_train    VARCHAR2(100),
   tk_amount        NUMBER);
   
ALTER TABLE trains
MODIFY tr_time VARCHAR2(20);



    -------------------flight ���̺� ���� �߰�-------------
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

---------users ���� �߰� -------------------------------
INSERT INTO users (user_id,user_pw,user_name, user_phone)
VALUES('rkawk01','12345','�հ���','010-1212-1212');

-------------���̺� ���� ���� --------
SELECT *
FROM trains;
    
select *
from booking;

SELECT *
FROM USERS;

---------------������ ����--------------
ALTER TABLE USERS
DROP COLUMN TR_TOTAKE;

ALTER TABLE booking
add  tk_amount number;
ALTER TABLE USERS 
ADD TR_TOTAKE VARCHAR2(100);

----------------------����������Ʈ��-------------------
 --��ȸ 
 --1�� ������ȸ 
SELECT tr_num, tr_name,tr_depart, tr_seat 
FROM trains
WHERE tr_depart = ' '
AND tr_destin = ' ';

--2�� �ܿ� �¼� ��ȸ
SELECT tr_seat
FROM trains
WHERE tr_num = ' ';

--3-1) ����� ��� 
INSERT INTO users (user_id, user_pw, user_name, user_phone)
VALUES ('ekdrms02','12345','�����','010-3434-3434');

insert into users (user_id, user_pw,user_name)
values ('rhrnak01','12345','����');

--3-2) �α��� 
SELECT *
FROM USERS
WHERE USER_ID = 'rhrnak01'
AND USER_PW = '12345';


--3-2))����

INSERT INTO booking
VALUES('rhrnak01','1010');

--���̺� ����
SELECT u.user_name, b.booking_train
FROM trains t, users u , booking b
WHERE u.user_id = b.booking_id
AND t.tr_num = b.booking_train;


--���� ���̺� ���� 
insert into booking 
values ('rhrnak03','1010');

--���� �� �¼� ����

select 

--4) ���� ��ȸ  by user_id
SELECT t.tr_num,t.tr_name,u.user_name,t.tr_time 
FROM users u,trains t,booking b
WHERE t.tr_num = b.booking_train
AND u.user_id = b.booking_id
and u.user_id = 'rkawk01';

--5)������� (����) 
DELETE 
FROM booking
WHERE booking_train = '1010'
AND booking_id = 'rhrnak03';


