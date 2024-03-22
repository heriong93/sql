create table board ( seq number primary key
,title varchar2(100)
,writer varchar2(100)
,content varchar2(100)
,regdate date
,cnt number
,uploadfile varchar2(100));

create table comments (
SEQ number primary key,
NAME varchar2(100),
content varchar2(100),
boardseq number,
regdate date);

commit;

select * from departments;

DELETE FROM board
	where seq=3;