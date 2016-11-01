package com.itwill.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieCreateServlet
 */
@WebServlet("/cookie_create.do")
public class CookieCreateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("EUC-KR");
		
		String search_keyword = request.getParameter("search_keyword");
		System.out.println(search_keyword);
		if(search_keyword == null || search_keyword.equals("")){
			//response.sendRedirect("07.cookie.html");
			out.println("<script>");
			out.println("window.alert('�˻�� �Է��ϼ���.');");
			out.println("window.location.href='07.cookie_search.html';");
			out.println("</script>");
			return;			
		}
		
		/*
		 * 1. cookie ��ü ����
		 */
		Cookie keywordCookie = new Cookie("keyword", 
				URLEncoder.encode(search_keyword, "UTF-8"));
		
		
		/*
		 * 2. cookie ��ü ����
		 * 	- setMaxAge�� �����ϸ� �������� ���Ϸ� ����ȴ�.
		 */
		keywordCookie.setMaxAge(60*60*24*365);	//1�� ¥�� ��Ű
		
		
		/*
		 * 3. cookie ��ü�� Ŭ���̾�Ʈ�� ����
		 */
		response.addCookie(keywordCookie);
		
		out.println("<h1> Cookie ���� </h1><hr>");
		out.println("<p>"+search_keyword+"�� value�� ���� ��Ű ���� ��</p>");
		out.println("<ol>");
			out.println("<li>"+search_keyword+"</li>");
		out.println("</ol>");
		out.println("<p> <a href='cookie_read.do'>cookie �б�</a> </p>");
		
	}

}
