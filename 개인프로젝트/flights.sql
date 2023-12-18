CREATE TABLE flight (
    al_name         VARCHAR2(10),
    fl_name         VARCHAR2(10) NOT NULL ,
    fl_date           DATE,
    ds_name         VARCHAR2(10),
    time_ar             VARCHAR2(10),
    left_bs                  NUMBER(2),
    left_es                 NUMBER(2),
    time_fl                 VARCHAR2(10),
    fl_price                NUMBER(10));
    
    CREATE TABLE USERS (
    user_id         NUMBER(10),
    user_name         VARCHAR2(10) NOT NULL ,
    user_birth          VARCHAR2(9)NOT NULL ,
    user_phone         VARCHAR2(10),
    user_mail             VARCHAR2(20),
    user_lv                  VARCHAR2(2));
    
    CREATE TABLE RESERVATION (
    rs_name            VARCHAR2(10),
    rs_number        VARCHAR2(9) ,
    fl_name             VARCHAR2(10),
    rs_price             NUMBER,
    rs_seat              NUMBER);
    
    ALTER TABLE flight 
    RENAME COLUMN fl_price TO fl_bsprice;
    
    ALTER TABLE flight 
    RENAME COLUMN left_bs TO total_bseat;
    
    ALTER TABLE flight 
    RENAME COLUMN left_es TO total_eseat;
    ALTER TABLE flight 
    ADD fl_ecprice NUMBER(10);
    
     ALTER TABLE flight 
    ADD left_seat NUMBER(10);
    
    ALTER TABLE flight
    MODIFY COLUMN time_ar NUMBER;
    
    alter table FLIGHT add (time_to_arr NUMBER);

update FLIGHT set time_to_arr = VARCHAR(time_ar);

alter table flight drop column time_to_arr;

alter table t rename column col_new to col_old;
    
ALTER TABLE users 
DROP COLUMN  user_lv;

ALTER TABLE FLIGHT
ADD PRIMARY KEY (FL_NAME);

ALTER TABLE RESERVATION
ADD PRIMARY KEY (RS_NUMBER);
    
    SELECT *
    FROM FLIGHT;
    
    SELECT *
    FROM USERS
    WHERE USER_BIRTH = ' ';
    
    SELECT * 
    FROM RESERVATION;
-------------------flight ���̺� ���� �߰�-------------
INSERT INTO flight (AL_NAME,FL_NAME,FL_DATE,DS_NAME,TIME_AR,TOTAL_BSEAT,TOTAL_ESEAT,TIME_FL,FL_BSPRICE,FL_ECPRICE)
VALUES('CHINA AIRLINES','MU2040','2023/12/24','Ī�ٿ�',4,6,46,'12:00AM',500000,200000);

INSERT INTO flight 
VALUES('JAPAN AIRLINES','JL5272','2023/12/25','�����ī',2,5,70,'11:00AM',240000,100000);
INSERT INTO flight 
VALUES('KOREAN AIRLINES','KE901','2023/12/26','�ĸ�',11,10,90,'12:22PM',3540000,1580000);
INSERT INTO flight 
VALUES('FRANCE AIRLINES','AF7904','2023/12/30','�̽�ź��',10,10,90,'13:40PM',4040000,1700000);

INSERT INTO reservation
values ('RSI1215');
 ------------------------------����������Ʈ----
 --��ȸ 
 --1�� ������ȸ 
SELECT tr_num,tr_name, tr_, ds_name
FROM trains
ORDER BY fl_date;
--2�� ���� ��� ��ȸ
SELECT * 
FROM flight 
ORDER BY fl_date;

--��� 

ALTER TABLE FLIGHT
MODIFY time_ar NUMBER;

ALTER TABLE FLIGHT
MODIFY time_ar NUMBER;

ALTER TABLE reservation
MODIFY rs_number VARCHAR2(20);

ALTER TABLE USERS
DROP user_phone VARCHAR2(20);

DELETE FROM USERS
WHERE USER_NUM IS NULL;

DELETE * FROM FLIGHT;

DELETE FROM flight 
WHERE fl_name = 'JL5272';

--ȸ����ȣ �ڵ� ������ ���� 
CREATE SEQUENCE user_seq
                                    INCREMENT BY 1
                                    START WITH 10
                                    MAXVALUE 99999
                                    NOCACHE
                                    NOCYCLE;
                                    
--3-1) ����� ��� 
INSERT INTO users (user_num,user_name, user_birth, user_phone, user_mail)
VALUES (user_seq.NEXTVAL,'��ö��', '293432-2930491','010-1212-1232','cheolsu@gmail.com');
INSERT INTO users (user_num,user_name, user_birth, user_phone, user_mail)
VALUES (user_seq.NEXTVAL,'ȫ�浿', '291234-3639203','010-2322-5423','gildong@gmail.com');


SELECT f.al_name, u.user_name
FROM FLIGHT F,USERS U
WHERE AL_NAME = 'CHINA AIRLINES'
AND USER_NAME = '��ö��';

--3-2) �װ��� ���� 
--�����ȣ �ڵ� ������ ���� 
CREATE SEQUENCE rsnum_seq
                                    INCREMENT BY 1
                                    START WITH 10
                                    MAXVALUE 99999
                                    NOCACHE
                                    NOCYCLE;


--3-2) �����ȣ ��� 
SELECT rs_number 
FROM reservation;
--4)������ȸ/ ���


--5-1)���� (ȸ������ ����) 
UPDATE users 
SET user_name =' ',
        user_phone = ' ' ,
        user_mail = ' ' 
WHERE rs_number = ' ';

--5-2)���� 
DELETE FROM reservation 
WHERE rs_number = ' ';



    