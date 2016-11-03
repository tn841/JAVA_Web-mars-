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
			Class.forName(driver); // httpServlet을 상속 받았기 때문에 예외처리 범위가 같거나 더 좁게만 throw할 수 있다. -> try-catch로 예외처리
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from address where no="+no);
				
			rs.next();
			/**********************************************************/
			out.println("<h1> "+rs.getString("name")+"님의 정보 수정 </h1><hr>");
			out.println("<form action='address_update.do' method='post'>");
			out.println("<input type='hidden' name='no'  value='"+rs.getInt("no")+"' ><br>");
			out.println("아이디 : <input type='text' name='id' value='"+rs.getString("id")+"'><br>");
			out.println("이름 : <input type='text' name='name' value='"+rs.getString("name")+"'><br>");
			out.println("전화번호 : <input type='text' name='phone' value='"+rs.getString("phone")+"'><br>");
			out.println("주소 : <input type='text' name='addr' value='"+rs.getString("address")+"'></br>");
			out.println("<input type='submit' value='수정'>");
			out.println("</form>");
			
			//response.sendRedirect("address_detail.do?no="+no);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
