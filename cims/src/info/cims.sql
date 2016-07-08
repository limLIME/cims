drop table employee
--사원 테이블
CREATE TABLE employee(
emp_no varchar2(100) PRIMARY KEY,
dept_no number not null,
position_no number not null,
password varchar2(100) not null,
emp_name varchar2(100) not null,
emp_tel varchar2(100) not null,
emp_sign varchar2(100) not null,
emp_state number default 1,
emp_substitute varchar2(100),
emp_path VARCHAR2(100),
constraint fk_emp_dept_no foreign key(dept_no) references department,
constraint fk_emp_posi_no foreign key(position_no) references position
)
ALTER TABLE EMPLOYEE
ADD (emp_state number default 1)

ALTER TABLE EMPLOYEE
ADD (emp_memo varchar2(100))

ALTER TABLE EMPLOYEE
 (emp_substitute varchar2(100)) 

ALTER TABLE EMPLOYEE
ADD (emp_path VARCHAR2(100));
--선택
SELECT emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign 
FROM employee
where emp_no='0581' and password='1234'

select * from EMPLOYEE

--같은 부서원 선
select * from employee where dept_no=1

--사원 추가
insert into 
employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('1000',1,1,'1234','임흥택','010-5114-0581','ok')
--사원 추가
insert into 
employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('1742',1,1,'1234','박병우','010-5114-0581','ok')

insert into 
employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('9999',1,100,'1234','관리자','010-1234-5678','ok')

insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0581',1,1,'1234','임흥택','010-5114-0581','임흥택사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0582',1,2,'1234','박병우','010-5114-0581','박병우사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0583',1,3,'1234','민재홍','010-5114-0581','민재홍사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0584',1,4,'1234','김원두','010-5114-0581','김원두사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0585',1,5,'1234','이상우','010-5114-0581','이상우사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0586',1,3,'1234','최동현','010-5114-0581','최동현사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0587',1,4,'1234','손문수','010-5114-0581','손문수사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0588',1,4,'1234','박진용','010-5114-0581','박진용사인');
insert into employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('1009',1,4,'1234','손문수','010-5114-0581','손문수사인');
--직책
CREATE TABLE position(
position_no number PRIMARY KEY,
position_name varchar2(100) not null
)
--직책 예제
insert into position(position_no,position_name) values(0,'퇴사');
insert into position(position_no,position_name) values(1,'사원');
insert into position(position_no,position_name) values(2,'대리');
insert into position(position_no,position_name) values(3,'과장');
insert into position(position_no,position_name) values(4,'부장');
insert into position(position_no,position_name) values(5,'사장');
insert into position(position_no,position_name) values(100,'관리자');

--부서
CREATE TABLE department(
dept_no number PRIMARY KEY,
dept_name varchar2(100) not null
)
insert into department(dept_no,dept_name) values(0,'임원진');
insert into department(dept_no,dept_name) values(1,'인사과');
insert into department(dept_no,dept_name) values(2,'개발과');
insert into department(dept_no,dept_name) values(3,'영업과');
insert into department(dept_no,dept_name) values(4,'경리과');
insert into department(dept_no,dept_name) values(5,'지원과');

select s.sch_no,s.emp_no,s.sch_content,s.sch_day,to_char(s.sch_day,'DAY') DAY
from SCHEDULE s ,
						(SELECT TO_char( TRUNC(SYSDATE, 'IW') + (LEVEL - 1 ), 'YYYY-MM-DD' ) day 
						 FROM DUAL CONNECT BY LEVEL <7) d
where d.day=to_char(s.sch_day, 'YYYY-MM-DD') and s.emp_no='0581'

--결재 
drop table document

CREATE TABLE document(
doc_no number PRIMARY KEY,
emp_no varchar2(100) not null,
doc_title varchar2(100) not null,
doc_content clob not null,
doc_path varchar2(100),
doc_time_posted date not null,
doc_state varchar2(100) not null,
doc_returner varchar2(100),
doc_approver varchar2(100),
constraint fk_doc_emp_no foreign key(emp_no) references employee
)

--메인 결재 뽑기
  select count(*) from document d,employee e
      where e.emp_no=d.emp_no and d.doc_state='결재중' and
      (select MIN(position_no) from approver where doc_no=d.doc_no and doc_sign='0' and emp_no='0581')=1

drop sequence document_seq;
create sequence document_seq START WITH 10000;

select*from mail
drop table mail

