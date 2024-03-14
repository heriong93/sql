--------------------------------------------------------
--  파일이 생성됨 - 목요일-3월-14-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BOARD_NO" NUMBER, 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(500), 
	"WRITER" VARCHAR2(50), 
	"WRITER_DATE" DATE DEFAULT sysdate, 
	"CLICK_CNT" NUMBER DEFAULT 0, 
	"IMAGE" VARCHAR2(100), 
	"PHOTO" VARCHAR2(100)
   ) ;
REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (4,'오늘은 금요일','불코딩하자','김박사',to_date('23/12/22','RR/MM/DD'),30,null,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (5,'우리반 화이팅!!','내용수정 테스트','김막내',to_date('23/12/22','RR/MM/DD'),43,null,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (11,'김철수입니다.','수정테스트 스프링','김철수',to_date('23/12/27','RR/MM/DD'),29,null,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (9,'안녕하세요','김철수 입니다.
반갑습니다.','김철수',to_date('23/12/26','RR/MM/DD'),25,null,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (10,'자바입니다~!','자바 쉽지않네 ㅋㅋ','박민수',to_date('23/12/27','RR/MM/DD'),11,null,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (23,'게시글 등록 성공하고싶다','봍붙이지만 안되는건 뭐죠','홍길동',to_date('24/02/02','RR/MM/DD'),1,'이미지.jpg',null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (14,'홍길동 사진ㅋ','ㅋㅋㅋㅋㅋㅋ','김철수',to_date('23/12/27','RR/MM/DD'),12,'홍길동3.png',null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (15,'파일업로드안함','겟방식이다!','김철수',to_date('23/12/27','RR/MM/DD'),5,null,null);
Insert into BOARD (BOARD_NO,TITLE,CONTENT,WRITER,WRITER_DATE,CLICK_CNT,IMAGE,PHOTO) values (13,'세번째 업로드','파일업로드...','홍길동',to_date('23/12/27','RR/MM/DD'),9,'홍길동2.png',null);
--------------------------------------------------------
--  DDL for Index SYS_C007057
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007057" ON "BOARD" ("BOARD_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD PRIMARY KEY ("BOARD_NO") ENABLE;
  ALTER TABLE "BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
