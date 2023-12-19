------------테이블 생성 -----------------------
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



    -------------------flight 테이블 정보 추가-------------
INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('1010','개나리호','서울','부산','13:05',50);
INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('2020','구마을호','대구','서울','07:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('3045','개구리호','광주','대구','15:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('5030','마동석호','대전','춘천','14:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('7011','오징어호','부산','대구','17:00',50);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('3733','마라호','진주','여수','20:00',0);

---------users 정보 추가 -------------------------------
INSERT INTO users (user_id,user_pw,user_name, user_phone)
VALUES('rkawk01','12345','왕감자','010-1212-1212');

-------------테이블 정보 보기 --------
SELECT *
FROM trains;
    
select *
from booking;

SELECT *
FROM USERS;

---------------수정용 쿼리--------------
ALTER TABLE USERS
DROP COLUMN TR_TOTAKE;

ALTER TABLE booking
add  tk_amount number;
ALTER TABLE USERS 
ADD TR_TOTAKE VARCHAR2(100);

----------------------개인프로젝트용-------------------
 --조회 
 --1번 기차조회 
SELECT tr_num, tr_name,tr_depart, tr_seat 
FROM trains
WHERE tr_depart = ' '
AND tr_destin = ' ';

--2번 잔여 좌석 조회
SELECT tr_seat
FROM trains
WHERE tr_num = ' ';

--3-1) 사용자 등록 
INSERT INTO users (user_id, user_pw, user_name, user_phone)
VALUES ('ekdrms02','12345','생당근','010-3434-3434');

insert into users (user_id, user_pw,user_name)
values ('rhrnak01','12345','고구마');

--3-2) 로그인 
SELECT *
FROM USERS
WHERE USER_ID = 'rhrnak01'
AND USER_PW = '12345';


--3-2))예약

INSERT INTO booking
VALUES('rhrnak01','1010');

--테이블 연결
SELECT u.user_name, b.booking_train
FROM trains t, users u , booking b
WHERE u.user_id = b.booking_id
AND t.tr_num = b.booking_train;


--예약 테이블에 저장 
insert into booking 
values ('rhrnak03','1010');

--예약 시 좌석 차감

select 

--4) 예약 조회  by user_id
SELECT t.tr_num,t.tr_name,u.user_name,t.tr_time 
FROM users u,trains t,booking b
WHERE t.tr_num = b.booking_train
AND u.user_id = b.booking_id
and u.user_id = 'rkawk01';

--5)예약취소 (삭제) 
DELETE 
FROM booking
WHERE booking_train = '1010'
AND booking_id = 'rhrnak03';


