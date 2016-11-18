package com.itwill.order;

public class OrderSQL {
	public static final String selectSQL="select j_no, m_no, j_date, j_desc, jd_no, i_no, jd_quantity, jd_tot from iorder natural join iorder_detail where iorder.m_no=?";
	public static final String selectOrderByJ_noSQL="select j_no, m_no, j_date, j_desc, jd_no, i_no, jd_quantity, jd_tot from iorder natural join iorder_detail where iorder.j_no=?";
	public static final String selectOrderByI_noSQL="select j_no, m_no, j_date, j_desc, jd_no, i_no, jd_quantity, jd_tot from iorder natural join iorder_detail where iorder_detail.i_no=?";
	
	public static final String insertOrderSQL="INSERT INTO iOrder (j_no, m_no, j_date, j_desc) VALUES (Jumun_j_no_SEQ.nextval, ?, sysdate, ?)";
	public static final String insertODSQL="INSERT INTO iOrder_detail (jd_no, i_no, jd_quantity, jd_tot, j_no) VALUES (jd_jd_no_SEQ.nextval, ?, ?, ?, ?)";
	
	public static final String updateSQL="update IORDER_DETAIL set jd_quantity=?, jd_tot=? where jd_no=?";
	
	public static final String deleteODSQL="delete from IORDER_DETAIL where jd_no=?";
	public static final String deleteOrderSQL="delete from IORDER where j_no=?";
}
