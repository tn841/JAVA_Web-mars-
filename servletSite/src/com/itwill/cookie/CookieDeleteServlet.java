package com.itwill.cookie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieDeleteServlet
 */
@WebServlet("/cookie_delete.do")
public class CookieDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		
		/*
		 * 1. cookie 얻기
		 */
		Cookie[] cookies = request.getCookies();
		
		/*
		 * 2. cookie 설정
		 */
		for(int i=0; i<cookies.length; i++){
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
		out.println("<h1>쿠키삭제</h1>");
		out.println("<p><a href='cookie_read.do'>쿠키 읽기</a></p>");
		out.println("<p>쿠키 없음.</p>");
	}

}
