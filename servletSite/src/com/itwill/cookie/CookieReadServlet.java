package com.itwill.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieReadServlet
 */
@WebServlet("/cookie_read.do")
public class CookieReadServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		
		/*
		 * 1. ��û��ü�� ���� ��� �б�
		 */
		Cookie[] cookies = request.getCookies();
		if(cookies == null || cookies.length == 0){
			out.println("<script>");
			out.println("window.alert('��Ű�� �����ϴ�. ��Ű ���� �������� �̵�.');"
						+"window.location.href='07.cookie_search.html';");
			out.println("</script>");
			return ;
		}
		
		/*
		 * 2. cookie ��ü�� ���� �� �б�
		 */
		String cookie_value = "";
		for(Cookie cookie : cookies){
			String cookieName = cookie.getName();
			if(cookieName.equals("keyword")){
				cookie_value = cookie.getValue();
				break;
			}
		}
		out.println("<h1> Ŭ���̾�Ʈ�� ���� ���۵� ��Ű�� �б�</h1>");
		out.println("<p>"+URLDecoder.decode(cookie_value, "UTF-8")+"</p>");
		
		/*
		 * 3. Cookie �� ���
		 */
		out.println("<p><a href='cookie_delete.do'>��Ű ����</a>");
		
		
		
	}
	

}
