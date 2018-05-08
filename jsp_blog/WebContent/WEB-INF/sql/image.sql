drop table image;

create table image (
imgno 		number(7) 		not null,
name		varchar(20)		not null,
title		varchar(100)	not null,
content		varchar(4000) 	not null,
passwd		varchar(15)		not null,
viewcnt		number(5)		default 0, --조회수, 기본값 사용
idate		date			not null,  --등록날짜, sysdate
fname		varchar(50)		not null,

primary key(imgno)
);

select nvl(max(imgno), 0) +1 as max from image;

--create
insert into image(imgno, name, title, content, passwd, viewcnt, idate, fname)
values ((select nvl(max(imgno), 0) +1 as max from image),
'선아', '아이콘', 'Long time no see', '1234', '1', sysdate, 'man.jpg');

insert into image(imgno, name, title, content, passwd, viewcnt, idate, fname)
values ((select nvl(max(imgno), 0) +1 as max from image),
'선아1', '아이콘1', 'Beautiful', '1234', '2', sysdate, 'myface.jpg');

insert into image(imgno, name, title, content, passwd, viewcnt, idate, fname)
values ((select nvl(max(imgno), 0) +1 as max from image),
'선아2', '아이콘2', 'Best Friend', '1234', '3', sysdate, 'ㅎㅎㅎ.jpg');



--read
select name, title, content, viewcnt, idate, fname 
from image
where imgno = 1;

select *from image;

--update
update image set
name = '1',
title = '12',
content = '123',
fname = '연어.jpg'
where imgno = 1;

--delete
delete from image
where imgno = 1;

--pwCheck
select count(imgno) from image
where  imgno = 5 and passwd = '1234';

--list
select imgno, title, name, fname, r
	from(
		select imgno, title, name, fname, rownum r
			from (
				select imgno, title, name, fname 
				from image
				where like '%'||딸기||'%'
				order by imgno desc
			)
			)
where r >=1 and r <= 5;			
			


--upviewcnt
update image set
viewcnt = viewcnt +1
where imgno =1;


--total





select *from image;

