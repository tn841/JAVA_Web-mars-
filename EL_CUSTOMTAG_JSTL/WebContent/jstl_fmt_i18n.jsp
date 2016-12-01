<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%
	session.setAttribute("userId", "guard");
	request.setAttribute("param1", "data");
%>
<%-- 
  
<fmt:setLocale value="ja_JP" /> 
<fmt:setLocale value="en_US" />     
--%>
<fmt:setLocale value="${pageContext.request.locale.language}" />    
<fmt:setBundle basename="com/itwill/i18n/guest" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Internationalization[i18n]</h1><hr/>
<h3>request locale[${pageContext.request.locale.language}_${pageContext.request.locale.country}]</h3>
"${requestScope.locale.country}"<br>
"${requestScope}"<br>
"pageContext.requset : ${pageContext.request}"<br>
"${pageContext.request.method}"<br>
"${requestScope.param1}"<br>
"${param1}"<br>
"${header}"<br>

<core:forEach items="${applicationScope}" var="item">
	"${item}"<br>
</core:forEach>
<ul>
	<fmt:message key="title.main" var="main" scope="page"/>
	<fmt:message key="title.list" var="list" scope="page"/>
	<li><fmt:message key="title.main"/></li>
	<li><fmt:message key="title.list"/></li>
	<li><fmt:message key="title.view"/></li>
	<li><fmt:message key="title.write"/></li>
	<li>
		<fmt:message key="error.msg">
			<fmt:param value="${userId}"/>
		</fmt:message>
	</li>
	<li>
		<fmt:message key="error.msg">
			<fmt:param value="당신은"/>
		</fmt:message>
	</li>
	<li>
		<fmt:message key="nv.bc">
			<fmt:param value="${main}"></fmt:param>
			<fmt:param value="${list}"></fmt:param>
		</fmt:message>
	</li>
	
	
</ul>
</body>
</html>