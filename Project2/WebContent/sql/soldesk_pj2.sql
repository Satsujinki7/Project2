create table UserInfo
(userID varchar2(20) constraint userID_pk_id primary key,
userPW varchar2(20), userName varchar2(20),
userGender varchar2(4), userBirth number(6), 
userNicName varchar2(20), userPhone varchar2(13),
userEmail varchar2(50), userAddress varchar2(100),
userFollower number(10), userFollowing number(10));

create table Board_category
(categoryNum number(2) constraint categoryNum_pk_cn primary key,
categoryName varchar2(10));

create table Board
(boardNum number constraint boardnum_pk_bn primary key,
boardDate date, boardWriter varchar2(20), boardTitle varchar2(200),
boardContents varchar2(4000), status number(2,0),
boardHits number(8,0), boardNomination number(8,0)
);

desc board

create sequence board_boardnum_seq
start with 1
minvalue 1
nomaxvalue
increment by 1
nocache
nocycle;

alter table board
drop(boardCategory);

alter table board
add(boardImage varchar2(500));

create table gameboard
(gameNum number constraint gamenum_pk_bn primary key,
gameDate date, gameWriter varchar2(20), gameTitle varchar2(200),
gameImage varchar2(500),
gameContents varchar2(4000), status number(2,0),
gameHits number(8,0), gameNomination number(8,0)
);

desc gameboard

create sequence gameboard_gamenum_seq
start with 1
minvalue 1
nomaxvalue
increment by 1
nocache
nocycle;

--insert by ?���? --
create table illboard(
iboardnum number constraint ibnum_pk_bn primary key,
iboarddate date,
iboardtitle varchar2(200),
iboardwriter varchar2(20),
iboardcontent varchar2(4000),
iboardimg varchar2(500),
iboardhits number(8,0),
iboardnomination number(8,0),
iboardtoday number(8,0),
iboardflag number(1)
)

create sequence iboard_ibnum_seq
start with 1
minvalue 1
nomaxvalue
increment by 1
nocache
nocycle;



--cartoon table by SUN
create table toonboard(
tboardnum number constraint tbnum_pk_bn primary key,
tboarddate date,
tboardtitle varchar2(200),
tboardwriter varchar2(20),
tboardcontent varchar2(4000),
tboardimg varchar2(500),
tboardhits number(8,0),
tboardnomination number(8,0),
tboardtoday number(8,0),
tboardflag number(1)
)
/

create sequence tboard_tbnum_seq
start with 1
minvalue 1
nomaxvalue
increment by 1
nocache
nocycle
/

--Parody table by SUN
create table prdboard(
pboardnum number constraint pbnum_pk_bn primary key,
pboarddate date,
pboardtitle varchar2(200),
pboardwriter varchar2(20),
pboardcontent varchar2(4000),
pboardimg varchar2(500),
pboardhits number(8,0),
pboardnomination number(8,0),
pboardtoday number(8,0),
pboardflag number(1)
)
/

create sequence pboard_pbnum_seq
start with 1
minvalue 1
nomaxvalue
increment by 1
nocache
nocycle
/


---------------userInfo?�� 컬럼추�? --------------
alter table userinfo
add(
userimg varchar2(30),
userbio varchar2(500));


--������� �߰� (������)
create table REPLY
(replyNum number constraint replynum_pk_rn primary key,
replyBoardNum number constraint replyboardnum_fk_rbn references board(boardnum) on delete cascade not null,
replyWriter varchar2(20), replyDate date,
replyComment varchar2(1000) not null);

create sequence reply_replyNum_seq
start WITH 1
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
NOCYCLE
NOCACHE;

create table RE_REPLY
(reReplyNum number constraint rereplynum_pk_rn primary key,
reReplyParentNum number constraint rereplyparentnum_fk_rbn references reply(replynum) on delete cascade not null,
reReplyWriter varchar2(20), reReplyDate date,
reReplyComment varchar2(1000) not null);

create sequence rereply_rereplyNum_seq
start WITH 1
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
NOCYCLE
NOCACHE;

alter table reply
add (groupNum number, depth number, orderNum number, parentReplyNum number);



----------태그 테이블추가----------


create table tag
(test number(10));



----------게시물에 태그정보 추가----------

alter table illboard
add (illtag varchar2(200));


alter table toonboard
add (toontag varchar2(200));


alter table etcboard
add (etctag varchar2(200));


alter table prdboard
add (prdtag varchar2(200));


-- ---UNION SQL FOR TAG-----
select * from toonboard union select * from illboard union select * from prdboard union select * from etcboard ;