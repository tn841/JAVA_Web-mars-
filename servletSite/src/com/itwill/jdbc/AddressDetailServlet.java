package com.itwill.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

/**
 * Servlet implementation class AddressDetailServlet
 */
@WebServlet("/address_detail.do")
public class AddressDetailServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		//1. 파라미터 받기
		String no = request.getParameter("no");
		
		
		//2. DB 작업
		try {
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver); // httpServlet을 상속 받았기 때문에 예외처리 범위가 같거나 더 좁게만 throw할 수 있다. -> try-catch로 예외처리
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			
			String sql = "select * from address where no = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString("id");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			String addr = rs.getString("address");
			
			/**********************************************************/
		
		
			//3. 응답 보내기
			out.println("<h1>"+name+"님 상세정보</h1><hr/>");
			out.println("<a href='address_list.do'>주소록리스트</a>&nbsp;&nbsp;");
			out.println("<a href='05-04.address_insert_form.html'>주소록쓰기폼</a>&nbsp;&nbsp;");
			out.println("<a href='addr_delete.do?no="+no+"'>삭제</a>&nbsp;&nbsp;");
			out.println("<a href='addr_update.form?no="+no+"'>수정</a>");
			out.println("<ol>");
			out.println("<li>번호:"+no+"</li>");
			out.println("<li>아이디:"+id+"</li>");
			out.println("<li>이름:"+name+"</li>");
			out.println("<li>전화번호:"+phone+"</li>");
			out.println("<li>주소:"+addr+"</li>");
			out.println("</ol>");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
