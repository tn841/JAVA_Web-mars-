<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL core url tag</h1><hr/>
<a href='<c:url value="jstl_core_url_result.jsp"/>'>jstl_core_url_result.jsp</a><br/>
<a href='<c:url value="/jstl_core_url_result.jsp"/>'>/jstl_core_url_result.jsp</a><br/>
<a href='/jstl_core_url_result.jsp'>/jstl_core_url_result.jsp[no jstl]</a><br/>
<a href='<c:url value="../jstl_core_url_result.jsp"/>'>../jstl_core_url_result.jsp</a><br/>
<br/><hr/>

<c:url value="jstl_core_url_result.jsp"  var="url1" scope="page"/>
<c:url value="/jstl_core_url_result.jsp"  var="url2"/>
<c:url value="../jstl_core_url_result.jsp"  var="url3"/>

<c:url value="/jstl_core_url_result.jsp"  var="url4">
	<c:param name="id" value="guard"/>
	<c:param name="name" value="���ȣ"/>
</c:url>

<c:set var="no" value="1"/>
<c:set var="name" value="KIM"/>
<c:set var="married" value="true"/>

<c:url value="/jstl_core_url_result.jsp"  var="url5">
	<c:param name="no" value="${no}"/>
	<c:param name="name" value="${name}"/>
	<c:param name="married" value="${married}"/>
</c:url>

<a href="${url1}">jstl_core_url_result.jsp</a><br/>
<a href="${url2}">/jstl_core_url_result.jsp</a><br/>
<a href="${url3}">../jstl_core_url_result.jsp</a><br/>
<a href="${url4}">/jstl_core_url_result.jsp[�Ķ��Ÿ1]</a><br/>
<a href="${url5}">/jstl_core_url_result.jsp[�Ķ��Ÿ2]</a><br/>

</body>
</html>