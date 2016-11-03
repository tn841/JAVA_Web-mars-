<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"	%>
    
    
<%
	/*
		< 쓰기 작업 구현 >
		1. 파라메터로 데이터 받기
		2. Dao이용하여 insert
		3-1. insert 성공시 guest_list.jsp
		3-2. insert 실패시 guest_write.jsp ??
	*/
	request.setCharacterEncoding("euc-kr");
		
	String guest_name = request.getParameter("guest_name");
	String guest_email = request.getParameter("guest_email");
	String guest_homepage = request.getParameter("guest_homepage");
	String guest_title = request.getParameter("guest_title");
	String guest_content = request.getParameter("guest_content");
	System.out.println(guest_name+" "+guest_email+" "+guest_homepage+" "+guest_title+" "+guest_content);
	
	GuestDao guestDao = new GuestDao();
	
	Guest guest = new Guest(guest_name, guest_email, guest_homepage, guest_title, guest_content);
	
	if(!guestDao.insertGuest(guest)){
		//insert실패
		response.sendRedirect("/guest/guest_write.jsp");
	}
	
	//insert성공
	response.sendRedirect("/guest/guest_list.jsp");
	
	
		
%>

