package com.itwill.method;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out=response.getWriter();
		/*
		 
		 * << html form >>
		 * <input type="text" name="query">
		 * << ��ûURL >>
		 * ==>http://192.168.12.31/servletSite/search.do?query=jsp
		 */
		
		/*
		 * 0. ��û��ü�� ���� ���ڵ�
		 */
		request.setCharacterEncoding("EUC-KR");
		
		/*
		 *1.��û��ü�κ��� �Ķ��Ÿ�ޱ�
		 */
		
		String query=request.getParameter("query");
		/*
		 * 2.DB�˻�
		 */
		
		/*
		 * 3.�������
		 */
		out.println("<h1>"+query+" �˻����</h1><hr/>");
		out.println("<ol>");
		for (int i = 0; i < 30; i++) {
			out.println("<li>"+query+" content</li>");
		}
		out.println("</ol>");
	}

}
