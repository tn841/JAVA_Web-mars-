<%@page import="com.itwill.student.Student"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*
	Student pageSt=new Student();
	Student requestSt=new Student();
	Student sessionSt=new Student();
	Student applicationSt=new Student();

	pageContext.setAttribute("pageSt", pageSt);	   				//page
	request.setAttribute("requestSt", requestSt);  				//request
	session.setAttribute("sessionSt", sessionSt); 				//session
	application.setAttribute("applcationSt", applicationSt);	//application
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>SCOPE객체2</h1>

<ol>
	<li>page:<%=pageContext.getAttribute("pageSt")%></li>
	<li>request:<%=request.getAttribute("requestSt")%></li>
	<li>session:<%=session.getAttribute("sessionSt")%></li>
	<li>application:<%=application.getAttribute("applicationSt")%></li>
</ol> 
<br/>
<a href='8-1.default_scope.jsp'>8-1.default_scope.jsp</a><br/>

</body>
</html>







