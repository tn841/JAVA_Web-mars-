package com.itwill.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// #2-1. Ŭ���̾�Ʈ�� ������ Ÿ�� ����
		response.setContentType("text/html;charset=EUC-KR");
		
		// #2-2. Ŭ���̾�Ʈ�� �����͸� �����ϱ����� ��½�Ʈ�� ����
		PrintWriter out = response.getWriter();
		
		// #2-3. Ŭ���̾�Ʈ�� ������(HTML) ����
		for(int i=0; i<1000; i++){
			out.println("<h1>Hello Servlet!!!"+i+"</h1><hr>");
		}
	}

}
