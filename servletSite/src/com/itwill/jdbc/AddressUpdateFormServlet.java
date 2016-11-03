package com.itwill.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class AddressUpdateServlet
 */
@WebServlet("/addr_update.form")
public class AddressUpdateFormServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("euc-kr");
		String no = request.getParameter("no");
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		
		
		
		try{
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver); // httpServlet�� ��� �޾ұ� ������ ����ó�� ������ ���ų� �� ���Ը� throw�� �� �ִ�. -> try-catch�� ����ó��
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from address where no="+no);
				
			rs.next();
			/**********************************************************/
			out.println("<h1> "+rs.getString("name")+"���� ���� ���� </h1><hr>");
			out.println("<form action='address_update.do' method='post'>");
			out.println("<input type='hidden' name='no'  value='"+rs.getInt("no")+"' ><br>");
			out.println("���̵� : <input type='text' name='id' value='"+rs.getString("id")+"'><br>");
			out.println("�̸� : <input type='text' name='name' value='"+rs.getString("name")+"'><br>");
			out.println("��ȭ��ȣ : <input type='text' name='phone' value='"+rs.getString("phone")+"'><br>");
			out.println("�ּ� : <input type='text' name='addr' value='"+rs.getString("address")+"'></br>");
			out.println("<input type='submit' value='����'>");
			out.println("</form>");
			
			//response.sendRedirect("address_detail.do?no="+no);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
