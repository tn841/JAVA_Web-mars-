<%@page import="com.itwill.reservation.Reservation"%>
<%@page import="com.itwill.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="myFunc()">
	<%
		String s_no = request.getParameter("s_no");
		String m_no = request.getParameter("m_no");
		
	
		ReservationService rService = new ReservationService();
		rService.createReservation(new Reservation(Integer.parseInt(s_no), Integer.parseInt(m_no)));
		
		
	%>	
	<h1>���� ���� ������</h1><hr>
	<p> ���� ���� : <%=s_no %>, <%=m_no %></p>
	<br>
	<br>
	<br>
	<p> 2���� ���� �������� �̵�..</p>
	
	<script>
	function myFunc(){
		setTimeout(function(){
			location.href="reservation_dao_test.jsp";
		}, 2000);
	};
	</script>
</body>
</html>