drop table approver
--결재자 테이블
CREATE TABLE approver(
doc_no number not null,
emp_no varchar2(100) not null,
position_no number not null,
doc_sign varchar2(100) default '0',
constraint fk_app_doc_no foreign key(doc_no) references document,
constraint fk_app_emp_no foreign key(emp_no) references employee,
constraint fk_app_position_no foreign key(position_no) references position,
constraint pk_approver primary key(doc_no,emp_no,position_no)
)

--메일
drop table mail
CREATE TABLE mail(
mail_no number PRIMARY KEY,
emp_no varchar2(100) not null,
mail_receiver varchar2(100) not null,
mail_title varchar2(100) not null,
mail_content varchar2(100) not null,
mail_date date not null,
mail_path varchar2(100), 
mail_confirm number default 0, --수신확인
mail_sdelete number default 0, --송신자   삭제1 
mail_rdelete number default 0, --수신자   삭제1
constraint fk_mail_emp_no foreign key(emp_no) references employee
)
create sequence mail_seq 
drop sequence mail_seq

--메인의 메일 수
select count(mail_no) as count
from mail
where mail_receiver='9999' and mail_confirm=0

--내가 받은 열지 않은 받은 메일
select mail_no, emp_no, mail_title, mail_content, mail_date, mail_path, mail_sender, mail_receiver, mail_confirm, mail_state
from mail
where mail_receiver='9999' and mail_confirm=0 and rownum <=5
order by mail_date desc


select mail_no, emp_no, mail_title, mail_content, mail_date, mail_path,
		mail_sender, mail_receiver, mail_confirm, mail_state
		from
		(select mail_no, emp_no, mail_title, mail_content, mail_date, mail_path,
		mail_sender, mail_receiver, mail_confirm, mail_state
		from mail
		order by rownum desc)
		where mail_receiver='9999' and mail_confirm=0 and rownum <=5 
		
--메인 페이지 메일 역순
select *
from
(select mail_no, emp_no, mail_title, mail_content, mail_date, mail_path, mail_sender, mail_receiver, mail_confirm, mail_state
from mail
order by rownum desc)
where mail_receiver='9999' and mail_confirm=0 and rownum <=5



--공지
CREATE TABLE notice(
notice_no number PRIMARY KEY,
emp_no varchar2(100) not null,
notice_date date not null,
notice_title varchar2(100) not null,
notice_content clob not null,
notice_path varchar2(100),
constraint fk_notice_emp_no foreign key(emp_no) references employee
)
--오늘 공지 수 체크
select count(notice_no) 
from notice 
where to_char(notice_date, 'YYYY-MM-DD')=to_char(sysdate, 'YYYY-MM-DD')


select * from NOTICE

--내 일정 수 체크
select count(notice_no) 
from notice 
where emp_no='9999' and  to_char(notice_date, 'YYYY-MM-DD')=to_char(sysdate, 'YYYY-MM-DD') 

