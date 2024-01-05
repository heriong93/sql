--BoardWeb 목록 댓글 기능 추가 
--댓글 (댓글번호, 게시글 번호, 내용, 작성자, 작성일시)
create table reply (
reply_no number primary key,
board_no number not null,
reply varchar2(100) not null,
replyer varchar2(30) not null,
reply_date date default sysdate
);

create sequence reply_seq;

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'안녕하세요~ 반갑습니다', 'user4');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'친하게 지내요 박혜령님!', 'user1');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'남의 게시물에서 이러는거 보기 좋지 않군요', 'user9');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,22,'김박사님은 정말 박사이신가요? ', 'user9');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,22,'금요일 좋아요~~', 'user3');

select *
from reply;

select *
from member;

select *
from reply 
where board_no =14;

select * from reply
where replyer = 'user1';

select r.*, m.name 
    from reply r
    join member m
    on r.replyer = m.id
    where reply_no =reply_no 
    order by 1;

--댓글 페이징
select b.* from 
(select rownum rn, a.*  from 
(select r.*, m.name name
    from reply r
    join member m
    on r.replyer = m.id
    where board_no = 14 
    order by 1
    ) a ) b
    
    where b.rn > (2-1) and b.rn <=2*5;
