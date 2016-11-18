--insert
INSERT INTO iOrder (j_no, m_no, j_date, j_desc) VALUES (Jumun_j_no_SEQ.nextval, 1, sysdate, '뺏기외 1종');
INSERT INTO iOrder (j_no, m_no, j_date, j_desc) VALUES (Jumun_j_no_SEQ.nextval, 2, sysdate, '막기외 1종');

INSERT INTO iOrder_detail (jd_no, i_no, jd_quantity, jd_tot, j_no) VALUES (jd_jd_no_SEQ.nextval, 1, 1, 1000, 1);
INSERT INTO iOrder_detail (jd_no, i_no, jd_quantity, jd_tot, j_no) VALUES (jd_jd_no_SEQ.nextval, 2, 1, 1000, 1);
INSERT INTO iOrder_detail (jd_no, i_no, jd_quantity, jd_tot, j_no) VALUES (jd_jd_no_SEQ.nextval, 1, 1, 1000, 2);
INSERT INTO iOrder_detail (jd_no, i_no, jd_quantity, jd_tot, j_no) VALUES (jd_jd_no_SEQ.nextval, 2, 1, 1000, 2);
--select
select j_no, m_no, j_date, j_desc, jd_no, i_no, jd_quantity, jd_tot from iorder natural join iorder_detail where iorder.m_no=1;
--update
update IORDER_DETAIL set jd_quantity=2, jd_tot=2000 where jd_no=1;
--delete
delete from IORDER_DETAIL where jd_no=2
delete from IORDER where j_no=2