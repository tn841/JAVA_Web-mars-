package com.itwill.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddressDeleteServlet
 */
@WebServlet("/addr_delete.do")
public class AddressDeleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		try{
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver); // httpServlet�� ��� �޾ұ� ������ ����ó�� ������ ���ų� �� ���Ը� throw�� �� �ִ�. -> try-catch�� ����ó��
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			String sql = "delete from address where no=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			pstmt.executeQuery();
			
			/**********************************************************/
			
			
			resp.sendRedirect("address_list.do");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
