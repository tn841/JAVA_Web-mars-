package com.itwill.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionCreateLoginServlet
 */
@WebServlet("/session_login.do")
public class SessionCreateLoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("07.session_login.html");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		/* DB 예시)
		   ----------
		   id  | pass
		   ----------
		   xxx | 1111
		   yyy | 2222
		   ----------
		 */
		boolean isMember1 = (id.equals("xxx") && pass.equals("1111"));
		boolean isMember2 = (id.equals("yyy") && pass.equals("2222"));
		
		
		/*
		 * 3. 응답
		 */
		if(!isMember1 && !isMember2){
			//로그인 실패
			out.println("<script>");
			out.println("alert('"+id+"님 로그인 실패');");
			out.println("location.href='07.session_login.html';");
			out.println("</script>");
			return ;
		}
		
		//로그인 성공
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		out.println("<h1>"+id+"님 반갑습니다.</h1><hr>");
		out.println("<div><a href='sessiong_logout.do'>"+id+"님 로그아웃<a></div>");
		out.println("<div><a href='session_use1.do'>회원전용페이지1<a></div>");
		out.println("<div><a href='session_use2.do'>회원전용페이지2<a></div>");
	}

}










