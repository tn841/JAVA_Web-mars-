
<%@page import="com.itwill.student.Student"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	Student pageSt=new Student();
	Student requestSt=new Student();
	Student sessionSt=new Student();
	Student applicationSt=new Student();

	pageContext.setAttribute("pageSt", pageSt);	   				//page
	request.setAttribute("requestSt", requestSt);  				//request
	session.setAttribute("sessionSt", sessionSt); 				//session
	application.setAttribute("applicationSt", applicationSt);	//application

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>SCOPE��ü</h1>

<ol>
	<li>page:<%=pageContext.getAttribute("pageSt")%></li>
	<li>request:<%=request.getAttribute("requestSt")%></li>
	<li>session:<%=session.getAttribute("sessionSt")%></li>
	<li>application:<%=application.getAttribute("applicationSt")%></li>
</ol> 
<br/>
include
<hr/>
<p>action include</p>
<jsp:include page="8-1.default_scope_request.jsp"></jsp:include>
<hr>
<p>��Ƽ�� include</p>
<%@ include file="8-1.default_scope_request.jsp" %>
<hr/>
include
<a href='8-1.default_scope_page_session_application.jsp'>8-1.default_scope_page_session_application.jsp</a><br/>

</body>
</html>







