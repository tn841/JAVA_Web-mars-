


--ȸ�� �߰�
DROP Table member;
DROP SEQUENCE Member_m_no_SEQ;
CREATE SEQUENCE Member_m_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
INSERT INTO MEMBER VALUES (MEMBER_M_NO_SEQ.nextval, '111', '1111', 'ȸ��'||MEMBER_M_NO_SEQ.currval, '010-0000-0000', 'ȸ��@ȸ��.com', TO_DATE('1990-10-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '����� ������ ���ﵿ', 2, 1000);
select * from member;


--�ڸ� �߰�
desc seat;
drop sequence SEAT_S_NO_SEQ;
drop table seat;
CREATE SEQUENCE SEAT_S_NO_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
INSERT INTO SEAT VALUES (SEAT_S_NO_SEQ.nextval, 15, 'img/'||SEAT_S_NO_SEQ.currval||'.png', 4);
select * from seat;


--���� �߰�
desc reserve_info;
drop sequence RESERVE_R_NO_SEQ;
CREATE SEQUENCE RESERVE_R_NO_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
select * from reserve_info;
/*
�̸�          ��        ����           
----------- -------- ------------ 
R_NO        NOT NULL NUMBER(10)   
ENROLL_TIME          TIMESTAMP(6) 
MODIFY_TIME          TIMESTAMP(6) 
R_DATE               DATE         
R_S_TIME             TIMESTAMP(6) 
R_E_TIME             TIMESTAMP(6) 
S_NO                 NUMBER(10)   
R_M_NO               NUMBER(10)   */
insert into reserve_info values(RESERVE_R_NO_SEQ.nextval,current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, 3, 1); --3���ڸ� �����ڴ� 1�� 

insert into reserve_info values(RESERVE_R_NO_SEQ.nextval, current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, 2, 10); --2���ڸ� �����ڴ� 10�� 

insert into reserve_info values(RESERVE_R_NO_SEQ.nextval, current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, 4, 99); --4���ڸ� �����ڴ� 99�� 



--���� ���� ����
desc reserve_detail;
drop sequence rd_r_no_seq;
CREATE SEQUENCE rd_r_NO_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;
select * from reserve_detail;
/*
�̸�          ��        ����         
----------- -------- ---------- 
R_DETAIL_NO NOT NULL NUMBER(10) 
R_NO                 NUMBER(10) 
M_NO                 NUMBER(10) 
MASTER               NUMBER(10) 
*/
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 1, 1);  --1������, 1�� ȸ��, master
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 2, 0);  --1������, 2�� ȸ��, 0
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 4, 0);  --1������, 4�� ȸ��, 0

insert into reserve_detail values(rd_r_no_seq.nextval, 2, 10, 1);  --2������, 10�� ȸ��, master
insert into reserve_detail values(rd_r_no_seq.nextval, 2, 8, 0);  --2������, 8�� ȸ��, 0
insert into reserve_detail values(rd_r_no_seq.nextval, 2, 11, 0);  --2������, 11�� ȸ��, 0
insert into reserve_detail values(rd_r_no_seq.nextval, 2, 3, 0);  --2������, 3�� ȸ��, 0

insert into reserve_detail values(rd_r_no_seq.nextval, 3, 99, 1);  --3������, 99�� ȸ��, master
insert into reserve_detail values(rd_r_no_seq.nextval, 3, 12, 0);  --3������, 12�� ȸ��, 0

commit;
-- ��� ���� ����
select r.r_no r_no, r.R_DATE r_date, r.ENROLL_TIME enroll_time, r.MODIFY_TIME modify_time, r.R_S_TIME start_time, r.R_E_TIME end_time, r.S_NO seat_no, r.R_M_NO r_m_no, rd.R_DETAIL_NO rd_no, rd.R_NO rserve_no, rd.M_NO member_no, rd.MASTER master from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO;  

-- ���� ��ȣ�� ���� ���� ���
select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO where r.r_no = 1; 

-- Ư�� ȸ���� ������ ���� ����
select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO where r.R_M_NO = 99; 

-- Ư�� ȸ���� �Բ� ������ ������ ����
select rd.M_NO
from reserve_info r join reserve_detail rd on r.R_no = rd.r_no
where rd.MASTER = 0 and r.R_M_NO = 10;

-- Ư�� ȸ���� ������ ���� ���� ����
delete from reserve_info where r_m_no = 1;

-- Ư�� ������ ������ ����, �߰�
delete from RESERVE_DETAIL where m_no = 2 and master = 0;
insert into reserve_detail values(rd_r_no_seq.nextval, 1, 2, 0);  --�����ȣ 1, ȸ����ȣ 2, master 0 


-- ���� ���� ����
  -- 1. ���� �ڸ�
  update reserve_info set s_no = 1 where r_no = 2;  --�����ȣ 2���� ���� �ڸ��� 3���� ����

  -- 2. �����ð� ����
  update reserve_info set MODIFY_TIME = current_timestamp where r_no = 2;
  
  -- 3. ���� �ð�, ��¥ ����
  /*
  TO_DATE('2016/10/10 03:45:45','YYYY/MM/DD HH24:MI:SS'),
  TO_TIMESTAMP('2016/10/10 03:45:45.123456789','YYYY/MM/DD HH24:MI:SS.FF9'));
  */
  update reserve_info set r_s_time = TO_TIMESTAMP('2016/10/10 03:45:45.123456789','YYYY/MM/DD HH24:MI:SS.FF9') ,r_e_time = TO_TIMESTAMP('2016/10/10 04:45:45.123456789','YYYY/MM/DD HH24:MI:SS.FF9')   where r_no = 2;
  update reserve_info set r_date = TO_DATE('2016/10/10','YYYY/MM/DD')  where r_no = 2;
  

-- Ư�� �ڸ��� ����� ȸ�� ����
select rd.M_NO, m.m_id, m.m_name  from reserve_info r join reserve_detail rd on r.r_no = rd.r_no join MEMBER m on rd.m_no = m.m_no where s_no = 1;


select * from reserve_info;

select * from IORDER;

select r_no, r_s_time from reserve_info;

