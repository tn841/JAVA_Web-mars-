package com.itwill.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.util.calendar.BaseCalendar.Date;

/**
 * Servlet implementation class SessionCountServlet
 */
@WebServlet("/session_count.do")
public class SessionCountServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
	
		/*
		 *  <<� Ŭ���̾�Ʈ�� ó������ ��û�� ������ JSESSIONID��Ű�� �������� ������>>
		 *  	1. ���� ���̵� ����[16������ ID]
		 *  	2. HttpSession��ü ������ �� �ش� Ŭ���̾�Ʈ�� ���Ǿ��̵� ������ �� ��ȯ
		 *  	3. ���信 ��Ű(�̸�:JSESSIONID, ��:���Ǿ��̵�)�� add�Ͽ� Ŭ���̾�Ʈ�� ����
		 *  
		 *  <<JSESSIONID��Ű�� �����ϴ� Ŭ���̾�Ʈ�� ��û�� ���� ���>>
		 *  	1. JSESSIONID��Ű�� ��(����ID) ���
		 *  	2. ���Ǿ��̵� �ش��ϴ� HttpSession��ü ���ε�
		 */
		HttpSession session = request.getSession();
		
		System.out.println(request.getRequestedSessionId());
		
		boolean isNew = session.isNew();
		String sessionID = session.getId();
		long sesison_creation_time = session.getCreationTime();
		long valid_time = session.getMaxInactiveInterval();
		long last_access_time = session.getLastAccessedTime();
		
		out.println("<h1>HttpSession��ü�̿��Ͽ� ����ī��Ʈ</h1>");
		out.println("<ol>");
		out.println("<li> ������ ���� �����Ǿ����� ���� : "+isNew+"</li>");
		out.println("<li> ���� ID : "+sessionID+"</li>");
		out.println("<li> ������ �����ð� : "+sesison_creation_time+"</li>");
		out.println("<li> ������ ��ȿ�ð� : "+valid_time+"</li>");
		out.println("<li> ���� ������ ���ε� �ð� : "+last_access_time+"</li>");
		
		Integer countInteger = (Integer)session.getAttribute("count");
		
		int count=0;
		
		if(countInteger != null){
			//���� ��û ���� 
			count = countInteger.intValue();
		}
		

		
		
		
		count++;
		session.setAttribute("count", count);
		
		out.println("<li> ����� �������� ����ī��Ʈ �� : "+count+"</li>");

		out.println("</ol>");
		
		
		
		
		
	}

}
