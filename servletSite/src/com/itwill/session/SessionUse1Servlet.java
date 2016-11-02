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
		 * �α����� ����� �� �� �ִ� ������
		 */
		HttpSession session = request.getSession();	//������ �����ǰų� ���ε� �ȴ�.
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			//�α��� ���� ���
			out.println("<script>");
			out.println("alert('ȸ�� ���������� �Դϴ�. �α��� �ϼ���.');");
			out.println("location.href='07.session_login.html';");
			out.println("</script>");
			return;
		}
		
		//�α��� �� ���
		out.println("<h1>ȸ�� ���� ������ 1</h1><hr>");
		out.println("<div><a href='sessiong_logout.do'>"+id+"�� �α׾ƿ�<a></div>");
		
	}
}
