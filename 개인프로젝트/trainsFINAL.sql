------------테이블 생성 -----------------------
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
   
---------------------테이블 추가 수정 쿼리---------------------------------   

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

-------------------Trains 테이블 데이터 추가-------------

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

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('3966','예담호','서울','부산','20:00',20);

INSERT INTO trains (tr_num,tr_name,tr_depart,tr_destin,tr_time,tr_seat)
VALUES('9966','참진호','대전','서울','18:00',50);

---------users 테이블 정보 추가 -------------------------------
INSERT INTO users (user_id,user_pw,user_name, user_phone)
VALUES('rkawk01','12345','왕감자','010-1212-1212');

-------------테이블 정보 보기 --------

SELECT *
FROM trains;
    
select *
from booking;

SELECT *
FROM USERS;

----------------------개인프로젝트용 쿼리-------------------

 --1번 기차조회 
 --기차노선 확인용 목록 조회 
 SELECT *
FROM TRAINS
WHERE TR_DEPART = '서울'
AND TR_DESTIN = '부산'
ORDER BY TR_TIME;

--기차 전체 목록 조회 
SELECT tr_num, tr_name,tr_time, tr_seat 
FROM trains 
WHERE tr_depart ='서울'
AND tr_destin = '부산'
ORDER BY TR_TIME;


--2번 잔여 좌석 조회
SELECT tr_seat
FROM trains
WHERE tr_num = ' ';
                
--좌석 예매 수 만큼 줄이기    (진행못함)                  
UPDATE trains 
SET tr_seat =(SELECT t.tr_seat - (b.tk_amount), TR_NUM
                    FROM trains t, booking b
                    where tr_num = booking_train
                    AND tr_num = '1010');

--3-1) 사용자 등록 
--booking 테이블에 저장---

insert into booking
values ('rhrnak01','7011',2,'고구마');

--아이디 중복 가입 방지용 쿼리 

SELECT *
FROM USERS
WHERE USER_ID = 'rhrnak01'
AND USER_PW = '12345';

--회원가입
INSERT INTO users (user_id, user_pw, user_name, user_phone)
VALUES ('ekdrms02','12345','생당근','010-3434-3434');

--3-2) 로그인 

SELECT *
FROM USERS
WHERE USER_ID = 'rhrnak01'
AND USER_PW = '12345';


--3-2)예약
--없는 기차 예약 방지 확인 용 쿼리
SELECT * 
FROM trains 
WHERE tr_num = '1010';

--3-2) 로그인 후 예약 추가 
INSERT INTO booking
VALUES('ekdrms02','1010',2,'생당근');

--테이블 연결 (예약자명, 기차번호)
SELECT b.booking_train,b.booking_name
FROM trains t, users u , booking b
WHERE u.user_id = b.booking_id
AND t.tr_num = b.booking_train;

--4) 예약 조회  

--예약건 없을 경우 확인 
select *
from booking
where booking_id ='ekdrms02' ;

--예약조회용 쿼리 
SELECT t.tr_num,t.tr_name,b.booking_name,t.tr_time  
FROM users u,trains t,booking b   
WHERE t.tr_num = b.booking_train   
AND u.user_name = b.booking_name 
AND U.USER_ID = 'qkrdPeka'
ORDER BY T.TR_TIME;

--5)예약취소 (삭제) 
DELETE 
FROM booking
WHERE booking_train = '1010'
AND booking_id = 'rhrnak03';

