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
	
	String forwardPath = "";
	
	try{
		User loginUser = UserService.getInstance().login(userId, pass);
		
		session.setAttribute("sUserId",	userId);
		session.setAttribute("sUser", loginUser);
		//response.sendRedirect("user_list.jsp");
		forwardPath = "user_list.jsp";
		
	}catch(UserNotFoundException e){
		//아이디 없음

		msgList.add(new String("아이디가 존재하지 않습니다."));
		request.setAttribute("MSG", msgList);
		forwardPath = "user_login_form.jsp";
		return;
	}catch(PasswordMismatchException e){
		//비번 불일치
		
		String msg = "비밀번호가 일치하지 않습니다.";
		request.setAttribute("passMSG", msg);
		request.setAttribute("idInfo", userId);
		forwardPath = "user_login_form.jsp";
		return;
	}catch(Exception e){
		//response.sendRedirect("error/error.jsp");
		request.setAttribute("error_msg", e.getMessage());
		forwardPath= "error/error.jsp";
	}finally{
		RequestDispatcher rs = request.getRequestDispatcher(forwardPath);
		rs.forward(request, response);
	}
%>