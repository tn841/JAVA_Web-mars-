<%@page import="com.itwill.user.RemoveUserException"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
/*
	1. �Ķ���� �ޱ�
	2. UserService.remove����
	3. ��� ��ȯ
*/

	String userId = (String)request.getParameter("userId");
	
	try{
		UserService.getInstance().removeUserById(userId);
		
		//���� ����
		//response.sendRedirect("user_list.jsp");
		request.setAttribute("MSG", "���� �Ǿ����ϴ�.");
		RequestDispatcher rs = request.getRequestDispatcher("user_logout_action.jsp");
		rs.forward(request, response);
		return;
		
	}catch(RemoveUserException e){
		
	}catch(Exception e){
		response.sendRedirect("error/error.jsp");
		
	}

%>