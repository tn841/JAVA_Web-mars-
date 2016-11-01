package com.itwill.method;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetLoginServlet
 */
@WebServlet("/get_login.do")
public class GetLoginServlet extends HttpServlet {
	/*
	 * GET����� ��û�� ó���ϴ¸޽��
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		System.out.println(">>>>"+request.getMethod()+" ����� ��û");
		/*
		 <<html>>	
		 	���̵�:<input type="text" name="id"><br/>
			�п���:<input type="password" name="pass"><br/><br/>
		 
		 ��ûURL==>
		 http://192.168.12.31/servletSite/get_login.do?id=guard&pass=1111 
		 
		 */
		
		/*
		  1.��û�Ķ��Ÿ�ٳ�
		 */
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		if(  (id == null || id.equals(""))  || (pass == null || pass.equals(""))){
			response.sendRedirect("05-01.login_get.html");
			return;
		}
		
		/*
		  2. DataBase �����ؼ� �α��� ����
		 */
		/*  -----------
		 *  id   | pass
		 *  -----------
		 *  guard| 1111
		 *  -----------
		 */
		boolean isLogin=id.equals("guard") && pass.equals("1111");
		
		
		/*
		 * 3. �������
		 */
		out.println("<h1>�α��ΰ��[GET]</h1><hr/>");
		if(isLogin){
			out.println("<p>"+id+"�� �α��μ���</p>");
			
		}else{
			out.println("<p>"+id+"�� �α��ν���</p>");
			
		}
	}

}
