package com.itwill.shop.product; 
import java.sql.*; 
import java.util.ArrayList;
import java.util.List;

import com.itwill.db.RdbmsDao;


public class DogProductDao  extends RdbmsDao{
	
	public DogProductDao() {
	
	}
	public List<DogProduct> getDogs() { v    
		try{
			con=getConnection();
			String sql="select * from dogproduct";
			pstmt = con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			dogs = new ArrayList<DogProduct>();
			DogProduct dog = null;
			while(rs.next()){
				dog = new DogProduct();
				dog.setId(rs.getInt("id"));
				dog.setName(rs.getString("name"));
				dog.setDes(rs.getString("des"));
				dog.setPrice(rs.getInt("price"));
				
				dog.setImage(rs.getString("image"));
				dog.setClick(rs.getInt("click"));
				dogs.add(dog);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
				if(con!=null)
				releaseConnection(con);
			
		}
		return dogs;
	}
	public DogProduct getDog(String id) { 
		Connection con=null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		DogProduct dog = null;

		try{
			con=getConnection();
			String sql="select * from dogproduct where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id); 
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				dog = new DogProduct();
				dog.setId(rs.getInt("id"));
				dog.setName(rs.getString("name"));
				dog.setDes(rs.getString("des"));
				dog.setPrice(rs.getInt("price"));
				dog.setImage(rs.getString("image"));
				dog.setClick(rs.getInt("click"));
				}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con!=null)
			releaseConnection(con);
		
	   }
		return dog;
	}
	public boolean updateReadcount(String id) {
		Connection con=null;
		PreparedStatement pstmt = null; 
		boolean result = false;

		try{
			con=getConnection();
			String sql="update dogproduct set readcount = readcount+1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id); 
			int count =pstmt.executeUpdate();
			
			if(count > 0){ 
				result = true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con!=null)
			releaseConnection(con);
		
	   }
		return result;
	}
}