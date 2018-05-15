create table UserInfo
(userID varchar2(20) constraint userID_pk_id primary key,
userPW varchar2(20), userName varchar2(10),
userGender varchar2(4), userBirth number(6), 
userNicName varchar2(20), userPhone varchar2(13),
userEmail varchar2(50), userAddress varchar2(100),
userFollower number(10), userFollowing number(10));

create table Board_category
(categoryNum number(2) constraint categoryNum_pk_cn primary key,
categoryName varchar2(10));

create table Board
(boardNum number constraint boardnum_pk_bn primary key,
boardTitle varchar2(200), boardContents varchar2(4000),
boardDate date, boardView number, boardNomination number
);

desc userinfo