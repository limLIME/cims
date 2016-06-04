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

--직책
CREATE TABLE position(
position_no number PRIMARY KEY,
position_name varchar2(100) not null
)

--부서
CREATE TABLE department(
dept_no number PRIMARY KEY,
dept_name varchar2(100) not null
)

--결재 
drop table document
CREATE TABLE document(
doc_no number PRIMARY KEY,
emp_no varchar2(100) not null,
doc_title varchar2(100) not null,
doc_content clob not null,
doc_path varchar2(100),
doc_state varchar2(100) not null,
doc_count number not null,
constraint fk_doc_emp_no foreign key(emp_no) references employee
)

--메일
CREATE TABLE mail(
mail_no number PRIMARY KEY,
emp_no varchar2(100) not null,
mail_content varchar2(100) not null,
mail_sender varchar2(10) not null,
mail_receiver varchar2(10) not null,
mail_confirm number default 0,
constraint fk_mail_emp_no foreign key(emp_no) references employee
)

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

--일정
CREATE TABLE schedule(
sch_no number PRIMARY KEY,
emp_no varchar2(100) not null,
sch_content varchar2(100),
sch_day date not null,
constraint fk_schedule_emp_no foreign key(emp_no) references employee
)

--월간 일정
CREATE TABLE month(
month number PRIMARY KEY,
emp_no varchar2(100) not null,
month_content varchar2(100),
constraint fk_month_emp_no foreign key(emp_no) references employee
)

--자유 게시판
CREATE TABLE BOARD(
  board_no number primary key,
  emp_no varchar2(100) not null,
  board_title varchar2(100) not null,
  board_content clob not null,
  board_date date not null,
  board_path varchar2(100) not null,
  constraint fk_board_emp_no foreign key(emp_no) references employee(emp_no)
)

--건의사항
CREATE TABLE RECOMMEND(
  rec_no number primary key,
  emp_no varchar2(100) not null,
  rec_title varchar2(100) not null,
  rec_content clob not null,
  rec_date date not null,
  rec_path varchar2(100) not null,
  constraint fk_recommend_emp_no foreign key(emp_no) references employee(emp_no)
)

--좋아요
CREATE TABLE GOOD(
board_no number not null,
emp_no varchar2(100) not null,
constraint fk_GOOD_board_no foreign key(board_no) references board,
constraint fk_GOOD_emp_no foreign key(emp_no) references employee,
constraint pk_GOOD primary key(board_no,emp_no)
)