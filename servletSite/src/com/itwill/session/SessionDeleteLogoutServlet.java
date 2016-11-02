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
		 * JSESSIONID ��Ű ���� �� -> ���� ���ε� �� ���� ��ü ��ȯ
		 * JSESSIONID ��Ű ���� �� -> ���� ���� ����
		 */
		HttpSession session = request.getSession(false);
		if(session == null){
			//JSESSIONID ���� ��
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		
		session.invalidate();	//������ ���� ��ȿȭ (Ŭ���̾�Ʈ���� ��Ű�� ���� �ִ�. ���� ���ε��� ���� �ʴ´�.)
		
		response.sendRedirect("07.session_login.html");
		
		
		
		
	}

}
