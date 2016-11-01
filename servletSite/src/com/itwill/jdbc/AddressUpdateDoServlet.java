package com.itwill.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddressUpdateDoServlet
 */
@WebServlet("/address_update.do")
public class AddressUpdateDoServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("euc-kr");
		request.setCharacterEncoding("euc-kr");
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String id	= request.getParameter("id");
		String addr = request.getParameter("addr");
		
		
		System.out.println(no+" "+name+" "+phone+" "+id+" "+addr);
		
		try{
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver); // httpServlet을 상속 받았기 때문에 예외처리 범위가 같거나 더 좁게만 throw할 수 있다. -> try-catch로 예외처리
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
			
			String[] sql_arr = new String[4];
			sql_arr[0] = "update address set name='"+name+"' where no="+no;
			sql_arr[1] = "update address set id='"+id+"' where no="+no;
			sql_arr[2] = "update address set phone='"+phone+"' where no="+no;
			sql_arr[3] = "update address set address='"+addr+"' where no="+no;
			
			Statement stmt = con.createStatement();
			
			for(int i=0; i<4; i++){
				stmt.executeUpdate(sql_arr[i]);
			}
			
			
			response.sendRedirect("address_list.do");
			
		}catch(Exception e){
			e.printStackTrace();
		}
			
	}

}
