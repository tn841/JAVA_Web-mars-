package com.itwill.reservation;

public class ReservationSQL {
	public static final String insert = "insert into reserve_info values(RESERVE_R_NO_SEQ.nextval,current_timestamp, current_timestamp, sysdate, current_timestamp, current_timestamp, ?, ?)";
	public static final String insert_detail = "insert into reserve_detail values(rd_r_no_seq.nextval, ?, ?, ?)";
	
	public static final String select_all = "select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO";
	public static final String select_by_rno = "select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO where r.r_no = ?";
	public static final String select_by_rmno = "select * from reserve_info r join reserve_detail rd on r.R_NO = rd.R_NO where r.R_M_NO = ?";
	public static final String select_members_by_sno = "select rd.M_NO, m.m_id, m.m_name  from reserve_info r join reserve_detail rd on r.r_no = rd.r_no join MEMBER m on rd.m_no = m.m_no where s_no = ?";
	public static final String select_reserved_sno = "select s.s_no from Seat s join reserve_info r on s.S_NO = r.s_no";
	
	public static final String delete_by_Rmno = "delete from reserve_info where r_m_no = ?";
	public static final String update_s_no_by_rno = "update reserve_info set s_no = ?, modify_time = current_timestamp  where r_no = ?";
	
	public static final String update_rd = "";
}
