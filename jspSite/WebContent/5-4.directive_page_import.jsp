<%@page import="com.itwill.address.AddressDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
%>
<%
	ArrayList addrList = null;
	Connection con = null;
	AddressDao addrDao = null;
	
	addrList = new ArrayList();
	addrDao = new AddressDao();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>page 지시어 [import]</h1>
<h2>형태:&lt;%@page import="com.itwill.Student"&gt;</h2>
<hr/>
</body>
</html>