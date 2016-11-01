package com.itwill.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/address_insert.do")
public class AddressInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("05-04.address_insert_form.html");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		//1. �Ķ���� �ޱ�
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id	= request.getParameter("id");
		String addr = request.getParameter("addr");
		
	
		
		//2. DB �۾�
		try {
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			String sql = "insert into address values(addr_no_seq2.nextval, ?, ?, ?, ?)";
			Class.forName(driver); // httpServlet�� ��� �޾ұ� ������ ����ó�� ������ ���ų� �� ���Ը� throw�� �� �ִ�. -> try-catch�� ����ó��
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			
			pstmt.execute();			
			/**********************************************************/
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//3. �����̷�Ʈ
		response.sendRedirect("address_list.do");
	}

}
