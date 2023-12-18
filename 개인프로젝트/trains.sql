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
    user_phone         VARCHAR2(100),
    user_mail             VARCHAR2(100));
    
     CREATE TABLE booking (
   booking_id         VARCHAR2(100),
   booking_train    VARCHAR2(100),
   booking_date         DATE);
    
ALTER TABLE trains
MODIFY tr_time VARCHAR2(20);

alter table USERS rename column user_num to user_id;
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
INSERT INTO users (user_id,user_pw,user_name, user_phone, user_mail)
VALUES('rkawk01','12345','�հ���','010-1212-1212','rkawk01@gmail.com');

SELECT *
    FROM trains;
    
    SELECT *
    FROM USERS;
     ------------------------------����������Ʈ----
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

--��� 


                                    
--3-1) ����� ��� 
INSERT INTO users (user_id, user_pw, user_name, user_phone,user_mail)
VALUES ('ekdrms02','12345','�����','010-3434-3434','ekdrms02@gmail.com');

--3-2) �װ��� ���� 
insert into booking
VALUES();

SELECT u.user_id, t.tr_num, b.booking_date
FROM trains t, users u , booking b
WHERE u.user_id = b.booking_id
AND t.tr_num = b.booking_train;

select * from users;

select * from booking;
--���� ���̺� ���� 
insert into booking 
values ('rhrnak03','1010','2023-12-18');

--4) ���� ��ȸ  
SELECT b.booking_train, b.booking_id,u.user_name,t.tr_time
FROM booking b,users u, trains t
WHERE booking_id = 'rhrnak03';

--5)������� (����) 
DELETE FROM booking
WHERE booking_train = ' ';


