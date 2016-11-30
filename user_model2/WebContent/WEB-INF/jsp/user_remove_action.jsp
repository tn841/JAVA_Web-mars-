<%@page import="com.itwill.user.RemoveUserException"%>
<%@page import="com.itwill.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
/*
	1. 파라미터 받기
	2. UserService.remove실행
	3. 결과 반환
*/

	String userId = (String)request.getParameter("userId");
	
	try{
		UserService.getInstance().removeUserById(userId);
		
		//삭제 성공
		//response.sendRedirect("user_list.jsp");
		request.setAttribute("MSG", "삭제 되었습니다.");
		RequestDispatcher rs = request.getRequestDispatcher("user_logout_action.jsp");
		rs.forward(request, response);
		return;
		
	}catch(RemoveUserException e){
		
	}catch(Exception e){
		response.sendRedirect("error/error.jsp");
		
	}

%>