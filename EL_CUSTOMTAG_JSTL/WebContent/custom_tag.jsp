<%@page import="com.itwill.tag.simple.HelloTag"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sumin" uri="http://www.itwill.co.kr/jsp/simpleTag" %>
<%
	request.setAttribute("userId", "tn841");
	session.setAttribute("sUserId", "ũ��ũ��");
	int count = (int)session.getAttribute("count");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>����� ���� �±�</h1><hr>

<sumin:hello/>
<sumin:hello/>
<sumin:hello/>
<sumin:hello/>

<sumin:helloAttr age="22" name="����1"/>
<sumin:helloAttr age="26" name="����2"/>
<sumin:helloAttr age="55" name="${userId}"/>
<sumin:helloAttr age="25" name="�ڱ���"/>

<sumin:helloIf test="true">
	<h1>���ϼ�</h1>
</sumin:helloIf>

<sumin:helloIf test="false">
	<h1>�� �ȳ���</h1>
</sumin:helloIf>

<sumin:helloIf test="${userId=='tn841'}">
	<h2>${userId}�� �ݰ�����</h2>
</sumin:helloIf>
<hr>

<sumin:helloIf test="${!empty sUserId}">
	<a href="#">[${sUserId }]�� �α׾ƿ�</a>
</sumin:helloIf>

</body>
</html>