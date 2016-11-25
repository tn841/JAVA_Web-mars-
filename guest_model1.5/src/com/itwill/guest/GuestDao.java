package com.itwill.guest;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class GuestDao {
	/*
	 * READ ALL
	 */
	public ArrayList<Guest> selectAll() throws Exception {
		ArrayList<Guest> guestList = new ArrayList<Guest>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=ConnectionPool.getInstance().getConnection();
			pstmt=con.prepareStatement(GuestSQL.GUEST_SELECT_ALL);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				guestList.add(new Guest(
										rs.getInt("guest_no"),
										rs.getString("guest_name"),
										rs.getString("guest_date"),
										rs.getString("guest_email"),
										rs.getString("guest_homepage"),
										rs.getString("guest_title"),
										rs.getString("guest_content")
										)
						     );
			}
			
			
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				ConnectionPool.getInstance().releaseConnection(con);
		}
		return guestList;
	}
	/*
	 * CREATE
	 */
	public boolean insertGuest(Guest guest) throws Exception{
		boolean isSuccess = false;
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			con=ConnectionPool.getInstance().getConnection();
			pstmt=con.prepareStatement(GuestSQL.GUEST_INSERT);
			pstmt.setString(1, guest.guest_name);
			pstmt.setString(2, guest.guest_email);
			pstmt.setString(3, guest.guest_homepage);
			pstmt.setString(4, guest.guest_title);
			pstmt.setString(5, guest.guest_content);
			int insertRowCount=pstmt.executeUpdate();
			if(insertRowCount==1){
				isSuccess=true;
			}
		}catch(Exception e){
			e.printStackTrace();
			isSuccess=false;
		}finally {
			if(con!=null)
				ConnectionPool.getInstance().releaseConnection(con);
		}
		
		return isSuccess;
	}
	/*
	 * READ ONE
	 */
	public Guest selectByNo(int no) throws Exception{
		Guest guest=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=ConnectionPool.getInstance().getConnection();
			pstmt=con.prepareStatement(GuestSQL.GUEST_SELECT_BY_NO);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				guest=new Guest(
						rs.getInt("guest_no"),
						rs.getString("guest_name"),
						rs.getString("guest_date"),
						rs.getString("guest_email"),
						rs.getString("guest_homepage"),
						rs.getString("guest_title"),
						rs.getString("guest_content")
						);
			}
		}finally{
			if(con!=null)
				ConnectionPool.getInstance().releaseConnection(con);
		}
		return guest;
	}
	/*
	 * DELETE
	 */
	public boolean deleteGuest(int no){
		boolean deleteOK=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=ConnectionPool.getInstance().getConnection();
			pstmt = con.prepareStatement(GuestSQL.GUEST_DELETE);
			pstmt.setInt(1, no);
			int deleteRows=pstmt.executeUpdate();
			if(deleteRows==1){
				deleteOK = true;
			}
		}catch(Exception e){
			deleteOK=false;
			e.printStackTrace();
		}finally {
			if(con!=null){
				try {
					
					ConnectionPool.getInstance().releaseConnection(con);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		return deleteOK;
	}
	/*
	 * UPDATE
	 */
	public boolean updateGuest(Guest updateGuest){
		boolean updateOK=true;
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=ConnectionPool.getInstance().getConnection();
			pstmt=con.prepareStatement(GuestSQL.GUEST_UPDATE);
			pstmt.setString(1, updateGuest.guest_name);
			pstmt.setString(2, updateGuest.guest_email);
			pstmt.setString(3, updateGuest.guest_homepage);
			pstmt.setString(4, updateGuest.guest_title);
			pstmt.setString(5, updateGuest.guest_content);
			pstmt.setInt(6, updateGuest.guest_no);
			int updateRows=pstmt.executeUpdate();
			if(updateRows > 0){
				updateOK=true;
			}
		}catch(Exception e){
			updateOK=false;
			e.printStackTrace();
		}finally {
			if(con!=null){
				try {
					ConnectionPool.getInstance().releaseConnection(con);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return updateOK;
	}

}










