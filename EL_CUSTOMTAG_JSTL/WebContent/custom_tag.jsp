<%@page import="com.itwill.tag.simple.HelloTag"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sumin" uri="http://www.itwill.co.kr/jsp/simpleTag" %>
<%
	request.setAttribute("userId", "tn841");
	session.setAttribute("sUserId", "크앙크앙");
	int count = (int)session.getAttribute("count");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>사용자 정의 태그</h1><hr>

<sumin:hello/>
<sumin:hello/>
<sumin:hello/>
<sumin:hello/>

<sumin:helloAttr age="22" name="수민1"/>
<sumin:helloAttr age="26" name="수민2"/>
<sumin:helloAttr age="55" name="${userId}"/>
<sumin:helloAttr age="25" name="박근혜"/>

<sumin:helloIf test="true">
	<h1>참일세</h1>
</sumin:helloIf>

<sumin:helloIf test="false">
	<h1>응 안나와</h1>
</sumin:helloIf>

<sumin:helloIf test="${userId=='tn841'}">
	<h2>${userId}님 반가워잉</h2>
</sumin:helloIf>
<hr>

<sumin:helloIf test="${!empty sUserId}">
	<a href="#">[${sUserId }]님 로그아웃</a>
</sumin:helloIf>

</body>
</html>