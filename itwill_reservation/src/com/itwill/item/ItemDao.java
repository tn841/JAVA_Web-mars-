package com.itwill.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.itwill.test.ConnectionFactory;
import com.itwill.util.RdbmsDao;


public class ItemDao extends RdbmsDao {
	private static ItemDao _itemInstance;
	//생성자 막기
	private ItemDao() {
		System.out.println("ItemDao Constructor");
	}
	//sington
	public static ItemDao getInstance(){
		if(_itemInstance == null){
			_itemInstance = new ItemDao();
		}
		return _itemInstance;
	}
	
	//아이템 만들기
	public boolean createItem(Item item) throws Exception{
		boolean isSuccess=false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//con=getConnection();
			con=ConnectionFactory.getConnection();
			/*
			 * I_NO , I_NAME , I_POINT,  I_IMAGE, I_DESC,  I_TYPE
			 */
			String sql = "INSERT INTO ITEM VALUES(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, item.getI_type());
			pstmt.setString(2, item.getI_name());
			pstmt.setInt(3, item.getI_point());
			pstmt.setString(4, item.getI_image());
			pstmt.setString(5, item.getI_desc());
			
			int result=pstmt.executeUpdate();
			if(result != 0) isSuccess = true;
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return isSuccess;
	}
	//번호로 아이템 한개 찾기
	public Item findItem(int itemType) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Item item = null;
		System.out.println("findItem 입성성공");
		try {
			//con = getConnection();
			con=ConnectionFactory.getConnection();
			String sql = "SELECT * FROM ITEM where I_TYPE=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemType);
			rs=pstmt.executeQuery();
			System.out.println("findItem 쿼리성공");
			if(rs.next()){
				item = new Item();
				item.setI_type(rs.getInt("i_type"));
				item.setI_name(rs.getString("i_name"));
				item.setI_point(rs.getInt("i_point"));
				item.setI_image(rs.getString("i_image"));
				item.setI_desc(rs.getString("i_desc"));
				
			}
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return item;
	}
	//아이템 여러개 찾기
	public ArrayList<Item> findItemList(int start, int last) throws Exception{
		ArrayList<Item> itemList = new ArrayList<Item>();
		Item item=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//con = getConnection();
			con=ConnectionFactory.getConnection();
			//String sql = "SELECT S.* FROM (SELECT ROWNUM IDX, I.* FROM ITEM I) S WHERE S.IDX >= 1 AND S.IDX <=3";
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT SS.*");
			sql.append(" FROM(SELECT ROWNUM IDX , S.* ");
			sql.append("	FROM (SELECT I_TYPE ,I_NAME,I_POINT,I_IMAGE,I_DESC");
			sql.append("		  FROM ITEM ");
			sql.append("		  ORDER BY I_TYPE  DESC ");
			sql.append("		 ) S");
			sql.append("	)SS");
			sql.append(" WHERE SS.IDX >=? AND SS.IDX <=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs=pstmt.executeQuery();
			while(rs.next()){
				item=new Item();
				item.setI_type(rs.getInt("i_type"));
				item.setI_name(rs.getString("i_name"));
				item.setI_image(rs.getString("i_image"));
				item.setI_desc(rs.getString("i_desc"));
				
				itemList.add(item);
			}
			
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return itemList;
	}
	
	// 아이템 수정 
	public boolean updateItem(Item item) throws Exception{
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//con = getConnection();
			con=ConnectionFactory.getConnection();
			String sql = "UPDATE ITEM SET I_NAME=?,I_POINT=?,I_IMAGE=?,I_DESC=? WHERE I_TYPE=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, item.getI_name());
			pstmt.setInt(2, item.getI_point());
			pstmt.setString(3, item.getI_image());
			pstmt.setString(4, item.getI_desc());
			pstmt.setInt(5, item.getI_type());
			
			int result = pstmt.executeUpdate();
			if(result != 0) isSuccess = true;
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return isSuccess;
	}
	
	// 아이템 삭제
	public boolean removeItem(int itemType) throws Exception{
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//con = getConnection();
			con=ConnectionFactory.getConnection();
			String sql = "DELETE FROM ITEM WHERE I_TYPE=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, itemType);
			int result = pstmt.executeUpdate();
			
			if(result != 0) isSuccess = true;
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				releaseConnection(con);
		}
		return isSuccess;
	}
	/*
	 * 아이템 구입 포인트 겟 
	 */
	public int getPoint(int itemType) throws Exception {
		Item item=findItem(itemType);
		return item.getI_point();
		
	}
	/*
	 * 총 포인트 값 메소드
	 */
	
	
	
	
	
	
	
	
	
	
}
