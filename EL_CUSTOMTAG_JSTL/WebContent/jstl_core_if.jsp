<%@page import="com.itwill.el.Car"%>
<%@page import="com.itwill.el.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.setAttribute("sUserId", "sumin");
	//request.setAttribute("member", new Member(1,"ㄹ혜",new Car("농단", "청와대", 300), false));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL 실습</h1><hr>
<c:if test="${empty sUserId}">
	<a href="#">로그인</a>
</c:if>

<c:if test="${!empty sUserId}">
	<a href="#">${sUserId}님 로그아웃</a>
</c:if>



<c:forEach items=""></c:forEach>
</body>
</html>