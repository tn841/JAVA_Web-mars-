<%@page import="com.itwill.order.order.Order"%>
<%@page import="com.itwill.order.order_detail.OrderDetail"%>
<%@page import="com.itwill.order.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Order o=null;
	try{
		String desc="왜!!";
		OrderDao od = OrderDao.getInstance();
		/* od.insertOder(1, desc);
		od.insertOD(new OrderDetail(0, 5, 2, 2000, 4));
		od.insertOD(new OrderDetail(0, 6, 2, 2000, 4));
		od.insertOD(new OrderDetail(0, 7, 2, 2000, 4));*/
		o = od.selectOrder(1);
		/* System.out.println(od.update(new OrderDetail(5, 5, 3, 3000, 10))); */
		/* System.out.println(od.deleteOD(10));
		System.out.println(od.deleteOrder(3)); */
		%>
		<% %>
<h1><%=o.getJ_desc() %></h1>
</body>
</html>
<%		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>