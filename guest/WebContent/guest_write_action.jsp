<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"	%>
    
    
<%
	/*
		< ���� �۾� ���� >
		1. �Ķ���ͷ� ������ �ޱ�
		2. Dao�̿��Ͽ� insert
		3-1. insert ������ guest_list.jsp
		3-2. insert ���н� guest_write.jsp ??
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
		//insert����
		response.sendRedirect("/guest/guest_write.jsp");
	}
	
	//insert����
	response.sendRedirect("/guest/guest_list.jsp");
	
	
		
%>

