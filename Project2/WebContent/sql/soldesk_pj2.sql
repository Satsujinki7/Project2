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
add(boardCategory varchar2(50));

update board
set boardCategory = 'ÀÚÀ¯';

