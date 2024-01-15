
CREATE TABLE search (
	search_no	number(10)		NOT NULL,
	keyword	 varchar2(100)		NULL,
	sdt	date		NULL,
	hit	number(10)		NULL
);

CREATE TABLE book (
	book_no	number(10)	DEFAULT 0	NOT NULL,
	name	varchar2(100)	DEFAULT 0	NULL,
	author	varchar2(100)	DEFAULT 0	NULL,
	comp	varchar2(100)		NULL,
	price	number(10)		NULL,
	dt	varchar2(100)	DEFAULT 0	NULL,
	category	varchar2(100)	DEFAULT 0	NULL,
	about	varchar2(500)	DEFAULT 0	NULL,
	img	varchar2(100)	DEFAULT 0	NULL,
	isbn	varchar2(50)		NULL
);

CREATE TABLE member (
	member_no	number(10)		NOT NULL,
	id	varchar2(100)		NULL,
	m_name	varchar2(100)		NULL,
	pw	varchar2(100)		NULL,
	email	varchar2(100)		NULL,
	age	varchar2(100)		NULL,
	phone	varchar2(100)		NULL,
	likes	varchar2(100)		NULL,
	sms	varchar2(100)		NULL,
	point	number(10)		NULL
);


CREATE TABLE review (
	review_no	number(10)		NULL,
	contents	varchar2(100)		NULL,
	rdt	date		NULL,
	member_no	number(10)		NOT NULL,
	book_no	number(10)	DEFAULT 0	NOT NULL,
	orderItem_no	number(10)		NULL
);

CREATE TABLE cart (
	cart_no	number(10)		NOT NULL,
	quantity	number(10)		NULL,
	book_no	number(10)	DEFAULT 0	NOT NULL,
	member_no	number(10)		NULL
);

CREATE TABLE like_it (
	member_no	number(10)		NOT NULL,
	book_no	number(10)	DEFAULT 0	NOT NULL
);

CREATE TABLE orders (
	od_no	number(10)		NOT NULL,
	od_tg	varchar2(100)		NULL,
	od_ad	varchar2(500)		NULL,
	odt	date		NULL,
	od_status	varchar2(100)		NULL,
	od_price	number(10)		NULL,
	use_point	number(10)		NULL,
	od_total	number(10)		NULL,
	member_no	number(10)		NOT NULL,
	phone	varchar2(100)		NULL
);

CREATE TABLE order_item (
	orderItem_no	number(10)		NOT NULL,
	od_no	number(10)		NOT NULL,
	book_no	number(10)	DEFAULT 0	NOT NULL,
	quantity	number(10)		NULL
);

ALTER TABLE search ADD CONSTRAINT PK_SEARCH PRIMARY KEY (
	search_no
);

ALTER TABLE book ADD CONSTRAINT PK_BOOK PRIMARY KEY (
	book_no
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_no
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_no
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	cart_no
);

ALTER TABLE orders ADD CONSTRAINT PK_ORDERS PRIMARY KEY (
	od_no
);


ALTER TABLE order_item ADD CONSTRAINT PK_ORDER_ITEM PRIMARY KEY (
	orderItem_no
);

ALTER TABLE review ADD CONSTRAINT FK_member_TO_review_1 FOREIGN KEY (
	member_no
)
REFERENCES member (
	member_no
);

ALTER TABLE review ADD CONSTRAINT FK_book_TO_review_1 FOREIGN KEY (
	book_no
)
REFERENCES book (
	book_no
);

ALTER TABLE cart ADD CONSTRAINT FK_book_TO_cart_1 FOREIGN KEY (
	book_no
)
REFERENCES book (
	book_no
);

ALTER TABLE like_it ADD CONSTRAINT FK_member_TO_like_it_1 FOREIGN KEY (
	member_no
)
REFERENCES member (
	member_no
);

