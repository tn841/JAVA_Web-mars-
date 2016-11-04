package com.itwill.guest;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GuestDao {
	/*
	 * READ ALL
	 */
	public ArrayList<Guest> selectAll() throws Exception {
		ArrayList<Guest> guestList = new ArrayList<Guest>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(GuestSQL.SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				guestList.add(new Guest(rs.getInt("guest_no"),
							rs.getString("guest_name"),
							rs.getString("guest_date"),
							rs.getString("guest_email"),
							rs.getString("guest_homepage"),
							rs.getString("guest_title"),
							rs.getString("guest_content")
						));
			}
			
		}catch(Exception e){
			System.out.println(e.getStackTrace());
		}finally{
			if(rs!=null){
				rs.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(con!=null){
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
		return guestList;
	}
	/*
	 * CREATE
	 * 
	 * 이름             널        유형             
		-------------- -------- -------------- 
		GUEST_NO       NOT NULL NUMBER(10)     
		GUEST_NAME     NOT NULL VARCHAR2(40)   
		GUEST_DATE     NOT NULL DATE           
		GUEST_EMAIL             VARCHAR2(50)   
		GUEST_HOMEPAGE          VARCHAR2(50)   
		GUEST_TITLE    NOT NULL VARCHAR2(100)  
		GUEST_CONTENT  NOT NULL VARCHAR2(4000) 
	 */
	public boolean insertGuest(Guest guest) throws Exception{
		boolean isSuccess = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(GuestSQL.INSERT);
			//insert into GUEST values(guest_no_seq.nextval , ?, sysdate, ?, ?, ?, ?
			
			pstmt.setString(1, guest.getGuest_name());
			pstmt.setString(2, guest.getGuest_email());
			pstmt.setString(3, guest.getGuest_homepage());
			pstmt.setString(4, guest.getGuest_title());
			pstmt.setString(5, guest.getGuest_content());
			
			int resultRow = pstmt.executeUpdate();
			
			if(resultRow == 1){
				isSuccess = true;
			}
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(con != null){
				ConnectionPool.getInstance().releaseConnection(con);
			}
			
		}
		
		return isSuccess;
	}
	/*
	 * READ ONE
	 */
	public Guest selectByNo(int no) throws Exception{
		Guest guest= new Guest();
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(GuestSQL.SELECT_BY_NO);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			rs.next();
		
			guest.setGuest_no(rs.getInt("guest_no"));
			guest.setGuest_name(rs.getString("guest_name"));
			guest.setGuest_date(rs.getString("guest_date"));
			guest.setGuest_email(rs.getString("guest_email"));
			guest.setGuest_homepage(rs.getString("guest_homepage"));
			guest.setGuest_title(rs.getString("guest_title"));
			guest.setGuest_content(rs.getString("guest_content"));			
			
		}finally{
			if(rs!=null){
				rs.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(con!=null){
				ConnectionPool.getInstance().releaseConnection(con);
			}
		}
		
		return guest;
	}
	/*
	 * DELETE
	 */
	public boolean deleteGuest(int no) throws Exception{
		boolean deleteOK=false;
		

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(GuestSQL.DELETE);
			/*
			 *	"delete from guest where guest_no = ?" 
			 */
			
			pstmt.setInt(1, no);
	
			
			int resultRow = pstmt.executeUpdate();
			
			System.out.println(no+"의 삭제 확인 : "+resultRow);
			
			if(resultRow == 1){
				deleteOK = true;
			}
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(con != null){
				ConnectionPool.getInstance().releaseConnection(con);
			}
			
		}
		
		return deleteOK;
	}
	/*
	 * UPDATE
	 */
	public boolean updateGuest(Guest guest) throws Exception{
		boolean updateOK=false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try{
			con = ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(GuestSQL.UPDATE);
			/*"update guest set GUEST_NAME=?, 
			 * 					GUEST_email=?,
			 * 					GUEST_homepage=?,
			 * 					GUEST_title=?,
			 * 					GUEST_content=? 
			 * where guest_no = ?";*/
			
			pstmt.setString(1, guest.getGuest_name());
			pstmt.setString(2, guest.getGuest_email());
			pstmt.setString(3, guest.getGuest_homepage());
			pstmt.setString(4, guest.getGuest_title());
			pstmt.setString(5, guest.getGuest_content());
			pstmt.setInt(6, guest.getGuest_no());
			
		
			
			int resultRow = pstmt.executeUpdate();
			
			System.out.println(guest.getGuest_no()+"의 업데이트 확인 : "+resultRow);
			
			if(resultRow == 1){
				updateOK = true;
			}
			
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(con != null){
				ConnectionPool.getInstance().releaseConnection(con);
			}
			
		}
		
		return updateOK;
	}

}










