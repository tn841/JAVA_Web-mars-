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
		2. Dao�̿��Ͽ� remove
		3-1. remove ������ guest_list.jsp
		3-2. remove ���н� alert ??
	*/
	request.setCharacterEncoding("euc-kr");
	int guest_no = Integer.parseInt(request.getParameter("guest_no"));

	System.out.println("������ȣ Ȯ�� : "+guest_no);
	
	GuestDao guestDao = new GuestDao();

	
	if(!guestDao.deleteGuest(guest_no)){
		//insert����
		
			out.print("<script>");
			out.print("alert('"+guest_no+"�� ���� ����');");
			out.print("return;");
			out.print("</script>");
	
		return;
	}
	
	//insert����
	out.print("<script>");
	out.print("alert('���� �Ǿ����ϴ�.');");
	out.print("location.href='guest_list.jsp';");
	out.print("</script>");

			
	//response.sendRedirect("/guest_model1/guest_list.jsp");
	
	
		
%>

