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
	 * GET방식의 요청을 처리하는메쏘드
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		
		System.out.println(">>>>"+request.getMethod()+" 방식의 요청");
		/*
		 <<html>>	
		 	아이디:<input type="text" name="id"><br/>
			패에쓰:<input type="password" name="pass"><br/><br/>
		 
		 요청URL==>
		 http://192.168.12.31/servletSite/get_login.do?id=guard&pass=1111 
		 
		 */
		
		/*
		  1.요청파라메타바끼
		 */
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		if(  (id == null || id.equals(""))  || (pass == null || pass.equals(""))){
			response.sendRedirect("05-01.login_get.html");
			return;
		}
		
		/*
		  2. DataBase 접근해서 로그인 수행
		 */
		/*  -----------
		 *  id   | pass
		 *  -----------
		 *  guard| 1111
		 *  -----------
		 */
		boolean isLogin=id.equals("guard") && pass.equals("1111");
		
		
		/*
		 * 3. 결과전송
		 */
		out.println("<h1>로그인결과[GET]</h1><hr/>");
		if(isLogin){
			out.println("<p>"+id+"님 로그인성공</p>");
			
		}else{
			out.println("<p>"+id+"님 로그인실패</p>");
			
		}
	}

}
