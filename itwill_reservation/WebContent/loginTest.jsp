<%@page import="com.itwill.user.Member"%>
<%@page import="java.sql.Date"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.UserDao"%>
<%@page import="com.itwill.user.User"%>
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
Member member= new Member(99,"1","1","1","1","1",null,"1","1",1);

MemberDaoService.getInstance().Create(member);

//System.out.print(user.getM_address());
%>


</body>
</html>