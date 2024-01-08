--BoardWeb ��� ��� ��� �߰� 
--��� (��۹�ȣ, �Խñ� ��ȣ, ����, �ۼ���, �ۼ��Ͻ�)
create table reply (
reply_no number primary key,
board_no number not null,
reply varchar2(100) not null,
replyer varchar2(30) not null,
reply_date date default sysdate
);

create sequence reply_seq;

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'�ȳ��ϼ���~ �ݰ����ϴ�', 'user4');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'1���ϰ� �ͽ��ϴ�!', 'user1');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,14,'���� �Խù����� �̷��°� ���� ���� �ʱ���', 'user5');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,22,'��ڻ���� ���� �ڻ��̽Ű���? ', 'user9');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,22,'���ľ��������', 'user3');

INSERT INTO reply(reply_no,board_no,reply,replyer)
VALUES (reply_seq.nextval,16,'���� ���� ��ġ�� ������ ����!', 'user2');

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

--��� ����¡
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

INSERT INTO member values('user4', '4444', '�����', 'User');

INSERT INTO member values('user5', '5555', '�ڰ����', 'User');