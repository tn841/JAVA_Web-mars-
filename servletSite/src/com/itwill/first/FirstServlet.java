package com.itwill.first;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2-1. Ŭ���̾�Ʈ�� ������ Ÿ�� ����
		response.setContentType("text/html;charset=EUC-KR");
		
		// 2-2. Ŭ���̾�Ʈ�� �����͸� �����ϱ����� ��½�Ʈ�� ����
		PrintWriter out = response.getWriter();
		
		// 2-3. Ŭ���̾�Ʈ�� ������ ����
		for(int i=2; i<10; i++){
			out.print("<h3>");
			for(int j=1; j<10; j++){
				out.print(i+"*"+j+"="+(i*j)+" ");
			}
			out.println("</h3>");
		}
	}

}
