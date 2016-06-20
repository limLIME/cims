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
constraint fk_emp_dept_no foreign key(dept_no) references department,
constraint fk_emp_posi_no foreign key(position_no) references position
)
--선택
SELECT emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign 
FROM employee
where emp_no='0581' and password='1234'

select * from EMPLOYEE
--사원 추가
insert into 
employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('0581',1,1,'1234','임흥택','010-5114-0581','ok')
--사원 추가
insert into 
employee(emp_no,dept_no,position_no,password,emp_name,emp_tel,emp_sign) 
values('1742',1,1,'1234','박병우','010-5114-0581','ok')

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

--부서
CREATE TABLE department(
dept_no number PRIMARY KEY,
dept_name varchar2(100) not null
)
insert into department(dept_no,dept_name) values(1,'인사과')

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
doc_approver varchar2(100) not null,
doc_sign1 varchar2(100),
doc_sign2 varchar2(100),
doc_sign3 varchar2(100),
constraint fk_doc_emp_no foreign key(emp_no) references employee
)
drop sequence document_seq;
create sequence document_seq START WITH 10000;
 select*from mail
drop table mail
--메일
CREATE TABLE mail(
mail_no number PRIMARY KEY,
emp_no varchar2(100) not null,
mail_title varchar2(100) not null,
mail_content varchar2(100) not null,
mail_date date not null,
mail_path varchar2(100), 
mail_sender varchar2(10) not null,
mail_receiver varchar2(10) not null,
mail_confirm number default 0,
mail_state number default 0,
constraint fk_mail_emp_no foreign key(emp_no) references employee
)
create sequence mail_seq 
drop sequence mail_seq
-- 메일확인
-- 0읽지않음 1 읽음 2 수신자삭제 3 송신자삭제 4 둘다 삭제
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
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(5,'0581','점심',sysdate);
insert into schedule(sch_no,emp_no,sch_content,sch_day) values(7,'0581','저녁',sysdate);

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
where d.day=to_char(s.sch_day, 'YYYY-MM-DD')


SELECT TO_char( TRUNC(SYSDATE, 'IW') + ( LEVEL - 1 ), 'YYYY-MM-DD' ) day 
FROM	DUAL 
CONNECT BY LEVEL < 7;

/*주차뽑기*/
SELECT TRUNC(sysdate, 'iw') + LEVEL - 1 dt_date 
, TO_CHAR(TRUNC(sysdate, 'iw') + LEVEL - 1, 'yyyymmdd') dt_string 
FROM dual CONNECT BY LEVEL <= 6 

/*월별 일정(6월)*/
select * from SCHEDULE  where to_char(sch_day, 'MM')=6

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