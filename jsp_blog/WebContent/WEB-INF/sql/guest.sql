drop table guest;

create table guest (
num		number(5)		not	null,
name 	varchar(20)		not null,
content	varchar(3000)	not null,
gdate	date			not null,
primary key(num)
);

--num
select nvl(max(num),0)+1 as max from guest;

--create
insert into guest (num, name, content, gdate)
values ((select nvl(max(num),0)+1 as max from guest), 
'방문자1', '보고갑니당', sysdate);

insert into guest (num, name, content, gdate)
values ((select nvl(max(num),0)+1 as max from guest), 
'방문자2', '보고갑니당2', sysdate);

insert into guest (num, name, content, gdate)
values ((select nvl(max(num),0)+1 as max from guest), 
'방문자3', '보고갑니당3', sysdate);

--read
select *from guest
where num =1;

--update
update guest set
name = '스파게티',
content = '먹고싶당'
where num = 1;

--delete
delete guest
where num =4;

--list
select num, name, content, gdate, r
	from(
	select num, name, content, gdate, rownum r
		from(
			select num, name, content, gdate 
			from guest
			order by gdate desc
)
)
where r>=1 and r<=5;


--출력
select *from guest;