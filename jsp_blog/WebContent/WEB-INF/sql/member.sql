drop table member;

create table member (
	id			varchar(10)		not	null, 				--아이디 중복 x, 레코드를 구분하는 컬럼
	passwd		varchar(20)		not null, 				--패스워드, 영숫자 조합
	mname		varchar(20)		not null, 				--성명, 한글 10자 저장 가능
	tel			varchar(14)			null, 				--전화번호
	email		varchar(50)		not null UNIQUE,		--전자우편 주소, 중복x 
	zipcode		varchar(7)			null,				--우편번호, 101-101
	address1	varchar(150)		null,				--주소1
	address2	varchar(50)			null,				--주소2
	job			varchar(20)		not null,				--직업
	mdate		DATE			not null,				--가입일
	fname		varchar(50)		default 'member.jpg',	--회원 사진
	grade		char(1)			default 'H',			--일반회원:H, 정지:Y, 손님:Z
	primary key (id)					

);


--create
insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user1', '1234', '개발자1', '123-1234', 'email1@mail.com',
'123-123', '인천시', '남동구', 'A01', sysdate, 'man.jpg', 'H');


insert into member(id, passwd, mname, tel, email, zipcode, 
address1, address2, job, mdate, fname, grade)
values('user2', '1234', '개발자2', '123-1234', 'email2@mail.com',
'123-123', '광명시', '남동구', 'A01', sysdate, 'man.jpg', 'H');


insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('user3', '1234', '개발자3', '123-1234', 'email3@mail.com',
'123-123', '용인시', '남동구', 'A01', sysdate, 'myface.jpg', 'H');

insert into member(id, passwd, mname, tel, email, zipcode,
address1, address2, job, mdate, fname, grade)
values('admin', '1234', '관리자', '123-1234', 'admin@mail.com',
'123-123', '용인시', '남동구', 'A01', sysdate, 'member.jpg', 'A');

--read
select * from member;
where id = 

--update
update member set
passwd = 'TEST',
mname = 'TEST',
tel = '321-321',
email = 'email10',
zipcode = 'TEST',
address1 = '수원',
address2 = '팔달구',
job = 'TEST'
where id = 'ㅁㅁ'

--delete
delete from member
where id = ;

--list
select id, mname, tel, email, zipcode, address1, address2, fname, r
	from(
		select id, mname, tel, email, zipcode, address1, address2, fname, rownum r
			from(
				select id, mname, tel, email, zipcode, address1, address2, fname
				from member
				where like '%'||계란||'%' 
				order by mdate desc
)
)
where r>=1 and r<=5 ;

--중복 id 검사 관련 SQL (0:중복아님, 1:중복)
select count(id)
from member
where id = 'user1';

--중복 email 검사 관련 SQL
select count(email) as cnt
from member
where email = 'email1@mail.com';

--회원 이미지의 수정
update member set
fname = '콧수염.png'
where id = 'user1';

--패스워드 변경
update member set
passwd = '1234'
where id = 'user1';

--회원삭제
delete from member where id ='user3';

--로그인 관련 SQL
select count(id) as cnt
from member
where id = 'user1' and passwd = '1234';

select count(id) from member
where id ='ㅁㅁ' and passwd='aa';


select * from member;