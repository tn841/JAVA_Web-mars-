


--회원 추가
DROP Table member;
DROP SEQUENCE Member_m_no_SEQ;
CREATE SEQUENCE Member_m_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
INSERT INTO MEMBER VALUES (MEMBER_M_NO_SEQ.nextval, '111', '1111', '회원'||MEMBER_M_NO_SEQ.currval, '010-0000-0000', '회원@회원.com', TO_DATE('1990-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '서울시 강남구 역삼동', 2, 1000);
select * from member;


--자리 추가
desc seat;
drop sequence SEAT_S_NO_SEQ;
drop table seat;
CREATE SEQUENCE SEAT_S_NO_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
INSERT INTO SEAT VALUES (SEAT_S_NO_SEQ.nextval, 15, 'img/'||SEAT_S_NO_SEQ.currval||'.png', 4);
select * from seat;


--예약 추가
desc reserve_info;
drop sequence RESERVE_R_NO_SEQ;
CREATE SEQUENCE RESERVE_R_NO_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
select * from reserve_info;
/*
이름          널        유형           
----------- -------- ------------ 
R_NO        NOT NULL NUMBER(10)   
ENROLL_TIME          TIMESTAMP(6) 
MODIFY_TIME          TIMESTAMP(6) 
R_DATE               DATE         
R_S_TIME             TIMESTAMP(6) 
R_E_TIME             TIMESTAMP(6) 
S_NO                 NUMBER(10)   
R_M_NO               NUMBER(10)   */
insert into reserve_info values(RESERVE_R_NO_SEQ.nextval,current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, 3, 1); --3번자리 예약자는 1번 

insert into reserve_info values(RESERVE_R_NO_SEQ.nextval, current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, 2, 10); --2번자리 예약자는 10번 

insert into reserve_info values(RESERVE_R_NO_SEQ.nextval, current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, 4, 99); --4번자리 예약자는 99번 



--예약 세부 정보
desc reserve_detail;
drop sequence rd_r_no_seq;
CREATE SEQUENCE rd_r_NO_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
select * from reserve_detail;
/*
이름          널        유형         
----------- -------- ---------- 
R_DETAIL_NO NOT NULL NUMBER(10) 
R_NO                 NUMBER(10) 
M_NO                 NUMBER(10) 
MASTER               NUMBER(10) 
*/
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 1, 1);  --1번예약, 1번 회원, master
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 2, 0);  --1번예약, 2번 회원, 0
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 4, 0);  --1번예약, 4번 회원, 0

insert into reserve_detail values(rd_r_no_seq.nextval, 2, 10, 1);  --2번예약, 10번 회원, master
insert into reserve_detail values(rd_r_no_seq.nextval, 2, 8, 0);  --2번예약, 8번 회원, 0
insert into reserve_detail values(rd_r_no_seq.nextval, 2, 11, 0);  --2번예약, 11번 회원, 0
insert into reserve_detail values(rd_r_no_seq.nextval, 2, 3, 0);  --2번예약, 3번 회원, 0

insert into reserve_detail values(rd_r_no_seq.nextval, 3, 99, 1);  --3번예약, 99번 회원, master
insert into reserve_detail values(rd_r_no_seq.nextval, 3, 12, 0);  --3번예약, 12번 회원, 0

commit;
-- 모든 예약 정보
select r.r_no r_no, r.R_DATE r_date, r.ENROLL_TIME enroll_time, r.MODIFY_TIME modify_time, r.R_S_TIME start_time, r.R_E_TIME end_time, r.S_NO seat_no, r.R_M_NO r_m_no, rd.R_DETAIL_NO rd_no, rd.R_NO rserve_no, rd.M_NO member_no, rd.MASTER master from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO;  

-- 예약 번호로 예약 정보 출력
select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO where r.r_no = 1; 

-- 특정 회원이 예약한 예약 정보
select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO where r.R_M_NO = 99; 

-- 특정 회원과 함께 예약한 동반자 정보
select rd.M_NO
from reserve_info r join reserve_detail rd on r.R_no = rd.r_no
where rd.MASTER = 0 and r.R_M_NO = 10;

-- 특정 회원이 예약한 예약 정보 삭제
delete from reserve_info where r_m_no = 1;

-- 특정 예약의 동반인 삭제, 추가
delete from RESERVE_DETAIL where m_no = 2 and master = 0;
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 2, 0);  --예약번호 1, 회원번호 2, master 0 


-- 예약 정보 수정
  -- 1. 예약 자리
  update reserve_info set s_no = 1 where r_no = 2;  --예약번호 2번의 예약 자리를 3으로 변경

  -- 2. 수정시간 갱신
  update reserve_info set MODIFY_TIME = current_timestamp where r_no = 2;
  
  -- 3. 예약 시간, 날짜 수정
  /*
  TO_DATE('2016/10/10 03:45:45','YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/10/10 03:45:45.123456789','YYYY/MM/DD HH24:MI:SS.FF9'));
  */
  update reserve_info set r_s_time = TO_TIMESTAMP('2016/10/10 03:45:45.123456789','YYYY/MM/DD HH24:MI:SS.FF9') ,r_e_time = TO_TIMESTAMP('2016/10/10 04:45:45.123456789','YYYY/MM/DD HH24:MI:SS.FF9')   where r_no = 2;
  update reserve_info set r_date = TO_DATE('2016/10/10','YYYY/MM/DD')  where r_no = 2;
  

-- 특정 자리에 예약된 회원 정보
select rd.M_NO, m.m_id, m.m_name  from reserve_info r join reserve_detail rd on r.r_no = rd.r_no join MEMBER m on rd.m_no = m.m_no where s_no = 1;


select * from reserve_info;

select * from IORDER;

select r_no, r_s_time from reserve_info;

