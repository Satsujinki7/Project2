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

--insert by 선민 --
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
start width 1
minvalue 1
nomaxvalueed
increment by 1
nocache
nocycle;