ALTER TABLE like_it ADD CONSTRAINT FK_book_TO_like_it_1 FOREIGN KEY (
	book_no
)
REFERENCES book (
	book_no
);

ALTER TABLE orders ADD CONSTRAINT FK_member_TO_orders_1 FOREIGN KEY (
	member_no
)
REFERENCES member (
	member_no
);

ALTER TABLE order_item ADD CONSTRAINT FK_orders_TO_order_item_1 FOREIGN KEY (
	od_no
)
REFERENCES orders (
	od_no
);

ALTER TABLE order_item ADD CONSTRAINT FK_book_TO_order_item_1 FOREIGN KEY (
	book_no
)
REFERENCES book (
	book_no
);


-------날짜 입력 안할 시 오늘 날짜로 default 저장----------------
alter table orders modify odt default sysdate;

----------------------------------table생성 완료-------------------
----------------------샘플데이터 등록-----------------------------

------------------book---------
insert into book values ('001','우리조최고','효은님','예담출판사',20000,'2024/01/12','미스터리','이 책은 예담의 베스트셀러','다운로드.jpg','978-89-94327-80-8');

insert into book values ('002','인생이란무엇','만사태평','노세노세',24000,'2023/11/13','로맨스','잘살아보세','스마일.jpg','978-89-94327-87-9');

insert into book values ('003','복잡하지않아','박아나','나무야미안해',25000,'2022/05/25','아동','아이들의 최애도서','아가.jpg','909-89-94327-80-8');

------------member----------
insert into member values (1,'apple1','박사과','tkrhk1','tkrhk@naver.com','32','010-5454-5455','스릴러','y',3000);

insert into member values (2,'carrot1','김당근','ekdrms1','ekdrms@naver.com','23','010-4242-1212','예술','n',1000);

insert into member values (3,'potato1','이감자','rkawk1','rkawk@naver.com','26','010-2111-6565','정치','y',4000);

-----------------------orders------------------

insert into orders(od_no,od_tg,od_ad,od_status,od_price,use_point,od_total, member_no,phone) values
(1,'김당근','대구 중구 예담로133','주문완료',44000,1000,43000,1,'010-5454-5455');

insert into orders(od_no,od_tg,od_ad,od_status,od_price,use_point,od_total, member_no,phone) values
(2,'이감자','서울시 동대문구 전통길43','주문완료',49000,500,48500,3,'010-2111-6565');

------------cart------------------
insert into cart values (1,2,2,2);

insert into cart values (2,1,3,1);

insert into cart values (3,2,1,3);

insert into cart values (4,2,2,3);

-------------like_it------------------
insert into like_it values (2,1);

insert into like_it values (3,3);

insert into like_it values (1,2);

insert into like_it values (2,1);

------------order_item--------
insert into order_item values (1,1,1,1);

insert into order_item values (2,1,2,1);

insert into order_item values (3,2,2,1);

insert into order_item values (4,2,3,1);

--------------review----------
insert into review values (1,'2024 최고의 책입니다!! 강력추천',sysdate,1,1,1);

insert into review values (2,'이제 복잡하게 살지 않으려구요',sysdate,1,2,2);

insert into review values (3,'두번이나 읽고 말았습니다',sysdate,2,2,3);

insert into review values (4,'말모말모',sysdate,2,3,4);

------전체 선택 쿼리-------

select * from member;
select * from book;
select * from cart;
select * from orders;
select * from like_it;
select * from order_item;
select * from review;

-------------
--order_item -> orderitem_no and od_no 차이가 뭐였지...
------------------

--베스트셀러 출력 쿼리 

select b.* , c.*
from book b ,  cart c 
where b.book_no = c.book_no
order by c.quantity desc;

------
SELECT COUNT quantity
FROM order_item o, book b
WHERE b.name = o.book_no;

-----------신간도서 출력쿼리 -------

select * from book
where dt > '2023/12/31'
order by dt desc;
---분야별---

select * from book
where category ='로맨스';