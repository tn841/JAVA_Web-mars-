<%@page import="com.itwill.order.OrderDao"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="java.sql.Date"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.MemberDao"%>
<%@page import="com.itwill.user.Member"%>
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

OrderDao orederDao = new OrderDao();

orederDao.insertOder(7, "11");

%>


</body>
</html>