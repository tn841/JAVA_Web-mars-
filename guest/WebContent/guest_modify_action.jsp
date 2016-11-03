<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"	%>
    
    
<%
	/*
		< 수정 작업 구현 >
		1. 파라메터로 데이터 받기
		2. Dao이용하여 update
		3-1. update 성공시 guest_view?no=*.jsp
		3-2. update 실패시 에러페이지 ??
	*/
	request.setCharacterEncoding("euc-kr");
	
	String guest_no = request.getParameter("guest_no");
	String guest_name = request.getParameter("guest_name");
	String guest_email = request.getParameter("guest_email");
	String guest_homepage = request.getParameter("guest_homepage");
	String guest_title = request.getParameter("guest_title");
	String guest_content = request.getParameter("guest_content");
	//System.out.println(guest_name+" "+guest_email+" "+guest_homepage+" "+guest_title+" "+guest_content);
	
	GuestDao guestDao = new GuestDao();
	
	Guest guest = new Guest(guest_name, guest_email, guest_homepage, guest_title, guest_content);
	
	if(!guestDao.updateGuest(guest)){
		//update실패
		response.sendRedirect("/guest/guest_view?guest_no="+guest_no+".jsp");
	}
	
	//update성공
	response.sendRedirect("/guest/guest_list.jsp");
	
	
		
%>

