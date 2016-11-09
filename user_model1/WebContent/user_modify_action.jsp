<%@page import="com.itwill.user.UserService"%>
<%@page import="com.itwill.user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)request.getParameter("userId");
	String password = (String)request.getParameter("password");
	String name = (String)request.getParameter("name");
	String email = (String)request.getParameter("email");
	
	User user = new User(id, password, name, email);
	
	int rows = UserService.getInstance().updateUser(user);
	if(rows > 0 ){
		//업데이트 성공
		RequestDispatcher rs = request.getRequestDispatcher("user_view.jsp?userId="+id);
		rs.forward(request, response);
		
	}else{
		//업데이트 실패
		request.setAttribute("fUser", user);
		RequestDispatcher rs = request.getRequestDispatcher("user_modify_form");
		rs.forward(request, response);
	}
	
%>