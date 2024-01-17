
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
---------------member sequence 등록-----

drop sequence member_sequence;
CREATE SEQUENCE member_sequence start with 4;

------------search sequence 등록-------
CREATE SEQUENCE search_sequence start with 12;
alter table search modify sdt default sysdate;
alter table search drop column hit;
insert into search(search_no,keyword,sdt) values  (search_sequence.nextval,'컴퓨터','24/01/15');

insert into search(search_no,keyword) values  (search_sequence.nextval,'아동');

-------날짜 입력 안할 시 오늘 날짜로 default 저장----------------
alter table orders modify odt default sysdate;
-----------member table id unique key 추가----------
ALTER TABLE member
ADD UNIQUE (ID);
--------like it 칼럼 중복 불가----
alter table like_it add constraint mb_likes unique(member_no, book_no);

----------------------------------table생성 완료-------------------
----------------------샘플데이터 등록-----------------------------

------------------book---------
insert into book values (member_seq.nextval,'우리조최고','효은님','예담출판사',20000,'2024/01/12','미스터리','이 책은 예담의 베스트셀러','다운로드.jpg','978-89-94327-80-8');

insert into book values (member_seq.nextval,'인생이란무엇','만사태평','노세노세',24000,'2023/11/13','로맨스','잘살아보세','스마일.jpg','978-89-94327-87-9');

