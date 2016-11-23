package com.itwill.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.itwill.board.RdbmsDao;
import com.itwill.test.ConnectionFactory;

public class ReservationDao extends RdbmsDao{
	private static ReservationDao _instance;
	private ReservationDao(){
		
	}
	
	public static ReservationDao getInstance(){
		if(_instance == null){
			_instance = new ReservationDao();
		}
		return _instance;
	}
	
	/*
	 * 새 예약 추가
	 */
	public int create(Reservation r) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updatedRow = 0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(ReservationSQL.insert);
			//(RESERVE_R_NO_SEQ.nextval,current_timestamp, current_timestamp, ?r_date, ?s_time, ?e_time, ?s_no, ?r_m_no)
			pstmt.setString(1, r.getR_date());	//예약 날짜
			pstmt.setString(2, r.getStart_time());	//시작 시간
			pstmt.setString(3, r.getEnd_time());	//끝 시간
			pstmt.setInt(4, r.getS_no()); 	//예약할 자리 설정
			pstmt.setInt(5, r.getR_m_no());	//예약자 설정
			
			updatedRow = pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			releaseConnection(conn);
		}
		return updatedRow;
	}
	
	/*
	 * 예약 상세정보(동반 구성원) 정보 입력
	 */
	public int insertRDetail(int r_no, int m_no, int master) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int temp = 0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(ReservationSQL.insert_detail);
			
			pstmt.setInt(1, r_no);
			pstmt.setInt(2, m_no);
			pstmt.setInt(3, master);
			temp = pstmt.executeUpdate();
		
		
	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			releaseConnection(conn);
		}
		return temp;
	}
	
	
	/*
	 *  Select Test 
	 */
	public ArrayList<HashMap<String, Object>> test() throws Exception{
		ArrayList<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement("select * from reserve_info");
			
			rs = pstmt.executeQuery();
					
			while(rs.next()){
				HashMap<String, Object> row = new HashMap<String, Object>();
				row.put("r_no", rs.getInt(1));
				row.put("r_s_time", rs.getString(2));
				
				rList.add(row);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return rList;
	}
	
	
	
	/*
	 * 예약 전체 정보 select
	 */
	public ArrayList<HashMap<String, Object>> selectAll() throws Exception{
		ArrayList<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(ReservationSQL.select_all);
			
			rs = pstmt.executeQuery();
					
			while(rs.next()){
				HashMap<String, Object> row = new HashMap<String, Object>();
				row.put("r_no", rs.getInt(1));
				row.put("enroll_time", rs.getString(2));
				row.put("modify_time", rs.getString(3));	
				row.put("r_date", rs.getString(4));
				row.put("r_s_time", rs.getString(5));
				row.put("r_e_time", rs.getString(6));
				row.put("s_no", rs.getInt(7));
				row.put("r_m_no", rs.getInt(8));
				row.put("r_detail_no", rs.getInt(9));
				row.put("r_no_1", rs.getInt(10));
				row.put("m_no", rs.getInt(11));
				row.put("master", rs.getInt(12));
			
				
				rList.add(row);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return rList;
	}
	
	
	/*
	 * 예약번호로 예약 정보 select
	 */
	public ArrayList<HashMap<String, Object>> selectByRno(int r_no) throws Exception{
		ArrayList<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(ReservationSQL.select_by_rno);
			pstmt.setInt(1, r_no);
			rs = pstmt.executeQuery();

			while(rs.next()){
				HashMap<String, Object> row = new HashMap<String, Object>();
				row.put("r_no", rs.getInt(1));
				row.put("enroll_time", rs.getString(2));
				row.put("modify_time", rs.getString(3));	
				row.put("r_date", rs.getString(4));
				row.put("r_s_time", rs.getString(5));
				row.put("r_e_time", rs.getString(6));
				row.put("s_no", rs.getInt(7));
				row.put("r_m_no", rs.getInt(8));
				row.put("r_detail_no", rs.getInt(9));
				row.put("r_no_1", rs.getInt(10));
				row.put("m_no", rs.getInt(11));
				row.put("master", rs.getInt(12));
				
				rList.add(row);
			}			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return rList;
	}
	
	/*
	 * 특정 회원이 예약한 예약 정보 select (no join)
	 */
	public int selectByRmnoNojoin(int r_m_no) throws Exception{
		int r_no = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(ReservationSQL.select_by_rmon_nojoin);
			pstmt.setInt(1, r_m_no);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			r_no = rs.getInt(1);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return r_no;
	}
	
	
	
	/*
	 * 특정 회원이 예약한 예약정보 select
	 */
	public ArrayList<HashMap<String, Object>> selectByRmno(int r_m_no) throws Exception{
		ArrayList<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(ReservationSQL.select_by_rmno);
			pstmt.setInt(1, r_m_no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				HashMap<String, Object> row = new HashMap<String, Object>();
				row.put("r_no", rs.getInt(1));
				row.put("enroll_time", rs.getString(2));
				row.put("modify_time", rs.getString(3));	
				row.put("r_date", rs.getDate(4));
				row.put("r_s_time", rs.getDate(5));
				row.put("r_e_time", rs.getDate(6));
				row.put("s_no", rs.getInt(7));
				row.put("r_m_no", rs.getInt(8));
				row.put("r_detail_no", rs.getInt(9));
				row.put("r_no_1", rs.getInt(10));
				row.put("m_no", rs.getInt(11));
				row.put("master", rs.getInt(12));
				
				rList.add(row);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return rList;
	}
	
	
	/*
	 * 특정 회원과 함께 예약한 동반자 정보 select - selectByRmno 메소드로 대체 가능
	 */
	
	
	/*
	 * 특정 회원이 예약한 예약 정보 delete
	 */
	public int deleteByRmno(int r_m_no) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deletedRows = 0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(ReservationSQL.delete_by_Rmno);
			
			pstmt.setInt(1, r_m_no);
			deletedRows = pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			releaseConnection(conn);
		}
		return deletedRows;
	}
	
	/*
	 * 특정 회원이 예약한 예약 정보 delete
	 */
	public int deleteByRno(int r_no) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deletedRows = 0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(ReservationSQL.delete_by_Rno);
			
			pstmt.setInt(1, r_no);
			deletedRows = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			releaseConnection(conn);
		}
		return deletedRows;
	}
	/*
	 * 특정 회원의 좌석 정보 수정
	 */
	public int updateSeatByRmno(int r_no, int s_no) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(ReservationSQL.update_s_no_by_rno);
			
			pstmt.setInt(1, s_no);
			pstmt.setInt(2, r_no);
			rows = pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			releaseConnection(conn);
		}
		return rows;
	}
	/*
	 * 특정 회원의 예약의 끝나는 시간을 수정
	 */
	public int updateSeatByRmnoET(long date, int login_m_no) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(ReservationSQL.update_s_no_by_rnoET);
			
			pstmt.setLong(1, date);
			pstmt.setInt(2, login_m_no);
			rows = pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			releaseConnection(conn);
		}
		return rows;
	}
	
	/*
	 * 특정 자리에 예약된 회원들의 정보 
	 */
	public ArrayList<HashMap<String, Object>> select_members_by_sno(int s_no) throws Exception{
		System.out.println("인자의 예약좌석:"+s_no);
		ArrayList<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			System.out.println("쿼리입성");
			//con = getConnection();
			con=ConnectionFactory.getConnection();
			pstmt = con.prepareStatement(ReservationSQL.select_members_by_sno);
			pstmt.setInt(1, s_no);
			rs = pstmt.executeQuery();
			System.out.println(rs.next());
			while(rs.next()){
				HashMap<String, Object> row = new HashMap<String, Object>();
				row.put("r_m_no", rs.getInt(1));
				row.put("m_no", rs.getInt(2));
				row.put("m_id", rs.getString(3));
				row.put("m_name", rs.getString(4));	
					
				rList.add(row);
				System.out.println("와일문 완성");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return rList;
	}
	
	
	/*
	 * 예약된 좌석 출력
	 */
	public ArrayList<String> selectAllSeat() throws Exception{
		ArrayList<String> rList = new ArrayList<String>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = getConnection();
			pstmt = con.prepareStatement(ReservationSQL.select_reserved_sno);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				rList.add(Integer.toString(rs.getInt(1)));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			releaseConnection(con);
		}
		
		return rList;
	}
	
	public void deleteAll() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		int deletedRowsDetail = 0;
		int deletedRowInfo = 0;
		try{
			conn = getConnection();
			pstmt1 = conn.prepareStatement(ReservationSQL.delete_reserve_detail);
			deletedRowsDetail = pstmt1.executeUpdate();
			pstmt2 = conn.prepareStatement(ReservationSQL.delete_reserve_info);
			deletedRowInfo = pstmt2.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt1.close();
			pstmt2.close();
			releaseConnection(conn);
		}
	}
}
