<%@page import="com.itwill.el.Car"%>
<%@page import="com.itwill.el.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%
	String msg="아이디 중복";
	request.setAttribute("member",new Member(1,"김수미",new Car("K7","KIA",3000),true));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL core set tag</h1><hr>
<core:set var="id" value="guard"/>
<core:set var="id" value="page_guard" scope="page"/>
<core:set var="id" value="request_guard" scope="request"/>
<core:set var="id" value="session_guard" scope="session"/>
<core:set var="id" value="application_guard" scope="application"/>

<core:set var="msg" value="<%=msg%>"/>
<core:set var="today1">
	2016-12-01
</core:set>
<core:set var="today2">
	<%=new Date()%>
</core:set>
${id}<br>
${pageScope.id}<br>
${requestScope.id}<br>
${sessionScope.id}<br>
${applicationScope.id}<br>
${msg}<br>
${today1}<br>
${today2}<br>
<br>
-----변경전----<br/>
${member.no}<br/>
${member.name}<br/>
${member.car.model}<br/>
${member.married}<br/>
<core:set target="${member}" property="no" value="2"/>
<core:set target="${member}" property="name" value="김우미"/>
<core:set target="${member.car}" property="model" value="avante"/>
<core:set target="${member}" property="married" value="false"/>
-----변경후----<br/>
${member.no}<br/>
${member.name}<br/>
${member.car.model}<br/>
${member.married}<br/>
</body>
</html>