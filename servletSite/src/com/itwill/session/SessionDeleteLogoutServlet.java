package com.itwill.session;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionDeleteLogoutServlet
 */
@WebServlet("/session_logout.do")
public class SessionDeleteLogoutServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * <<request.getSession(false);>>
		 * JSESSIONID 쿠키 존재 시 -> 세션 바인딩 후 세션 객체 반환
		 * JSESSIONID 쿠키 없을 시 -> 세션 생성 안함
		 */
		HttpSession session = request.getSession(false);
		if(session == null){
			//JSESSIONID 없을 시
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		
		session.invalidate();	//서버쪽 세션 무효화 (클라이언트에는 쿠키가 남아 있다. 따라서 바인딩이 되지 않는다.)
		
		response.sendRedirect("07.session_login.html");
		
		
		
		
	}

}
