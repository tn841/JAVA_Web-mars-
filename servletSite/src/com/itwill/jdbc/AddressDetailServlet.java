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
		
		//1. �Ķ���� �ޱ�
		String no = request.getParameter("no");
		
		
		//2. DB �۾�
		try {
			/************************** JDBC ***************************/
			// 1. Oracle driver Loading
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver); // httpServlet�� ��� �޾ұ� ������ ����ó�� ������ ���ų� �� ���Ը� throw�� �� �ִ�. -> try-catch�� ����ó��
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
		
		
			//3. ���� ������
			out.println("<h1>"+name+"�� ������</h1><hr/>");
			out.println("<a href='address_list.do'>�ּҷϸ���Ʈ</a>&nbsp;&nbsp;");
			out.println("<a href='05-04.address_insert_form.html'>�ּҷϾ�����</a>&nbsp;&nbsp;");
			out.println("<a href='addr_delete.do?no="+no+"'>����</a>&nbsp;&nbsp;");
			out.println("<a href='addr_update.form?no="+no+"'>����</a>");
			out.println("<ol>");
			out.println("<li>��ȣ:"+no+"</li>");
			out.println("<li>���̵�:"+id+"</li>");
			out.println("<li>�̸�:"+name+"</li>");
			out.println("<li>��ȭ��ȣ:"+phone+"</li>");
			out.println("<li>�ּ�:"+addr+"</li>");
			out.println("</ol>");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
