<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	pageContext.setAttribute("path", "/page.jsp");
    	request.setAttribute("path", "/request.jsp");
    	session.setAttribute("path", "/session.jsp");
    	application.setAttribute("path", "/application.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>EL 내장 객체</h1><hr>
<h3>4가지 기본 내장scope객체 사용</h3>
<ol>
	<li>${path}</li>
	<li>${pageScope.path}</li>
	<li>${requestScope.path}</li>
	<li>${sessionScope.path}</li>
	<li>${applicationScope.path}</li>
</ol>
<hr>
<h3>cookie 내장객체 사용</h3>
<ol>
	<li>cookie map : ${cookie}</li>
	<li>cookie jsession object : ${cookie.JSESSIONID}</li>
	<li>cookie jSessionid's valsue : ${cookie.JSESSIONID.value}</li>
</ol>
<hr>
<h3>initParam 내장객체 사용</h3>
<ol>
	<li>${initParam}</li>
	<li>${initParam.admin}</li>
	<li>${initParam.contextPath}</li>
</ol>
<hr>
<h3>header 내장객체 사용</h3>
<ol>
	<li>${header}</li>
	<li>${header.accept}</li>
</ol>
<hr>
<h3>pageContext 내장객체 (유일하게 map이 아님, bean 객체임)</h3>
<ol>
	<li>${pageContext.response.characterEncoding}</li>
	<li>${pageContext.request.method}</li>
	<li>${pageContext.session.creationTime}</li>
</ol>
<hr>
<h3>parameter 내장객체 </h3>
<ol>
	<li>param : ${param}</li>
	<li>${param.id}</li>
	<li>${param.pw}</li>
	<li>${param.hobby}</li>
	<li>paramValues : ${paramValues.id[0]}</li>
	<li>paramValues : ${paramValues.id[1]}</li>
	<li>${paramValues.hobby[0]}</li>
	<li>${paramValues.hobby[1]}</li>
</ol>
</body>
</html>