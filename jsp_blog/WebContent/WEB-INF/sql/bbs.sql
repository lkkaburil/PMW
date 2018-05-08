drop table bbs;

create table bbs (
bbsno 		number(7) 		not null,
wname		varchar(20)		not null,
title		varchar(100)	not null,
content		varchar(4000) 	not null,
passwd		varchar(15)		not null,
viewcnt		number(5)		default 0, --조회수, 기본값 사용
wdate		date			not null,  --등록날짜, sysdate
grpno		number(7)		default 0, --부모글 번호
indent		number(2)		default 0, --답변여부, 답변의 깊이
ansnum		number(5)		default 0, --답변순서

primary key(bbsno)

);

alter table bbs 
add(refnum 		number 		default 0);		

select * from bbs;

select count(refnum) from bbs
where refnum = 1;


--답변만 삭제
delete from bbs 
where indent > 0;

--레코드 갯수
select count(*) from bbs
where wname like '%선%'


--일련번호
select nvl(max(bbsno),0)+1 as max from bbs;

--create
insert into bbs (bbsno, wname, title, content, passwd, wdate)
values ((select nvl(max(bbsno),0)+1 as max from bbs), 
'듀랑고', '제목', '내용', '123', sysdate);

insert into bbs (bbsno, wname, title, content, passwd, wdate)
values ((select nvl(max(bbsno),0)+1 as max from bbs), 
'듀랑고2', '제목2', '내용2', '123', sysdate);

insert into bbs (bbsno, wname, title, content, passwd, wdate)
values ((select nvl(max(bbsno),0)+1 as max from bbs), 
'듀랑고3', '제목3', '내용3', '123', sysdate);

--read
select * from bbs 
where bbsno = 1;

--update
update bbs
set
wname='왕눈이',
title='비오는날',
content='개구리연못'
where bbsno = 1;

--delete
delete from bbs
where bbsno = 1;


--list(paging)

select bbsno, wname, title, content, passwd,
	viewcnt, wdate, grpno, indent, ansnum, r
from(
	select bbsno, wname, title, content, passwd,
	viewcnt, wdate, grpno, indent, ansnum, rownum r
	from(
		select bbsno, wname, title, content, passwd,
		viewcnt, wdate, grpno, indent, ansnum
		from bbs
		--검색(if)
		order by grpno desc, ansnum 
	)
)
where r >= 5 and r <= 10; 
	
--조회수 증가
update bbs
set
viewcnt = viewcnt +1
where bbsno =2;


--비밀번호 검증
select count(bbsno) as cnt
from bbs
where bbsno=2 and passwd='123';


--모든 레코드 삭제 
DELETE FROM bbs; 
 
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----  -----    ----- ------ ------ 
     1  부모글1     	1      0      0 
 
      
 BBSNO  TITLE    GRPNO INDENT ANSNUM 
 -----  -----    ----- ------ ------ 
     2  부모글2      2      0      0 
     1  부모글1      1      0      0 
 
      
 BBSNO  TITLE            GRPNO INDENT ANSNUM 
 -----  -----            ----- ------ ------ 
	2	부모글2				2		0		0
 	1	부모글1			 	1		0		0
 	4	 ㄴ부모글1의 답변2		1		1		1
 	5		ㄴ답변2의 답변1		1		2		2
 	3	 ㄴ부모글1의 답변1		1		1		3
 	
 	
 -- 부모글 생성
insert into bbs (bbsno, wname, title, content, passwd, wdate, grpno)
values ((select nvl(max(bbsno),0)+1 as max from bbs), 
'듀랑고', '제목', '내용', '123', sysdate, 
(select nvl(max(grpno),0)+1 from bbs)
);
	
delete from bbs where indent > 0;

alter table bbs 
add(filename 		varchar(30),
	filesize		number			default 0);