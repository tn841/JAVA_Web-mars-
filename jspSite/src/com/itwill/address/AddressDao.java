package com.itwill.address;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 DAO(Data Access Object)
  - DataSource(DB,File,기존시스템)의 연결작업을 한다.
  - address table에 접근해서 Cread Read Update Delete(CRUD)
    에를 하는 단위메쏘드를 가지고있는 클래스
  - 비지니스객체(Service,Manager)가 사용해서 업무를 구현   
 */
public class AddressDao {
	
	public int insert(int no, String id, String name, String phone, String address) throws Exception {
		String driverClass = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@210.16.214.203:1521:XE";
		String user = "user21";
		String pass = "user21";
		// String insertSQL="insert into
		// address(88,'ccc','KIM','010-555-9999','서울시 개봉동')";
		String insertSQL = "insert into address values(?,?,?,?,?)";
		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, pass);

		PreparedStatement pstmt = con.prepareStatement(insertSQL);
		pstmt.setInt(1, no);
		pstmt.setString(2, id);
		pstmt.setString(3, name);
		pstmt.setString(4, phone);
		pstmt.setString(5, address);
		int insertRowCount = pstmt.executeUpdate();
		System.out.println(">>>" + insertRowCount + " 행 insert..");
		pstmt.close();
		con.close();
		return insertRowCount;
	}

	public int insert(AddressDTO addressDTO) throws Exception {
		String driverClass = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@210.16.214.203:1521:XE";
		String user = "user21";
		String pass = "user21";
		// String insertSQL="insert into
		// address(88,'ccc','KIM','010-555-9999','서울시 개봉동')";
		String insertSQL = "insert into address values(?,?,?,?,?)";
		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, pass);

		PreparedStatement pstmt = con.prepareStatement(insertSQL);
		pstmt.setInt(1, addressDTO.getNo());
		pstmt.setString(2, addressDTO.getId());
		pstmt.setString(3, addressDTO.getName());
		pstmt.setString(4, addressDTO.getPhone());
		pstmt.setString(5, addressDTO.getAddress());
		int insertRowCount = pstmt.executeUpdate();
		System.out.println(">>>" + insertRowCount + " 행 insert..");
		pstmt.close();
		con.close();
		return insertRowCount;
	}
	
	public AddressDTO selectOne(int no) throws Exception {
		AddressDTO findAddress = null;

		String driverClass = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@210.16.214.203:1521:XE";
		String user = "user21";
		String pass = "user21";
		String selectSQL = "select no,id,name,phone,address from address where no=" + no;

		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, pass);
		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery(selectSQL);

		if (rs.next()) {
			int n = rs.getInt("no");
			String id = rs.getString("id");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			findAddress = new AddressDTO(no, id, name, phone, address);
		} else {
			findAddress = null;
		}

		rs.close();
		stmt.close();
		con.close();
		return findAddress;
	}

	public ArrayList<AddressDTO> selectAll() throws Exception{
		ArrayList<AddressDTO> addressList=new ArrayList<AddressDTO>();
		String driverClass = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@210.16.214.203:1521:XE";
		String user = "user21";
		String pass = "user21";
		String selectSQL = "select no,id,name,phone,address from address order by no asc";

		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, pass);
		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery(selectSQL);

		while(rs.next()){
			int no = rs.getInt("no");
			String id = rs.getString("id");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String address = rs.getString("address");
			AddressDTO tempAddress = 
					new AddressDTO(no, id, name, phone, address);
			addressList.add(tempAddress);
		}

		rs.close();
		stmt.close();
		con.close();
		return addressList;
	}

	public int delete(int deleteNo) throws Exception {
		String driverClass = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@210.16.214.203:1521:XE";
		String user = "user21";
		String pass = "user21";
		String deleteSQL = "delete from address where no =" + deleteNo;
		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, pass);
		Statement stmt = con.createStatement();
		int deleteRowCounts = stmt.executeUpdate(deleteSQL);
		System.out.println(">>>" + deleteRowCounts + " 행(들) delete..");
		return deleteRowCounts;
	}

	public int update(AddressDTO updateAddress) throws Exception {
		String driverClass = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@210.16.214.203:1521:XE";
		String user = "user21";
		String pass = "user21";
		// String updateSQL =
		// "update address set id='aaa',name='유영상',phone='888-8888',address='충남
		// 태안' where no=0";
		String updateSQL = "update address set id='" + updateAddress.getId() + "'," + "name='" + updateAddress.getName()
				+ "'," + "phone='" + updateAddress.getPhone() + "'," + "address='" + updateAddress.getAddress() + "' "
				+ "where no=" + updateAddress.getNo();

		Class.forName(driverClass);
		Connection con = DriverManager.getConnection(url, user, pass);
		Statement stmt = con.createStatement();
		int updateRowCounts = stmt.executeUpdate(updateSQL);
		System.out.println(">>>" + updateRowCounts + " 행(들) update..");
		return updateRowCounts;
	}
}