insert into book values (member_seq.nextval,'복잡하지않아','박아나','나무야미안해',25000,'2022/05/25','아동','아이들의 최애도서','아가.jpg','909-89-94327-80-8');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (54,'나는 메트로폴리탄 미술관의 경비원입니다','패트릭 브링리 (지은이)','2023-11-24','뉴욕 메트로폴리탄 미술관에서 경비원으로 근무했던 패트릭 브링리의 독특하면서도 지적인 회고를 담은 에세이다. 가족의 죽음으로 고통 속에 웅크리고 있던 한 남자가 미술관에서 10년이라는 시간을 보내며 상실감을 극복하고 마침내 세상으로 나아갈 힘을 얻는 여정을 섬세하게 그려냈다.',17500,'8901276534_2.jpg','에세이','웅진지식하우스','9788901276533
');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (55,'푸바오, 언제나 사랑해','강철원(에버랜드 동물원)','2024-01-25','국내 탄생 1호 아기 판다로 우리에게 큰 기쁨을 주었던 푸바오가 이제 새로운 여정을 준비한다.《푸바오, 언제나 사랑해》는 푸바오가 한국에서 보내는 마지막 1년의 시간을 담고 있다. 봄, 여름, 가을, 겨울을 지내는 동안 푸바오가 우리에게 안겨 준 행복이 책 곳곳에 듬뿍 담겨 있다.',23000,'k452937057_2.jpg','에세이','시공주니어','9791171253128
');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (56,'내가 생각한 인생이 아니야','류시화','2023-12-21','인생이 주는 가장 큰 선물은 ‘다른 인생’이다. 새는 해답을 갖고 있어서 노래하는 것이 아니다. 노래를 갖고 있기 때문에 노래하는 것이다. 삶이 힘든 시기일수록 마음속에 아름다운 어떤 것을 품고 다녀야 한다. 그 아름다움이 우리를 구원한다.',18000,'k422937776_1.jpg','에세이','수오서재','9791193238172
');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (57,'이처럼 사소한 것들 ','클레어 키건','2023-11-27','2023년 4월 국내에 처음 소개된 『맡겨진 소녀』로 국내 문인들과 문학 독자들의 열렬한 환호를 받은 클레어 키건의 대표작 『이처럼 사소한 것들』이 번역 출간되었다. ',13800,'k472936042_1.jpg','시','다산책방','9791130646381
');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (58,'아주 희미한 빛으로도  ','최은영','2023-08-07','"함께 성장해나가는 우리 세대의 소설가"를 갖는 드문 경험을 선사하며 동료 작가와 평론가, 독자 모두에게 특별한 이름으로 자리매김한 최은영의 세번째 소설집 『아주 희미한 빛으로도』가 출간되었다 ',16800,'s672937436_1.jpg','시','문학동네','9788954695053
');
INSERT INTO BOOK  (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN)  VALUES (59,'사랑인 줄 알았는데 부정맥 ','사단법인 전국유료실버타운협회 포푸라샤','2024-01-17','센류는 일본의 정형시 중 하나로 5-7-5의 총 17개 음으로 된 짧은 시를 말한다. 이 책에서 소개하는 어르신(노인)들의 일상과 고충을 유쾌하게 담아낸 ‘실버 센류’는 전국유료실버타운협회의 주최로 2001년부터 매해 열리는 센류 공모전의 이름이기도 하다. ',13300,'k582937334_1.jpg','시','포레스트북스','9791193506073');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (60,'어서 와! 간단키토는 처음이지?  ','아놀드 홍','2023-12-18','왜 살이 찌는지를 두고 저마다 이유도 다양하지만, 다이어트 실패는 당신 잘못이 아니다. 많이 먹거나, 게으르거나, 저주받은 체질이어서 살이 찌는 것이 아니라, 다이어트의 기본이 잘못된 것이 문제였다. ',18000,'k522937870_1.jpg','교양','북드림','9791191509441
');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (61,'나도 손글씨 바르게 쓰면 소원이 없겠네 ','유한빈(펜크래프트)','2019-10-09','악필 교정부터 어른스러운 펜글씨까지 4주 완성 한글 정자체 연습법을 담았다. 한글 정자체 특유의 올드한 느낌이 아닌 모던 스타일 한글 정자체를 쓸 수 있도록 도와준다. ',12000,'k372636781_1.jpg','교양','한빛라이프','9791188007394
');
INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (62,'내 오래된 강아지에게','효모리 도모코','2023-12-14','반려동물과 함께하고 있는 반려인이라면 언젠가 이 작고 사랑스러운 생명체를 먼저 떠나보내야 함을 어렴풋이 알고 있다. 사람의 생명과 다른 속도의 삶을 살고 있는 존재들을 ‘반려’하는 일의 마음가짐은 결코 가벼울 수 없다.',18000,'8925575620_1.jpg','교양','알에이치코리아(RHK)','9788925575629
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (63,'도둑맞은 집중력','요한 하리 (지은이)','2023-04-28','저자는 현대인의 집중력 도둑을 찾아 나서는 사냥꾼을 자처한다. 스스로를 실험 대상으로 삼아 몰입을 되찾아보고, 세계의 전문과들과 인터뷰를 통해 무엇이 우리의 집중력을 해치는지 연구한다. ',18800,'s102936816_2.jpg','인문','어크로스','9791167740984

');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (64,'듄의 세계','톰 허들스턴 (지은이),강경아 (옮긴이)','2024-01-04','역사상 가장 많이 팔린 SF 소설이자 독자들이 뽑은 역대 최고의 SF 소설인 프랭크 허버트의 대작 『듄』의 최신 해설집이 황금가지에서 출간되었다.',32000,'k312937531_1.jpg','공학','황금가지','9791170523215

');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (65,'양자컴퓨터의 미래','미치오 카쿠 (지은이),박병철 (옮긴이)','2023-12-11','컴퓨터는 탄생 반세기 만에 인류의 삶을 완전히 점령하여 우리가 살던 아날로그 세상을 디지털 세상으로 바꾸어놓았다. 미치오 카쿠는 아날로그에서 디지털로의 변화 그 이상의 혁명이 양자 세상으로의 전환에서 일어날 것이며, 우리가 디지털 시대의 종말을 목격하고 양자 시대의 서막을 현장에서 관람하는 첫 세대가 될 것이라고 말한다.',24800,'8934955171_1.jpg','자연과학','김영사','9788934955177
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (66,'세상에서 가장 시끄러운 그림책 ','벤야민 고트발트 (지은이),윤혜정 (옮긴이)','2023-12-15','벤야민 고트발트의 기발한 아이디어로 시작된 이 글 없는 그림책은 160여 개의 소리 이미지로만 구성되어 있다. ',17000,'k542936700_2.jpg','유아','초록귤(우리학교)','9791167552426
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (67,'머리가 좋아지는 수수께끼 도전! 294문제 ','차현진','2024-01-20','수수께끼는 어떤 사물이나 상황에 대해 바로 말하지 않고 빗대어 표현하여 알아맞히는 말놀이다. 답이 무엇일지 곰곰이 생각하는 동안 상상력과 창의력이 퐁퐁 샘솟아요.',12000,'k802937135_1.jpg','유아','글송이','9791170186496
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (68,'타키 포오의 코믹 어드벤처 4','캐릭온TV','2024-01-10','나가를 무찌른 뒤, 다음 여행지인 트로피카 마을로 향하는 타키와 포오. 그곳에서 타키와 포오는 불행한 성에 얽힌 슬픈 사연을 듣게 되는데…. 타키와 포오는 불행한 성의 비밀을 밝히고 악에 물든 마법사, 리치를 구할 수 있을까?',14500,'k632937334_1.jpg','아동','대원키즈','9791171249466
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (69,'우주의 속삭임','하신하','2024-01-08','24년 동안 이어온 문학동네문학상 대상 수상작은 이 우주에 대해 다룬 5편의 동화다. 각각의 이야기들은 인간과 로봇, 외계인 같은 비인간 존재들 혹은 비인간과 비인간 간의 연결을 보여준다. ',12500,'8954697704_2.jpg','아동','문학동네','9788954697705
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (70,'흔한남매 15 ','흔한남매','2023-12-14','으뜸 박사의 우당탕탕 과학 실험, 솔로라서 좋은 점, 흔한남매네 집에 놀러 온 씁아저씨, 언니가 된 으뜸이, 공포의 학원 안내 방송, 화장실에서 펼치는 생존 대결 등 기발한 웃음이 가득한 흔한남매의 일상을 그리고 있다. ',14500,'k502936654_1.jpg','아동','미래엔아이세움','9791168417199
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (4,'오픽노잼','Sam Park(오픽노잼)','2023-09-22','수백만 개의 오픽 기출 문제들을 모두 공부하는 것은 불가능하다. <오픽노잼> 개정판에서는 수백만 개의 문제들을 단 4가지 유형으로 정리하였다.  ',26000,'8962819031_1.jpg','외국어','파고다','9788962819038
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (24,'위너 1 ','프레드릭 배크만','2023-12-04','스웨덴 북부의 두 작은 마을 베어타운과 헤드. 사방을 둘러봐도 눈에 들어오는 거라곤 숲과 호수뿐인 데다, 인구와 일자리는 줄어들고 집값도 떨어지는 곳이다.  ',18000,'k202936251_1.jpg','소설','다산책방','9791130649177
');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (25,'사라진 것들','앤드루 포터','2024-01-15','소설집 『빛과 물질에 관한 이론』으로 한국 독자들의 큰 사랑을 받은 앤드루 포터의 두번째 소설집. ',18000,'8954697356_1.jpg','소설','문학동네','9788954697354

');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (71,'전두환의 마지막 33년','정아은','2023-05-15','학살의 주동자. 악인으로 살다가 악인으로 죽었다. 한 번의 사과 없이 윤택한 노후를 보냈다. 죽고 나서도 논란은 이어진다. ',20000,'k352833476_1.jpg','정치','사이드웨이','9791191998184

');

INSERT INTO BOOK (   BOOK_NO,NAME, AUTHOR, DT, ABOUT, PRICE, IMG, CATEGORY, COMP, ISBN) VALUES (75,'시원스쿨 중국어 말하기 핵심패턴 301','윤주희,시원스쿨 중국어연구소','2023-11-01','중국인이 실제 대화에서 가장 많이 쓰는 301개의 중국어 문장 패턴만을 엄선하여 수록한 도서다. 원어민이 매일 쓰는 기초 패턴부터, HSK에 자주 출제되는 빈출 패턴까지 중국어 회화에 꼭 필요한 패턴만 차곡차곡 담아냈다. ',17800,'k502936280_1.jpg','외국어','시원스쿨닷컴','9791161507767


');

------------member----------
insert into member values (1,'apple1','박사과','tkrhk1','tkrhk@naver.com','32','010-5454-5455','스릴러','y',3000);

insert into member values (2,'carrot1','김당근','ekdrms1','ekdrms@naver.com','23','010-4242-1212','예술','n',1000);

insert into member values (3,'potato1','이감자','rkawk1','rkawk@naver.com','26','010-2111-6565','정치','y',4000);

insert into member values (member_sequence.nextval,'rlfehd3','홍길동','rlfehd4','rlfehd@naver.com','40','010-1211-6225','정치','y',1000);

-----------------------orders------------------

insert into orders(od_no,od_tg,od_ad,od_status,od_price,use_point,od_total, member_no,phone) values
(1,'김당근','대구 중구 예담로133','주문완료',44000,1000,43000,1,'010-5454-5455');

insert into orders(od_no,od_tg,od_ad,od_status,od_price,use_point,od_total, member_no,phone) values
(2,'이감자','서울시 동대문구 전통길43','주문완료',49000,500,48500,3,'010-2111-6565');

insert into orders(od_no,od_tg,od_ad,od_status,od_price,use_point,od_total, member_no,phone) values
(3,'홍길동','부산시 주문진 자갈치로54','주문완료',98800,1000,97800,4,'010-1211-6225');


------------cart------------------
insert into cart values (1,2,2,2);

insert into cart values (2,1,3,1);

insert into cart values (3,2,1,3);

insert into cart values (4,3,60,1);

-------------like_it------------------
insert into like_it values (2,1);

insert into like_it values (3,3);

insert into like_it values (1,2);

insert into like_it values (2,1);

insert into like_it values (4,20);

------------order_item--------
insert into order_item values (1,1,61,1);

insert into order_item values (2,1,64,1);

insert into order_item values (3,2,64,1);

insert into order_item values (4,2,66,1);

insert into order_item values (9,3,64,1);

--------------review----------
insert into review values (1,'2024 최고의 책입니다!! 강력추천',sysdate,1,1,1);

insert into review values (2,'이제 복잡하게 살지 않으려구요',sysdate,1,2,2);

insert into review values (3,'두번이나 읽고 말았습니다',sysdate,2,2,3);

insert into review values (4,'말모말모',sysdate,2,3,4);
-----추가 리뷰-----
insert into review values (5,'무조건 보세요 나의 인생도서',sysdate,1,1,5);
insert into review values (6,'안보면 후회합니다',sysdate,2,1,6);
insert into review values (7,'저는 재미없었어요',sysdate,3,1,7);


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
select cnt ,b.* 
from (
    select book_no,count(book_no) as cnt
        from  order_item         
        group by book_no    
        order by count(book_no) desc
   ) o,book b  
   where b.book_no = o.book_no;
   
   and b.category='로맨스'; 

-----------신간도서 출력쿼리 -------

select * from book
where dt > '2023/12/31'
order by dt desc;

---분야별 책 출력---

select * from book
where category  in ('인문', '유아');