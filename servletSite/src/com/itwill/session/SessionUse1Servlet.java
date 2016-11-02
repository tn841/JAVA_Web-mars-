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
 * Servlet implementation class SessionUse1Servlet
 */
@WebServlet("/session_use1.do")
public class SessionUse1Servlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		
		/*
		 * 로그인한 사람만 볼 수 있는 페이지
		 */
		HttpSession session = request.getSession();	//세션이 생성되거나 바인딩 된다.
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			//로그인 안한 사람
			out.println("<script>");
			out.println("alert('회원 전용페이지 입니다. 로그인 하세요.');");
			out.println("location.href='07.session_login.html';");
			out.println("</script>");
			return;
		}
		
		//로그인 한 사람
		out.println("<h1>회원 전용 페이지 1</h1><hr>");
		out.println("<div><a href='sessiong_logout.do'>"+id+"님 로그아웃<a></div>");
		
	}
}