select pageNo,notice_no,notice_title,notice_date,emp_name,like_cnt from(
     select notice_no,notice_title,notice_content,like_cnt,notice_date,ceil(rownum/5) as pageNo, emp_name
      from(
      select b.notice_no,b.notice_title,like_cnt,b.notice_content,to_char(b.notice_date,'YYYY.MM.DD') as
      notice_date, e.emp_name
      from notice b, employee e 
      where b.emp_no=e.emp_no and  (b.notice_content like '%' || #{noticeTitle} || '%'  or notice_title like '%' || #{noticeTitle} || '%') order by b.notice_no desc) 
      ) where pageNo=#{pageNo}


--공지 시퀀스
create sequence notice_seq nocache
drop sequence notice_seq

insert into notice(notice_no,emp_no,notice_path,notice_date,notice_title,notice_content)
values(notice_seq.nextval,'1742','1',sysdate,'안녕','그그래');
insert into notice(notice_no,emp_no,notice_path,notice_date,notice_title,notice_content)
values(notice_seq.nextval,'1742','1',sysdate,'안녕','그그래');




--공지 테스트
insert into notice(notice_no,emp_no,notice_date,notice_title,notice_content)
values(notice_seq.nextval,'0581',sysdate,'홍홍','호옹');

insert into notice(notice_no,emp_no,notice_date,notice_title,notice_content)
values(notice_seq.nextval,'0581',sysdate,'올안','올안짱');


--일정
CREATE TABLE schedule(
sch_no number PRIMARY KEY,
emp_no varchar2(100) not null,
sch_content varchar2(100),
sch_day date not null,
constraint fk_schedule_emp_no foreign key(emp_no) references employee
)
select * from schedule
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(28,'0581','새벽',sysdate);
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(29,'0581','진짜',sysdate);
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(27,'0581','개졸림',sysdate);
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(18,'0581','저녁',sysdate);
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(schedule_seq.nextVal,'0581','저녁',sysdate);

insert into schedule(sch_no,emp_no,sch_content,sch_day) values(32,'9999','저녁','2016-07-06');

--내 일정 수 체크
select count(sch_no) 
from schedule 
where emp_no='9999' and  to_char(sch_day, 'YYYY-MM-DD')=to_char(sysdate, 'YYYY-MM-DD') 

create sequence schedule_seq start with 30 nocache 
drop sequence schedule_seq

update tablename set col1=val1 where condition

select * from schedule where to_char(sch_day, 'YYYY-MM-DD')=to_char(sysdate, 'YYYY-MM-DD') and emp_no='0581'
select * from schedule where to_char(sch_day, 'YYYY-MM-DD')=to_char(sysdate, 'YYYY-MM-DD') and emp_no='0581' and sch_no=3
update schedule set sch_content='점심' where sch_no=6 and emp_no='0581'
delete schedule where condition


SELECT TO_CHAR(SYSDATE,'IW') FROM DUAL 
select (sysdate+7)-next_day(sysdate,1)+1 from dual;

SELECT NEXT_DAY((TRUNC(SYSDATE,'MM')-1),'월') FROM DUAL

SELECT TO_DATE( TRUNC(SYSDATE, 'IW') + ( LEVEL - 1 ) ) DD 
FROM	DUAL 
CONNECT BY LEVEL < 7;

/*요일별 쿼리*/
select s.sch_no,s.emp_no,s.sch_content,s.sch_day,to_char(s.sch_day, 'DAY') DAY 
from SCHEDULE s , 
(SELECT TO_char( TRUNC(SYSDATE, 'IW') + ( LEVEL - 1 ), 'YYYY-MM-DD' ) day 
FROM	DUAL 
CONNECT BY LEVEL < 7) d
where d.day=to_char(s.sch_day, 'YYYY-MM-DD') order by s.sch_day 

--요일의 날짜 찾기(일요일 = 1번,  월요일 = 2번, 화요일 = 3번)
select decode(to_char(sysdate, 'D'), 1, to_char(sysdate, 'YYYYMMDD'),
to_char(sysdate - to_char(sysdate, 'D')+1, 'YYYYMMDD') ) last_sunday
from dual;

select to_char(sysdate, 'D') from dual
select to_char(sysdate - to_char(sysdate, 'D')+1, 'YYYYMMDD') from dual 

SELECT TO_char( TRUNC(SYSDATE, 'IW') + ( LEVEL - 1 ), 'YYYY-MM-DD' ) day 
FROM	DUAL 
CONNECT BY LEVEL < 7;

/*주차뽑기*/
SELECT TRUNC(sysdate, 'iw') + LEVEL - 1 dt_date 
, TO_CHAR(TRUNC(sysdate, 'iw') + LEVEL - 1, 'yyyymmdd') dt_string 
FROM dual CONNECT BY LEVEL <= 6 

/*월별 일정(6월)*/
select * from SCHEDULE  where to_char(sch_day, 'MM')=6

		select sch_no,emp_no,sch_content,sch_day
		from SCHEDULE  
		where to_char(sch_day, 'MM')=6
		
--월간 일정
CREATE TABLE month(
month number PRIMARY KEY,
emp_no varchar2(100) not null,
month_content varchar2(100),
constrxaint fk_month_emp_no foreign key(emp_no) references employee
)

--자유 게시판
CREATE TABLE BOARD(
  board_no number primary key,
  emp_no varchar2(100) not null,
  board_title varchar2(100) not null,
  board_content clob not null,
  board_date date not null,
  board_path varchar2(100),
  like_cnt number default 0,
  constraint fk_board_emp_no foreign key(emp_no) references employee(emp_no)
)
--오늘 새로운 자게글
select count(board_no) from board
where to_char(board_date, 'YYYY-MM-DD')=to_char(sysdate, 'YYYY-MM-DD')

--외래키 추가
ALTER TABLE BOARD
ADD CONSTRAINT fk_board_emp_no FOREIGN KEY(emp_no)
 references employee(emp_no)
--자유 게시판 삭제
drop table board
--강제 삭제
DROP TABLE board CASCADE CONSTRAINTS PURGE;
--외래키 삭제
ALTER TABLE  BOARD
select * from board
DROP  CONSTRAINT  fk_board_emp_no
--자유 게시판 예제
insert into board(board_no,emp_no, board_title, board_content,board_date,like_cnt) values
      (board_seq.nextval, '0581','재홍', '바보', sysdate,'1');
insert into board(board_no,emp_no, board_title, board_content,board_date,like_cnt) values
      (board_seq.nextval, '0581','병우', '짱짱', sysdate,'1');
insert into board(board_no,emp_no, board_title, board_content,board_date,like_cnt) values
      (board_seq.nextval, '0581','진용', '짱짱', sysdate,'1');
insert into board(board_no,emp_no, board_title, board_content,board_date,like_cnt) values
      (board_seq.nextval, '0581','원두형', '짱짱맨', sysdate,'1');
insert into board(board_no,emp_no, board_title, board_content,board_date,like_cnt) values
      (board_seq.nextval, '0581','상우형', '짱짱', sysdate,'1');
insert into board(board_no,emp_no, board_title, board_content,board_date,like_cnt) values
      (board_seq.nextval, '0581','흥택이형', '바보', sysdate,'1');
create sequence board_seq nocache
drop sequence board_seq

--건의사항
CREATE TABLE RECOMMEND(
  rec_no number primary key,
  emp_no varchar2(100) not null,
  rec_title varchar2(100) not null,
  rec_content clob not null,
  rec_date date not null,
  rec_path varchar2(100),
  constraint fk_recommend_emp_no foreign key(emp_no) references employee(emp_no)
)
--건의사항 시퀀스
create sequence recommend_seq nocache
--건의사항 삭제
drop table RECOMMEND

--좋아요
CREATE TABLE GOOD(
board_no number not null,
emp_no varchar2(100) not null,
constraint fk_GOOD_board_no foreign key(board_no) references board,
constraint fk_GOOD_emp_no foreign key(emp_no) references employee,
constraint pk_GOOD primary key(board_no,emp_no)
)

--자유 게시판 댓글
CREATE TABLE COMMENT_BOARD(
comment_no number primary key,
board_no number not null,
emp_no varchar2(100) not null,
comment_content varchar2(30) not null,
comment_date date not null,
constraint fk_comment_board_board_no foreign key(board_no) references board on delete cascade,
constraint fk_comment_board_emp_no foreign key(emp_no) references employee 
)
create sequence comment_board_seq;

--건의 게시판 댓글
CREATE TABLE COMMENT_REC(
comment_no number primary key,
rec_no number not null,
emp_no varchar2(100) not null,
comment_content varchar2(30) not null,
comment_date date not null,
constraint fk_comment_rec_rec_no foreign key(rec_no) references recommend on delete cascade,
constraint fk_comment_rec_emp_no foreign key(emp_no) references employee 
)
create sequence comment_rec_seq nocache

-- 동아리 --
drop table club
create table club(
   club_no number primary key,
   emp_no varchar2(100) not null,
   club_name varchar2(100) not null,
   club_content clob not null,
   club_confirm number default 0,
   constraint fk_club_emp_no foreign key(emp_no) references employee
)
-- confirm 0 = 신청대기 , 1 = 개설 , 2 = 거절/폐설
drop sequence club_seq
create sequence club_seq nocache
select * from club;

-- 동아리 활동 게시판 --
drop table club_board
create table club_board(
   club_board_no number primary key,
   club_no number not null,
   club_board_title varchar2(100) not null,
   club_board_content clob not null,
   club_board_maxpeople number not null,
   club_board_date date not null,
   club_board_member number,
   constraint fk_club_board_club_no foreign key(club_no) references club
)
drop sequence club_board_seq
create sequence club_board_seq nocache
select * from club_board;

-- 동아리 회원 --
drop table club_member
create table club_member(
   club_no number not null,
   emp_no varchar2(100) not null,
   constraint pk_club_member primary key(club_no,emp_no)
)
select * from club_member

-- 동아리 활동 신청자 --
drop table club_applicant
create table club_applicant(
   club_board_no number not null,
   emp_no varchar2(100) not null,
   constraint pk_club_applicant primary key(club_board_no,emp_no)
)

--결산 시퀀스
drop sequence evaluation_seq
create sequence evaluation_seq nocache
drop table evaluation
-- 결산 
CREATE TABLE evaluation(
evaluation_no number primary key,
evaluation_title varchar2(100),
evaluation_content clob,
evaluation_date date not null,
emp_no varchar2(100) not null,
dept_no number not null,
position_no number,
constraint fk_eval_dept_no foreign key(dept_no) references department,
constraint fk_eval_position_no foreign key(position_no) references position
)