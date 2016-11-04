<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"	%>
    
    
<%
	/*
		< 삭제 작업 구현 >
		1. 파라메터로 데이터 받기
		2. Dao이용하여 remove
		3-1. remove 성공시 guest_list.jsp
		3-2. remove 실패시 alert ??
	*/
	request.setCharacterEncoding("euc-kr");
	int guest_no = Integer.parseInt(request.getParameter("guest_no"));

	System.out.println("삭제번호 확인 : "+guest_no);
	
	GuestDao guestDao = new GuestDao();

	
	if(!guestDao.deleteGuest(guest_no)){
		//insert실패
		%>
			<script>
			alert('<%=guest_no%>번 삭제 실패');
			return;
			</script>
		<%
		return;
	}
	
	//insert성공
	response.sendRedirect("/guest_model1/guest_list.jsp");
	
	
		
%>

