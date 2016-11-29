<%@page import="com.itwill.el.Member"%>
<%@page import="com.itwill.el.Car"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 	Car car = new Car("렉서스", "도요새", 2000);
	Member m = new Member(1, "KIM", car, true);
	
	request.setAttribute("car", car);
	request.setAttribute("member", m);
	
	request.setAttribute("msg", "으아으아");
	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>EL bean의 출력</h1><hr>
	<ol>
		<li>${car}</li> 
		<li>${car.model}</li>
		<li>${car.company}</li>
		<li>${car.cc}</li>
	</ol>
	
	<ol>
		<li>${member}</li> 
		<li>${member.no}</li>
		<li>${member.name}</li>
		<li>${member.car.model}</li>
		<li>${member.car.company}</li>
		<li>${member.car.cc}</li>
	</ol>
	
	
	<script>
		alert("${msg}");
	</script>
</body>
</html>