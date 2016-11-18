<%@page import="com.itwill.order.OrderService"%>
<%@page import="com.itwill.order.order.Order"%>
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


	OrderService os=OrderService.getInstance();
	Order o = os.getOrder(2);
	
%>
</body>
</html>