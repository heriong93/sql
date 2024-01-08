--BoardWeb ¸ñ·Ï ´ñ±Û ±â´É Ãß°¡ 
--´ñ±Û (´ñ±Û¹øÈ£, °Ô½Ã±Û ¹øÈ£, ³»¿ë, ÀÛ¼ºÀÚ, ÀÛ¼ºÀÏ½Ã)
create table reply (
reply_no number primary key,
board_no number not null,
reply varchar2(100) not null,
replyer varchar2(30) not null,
reply_date date default sysdate
);

create sequence reply_seq;

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'¾È³çÇÏ¼¼¿ä~ ¹İ°©½À´Ï´Ù', 'user4');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'1À§ÇÏ°í ½Í½À´Ï´Ù!', 'user1');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'³²ÀÇ °Ô½Ã¹°¿¡¼­ ÀÌ·¯´Â°Å º¸±â ÁÁÁö ¾Ê±º¿ä', 'user5');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,22,'±è¹Ú»ç´ÔÀº Á¤¸» ¹Ú»çÀÌ½Å°¡¿ä? ', 'user9');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,22,'¿ìÈÄ¾ûÇëÇëÇã¾û', 'user3');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,16,'¼ö¾÷ »¡¸® ¸¶Ä¡°í ³îÀÌÅÍ °¡ÀÚ!', 'user2');

select *
from reply
where board_no = 22;

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

--´ñ±Û ÆäÀÌÂ¡
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

select * from reply;

select name, count (*)
from reply r
join member m
on r.replyer = m.id
group by name;

INSERT INTO member values('user4', '4444', '±è¸Á°í', 'User');

INSERT INTO member values('user5', '5555', '¹Ú°¡¸ğ´Ï', 'User');