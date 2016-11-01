package com.itwill.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/address_list.do")
public class AddressListServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();

		try {
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver); // httpServlet을 상속 받았기 때문에 예외처리 범위가 같거나 더 좁게만 throw할 수 있다. -> try-catch로 예외처리
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from address order by no desc");
			/**********************************************************/
			
			

			out.println("<html>");
			out.println("<head>");
			out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"com.css\">");

			out.println("</head>");
			out.println("<body>");
			out.println("<br>");
			out.println("<p align=center><font size=5 color=#0000FF>◈◈ JDBC 테스트 1◈◈</font><br>");
			out.println("<a href='05-04.address_insert_form.html'>주소록쓰기폼</a>");
			out.println("<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>");
			out.println("<tr bgcolor=#000000 class=t1>");
			out.println("<td align=center height=20 width=10%><font color=#FFFFFF>no</font></td>");
			out.println("<td align=center height=20 width=10%><font color=#FFFFFF>id</font></td>");
			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>이름</font></td>");
			out.println("<td align=center height=20 width=10%><font color=#FFFFFF>삭제</font></td>");
//			out.println("<td align=center height=20 width=30%><font color=#FFFFFF>전화번호</font></td>");
//			out.println("<td align=center height=20 width=20%><font color=#FFFFFF>주소</font></td>");
			out.println("</tr>");
			while(rs.next()){
				out.println("<tr class=t1>");
				out.println("<td align=center width=15% height=20>"+rs.getInt(1)+"</td>");
				out.println("<td align=center width=15% height=20> <a href='address_detail.do?no="+rs.getInt(1)+"'>"+rs.getString(2)+"</a> </td>");
				out.println("<td align=center width=15% height=20> <a href='address_detail.do?no="+rs.getInt(1)+"'>"+rs.getString(3)+"</a> </td>");
				out.println("<td align=center width=15% height=20> <a href='addr_delete.do?no="+rs.getInt(1)+"'>삭제</a> </td>");
				//out.println("<td align=center width=20% height=20>"+rs.getString(4)+"</td>");
				//out.println("<td align=center width=30% height=20>"+rs.getString(5)+"</td>");
				out.println("</tr>");		
			}

			out.println("</table>");
			out.println("</body>");
			out.println("</html> ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
