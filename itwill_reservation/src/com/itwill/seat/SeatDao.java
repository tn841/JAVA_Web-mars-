package com.itwill.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.itwill.test.ConnectionFactory;
import com.itwill.util.RdbmsDao;

public class SeatDao extends RdbmsDao{
	private static SeatDao _seatInstance;
	
	public SeatDao() {
		System.out.println("SeatDao Constructor");
	}
	public static SeatDao getInstance(){
		if(_seatInstance==null){
			_seatInstance=new SeatDao();
		}
		return _seatInstance;
	}
	
	/*
	 * ���̺� �μ�Ʈ
	 */
	/*
	 * ���̺� ����
	 */
	/*
	 * ���̺� ����
	 */
	/*
	 * ���̺� ��ȣ�� ����
	 */
	public Seat findSeat(int seatNo) throws Exception{
		Seat seat=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//con = getConnection();
			con = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM SEAT WHERE S_NO=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seatNo);
			rs=pstmt.executeQuery();
			if(rs.next()){
				int no=rs.getInt("s_no");
				String cap=rs.getString("s_capacity");
				seat=new Seat(rs.getInt("s_no"),
							  rs.getString("s_loc"),
							  rs.getString("s_image"),
							  rs.getString("s_capacity")
							 );
			}
			
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return seat;
	}
	/*
	 * ��ü ���̺� �ҷ�����
	 */
	public ArrayList<Seat> findSeatList() throws Exception{
		ArrayList<Seat> seatList = new ArrayList<Seat>();
		Seat seat = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//con = getConnection();
			con = ConnectionFactory.getConnection();
			String sql = "SELECT * FROM SEAT";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				seat=new Seat(rs.getInt("s_no"),
						  rs.getString("s_loc"),
						  rs.getString("s_image"),
						  rs.getString("s_capacity")
						 );
				seatList.add(seat);
			}
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return seatList;
	}
	
	
}
