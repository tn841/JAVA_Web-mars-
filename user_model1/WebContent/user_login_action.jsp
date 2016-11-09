<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.user.UserService"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}

	String userId = request.getParameter("userId");
	String pass = request.getParameter("password");
	ArrayList<String> msgList = new ArrayList<String>();
	
	try{
		User loginUser = UserService.getInstance().login(userId, pass);
		
		session.setAttribute("sUserId",	userId);
		session.setAttribute("sUser", loginUser);
		response.sendRedirect("user_list.jsp");
		
	}catch(UserNotFoundException e){
		//���̵� ����

		msgList.add(new String("���̵� �������� �ʽ��ϴ�."));
		request.setAttribute("MSG", msgList);
		RequestDispatcher rs = request.getRequestDispatcher("user_login_form.jsp");
		rs.forward(request, response);

		return;
	}catch(PasswordMismatchException e){
		//��� ����ġ
		
		String msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
		request.setAttribute("passMSG", msg);
		request.setAttribute("idInfo", userId);
		RequestDispatcher rs = request.getRequestDispatcher("user_login_form.jsp");
		rs.forward(request, response);
		
		return;
	}catch(Exception e){
		response.sendRedirect("error/error.jsp");
	}
%>