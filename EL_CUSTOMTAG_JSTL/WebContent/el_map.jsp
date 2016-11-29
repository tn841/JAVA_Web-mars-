<%@page import="com.itwill.el.Car"%>
<%@page import="com.itwill.el.Member"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	HashMap<String, Member> memberMap = new HashMap<String, Member>();
	Member m1 = new Member(1, "김수민", new Car("K3","KIA",1000), true);
	Member m2 = new Member(2, "이수민", new Car("K5","KIA",2000), true);
	Member m3 = new Member(3, "박수민", new Car("K7","KIA",3000), false);
	
	memberMap.put("first", m1);
	memberMap.put("second", m2);
	memberMap.put("thrid", m3);
	
	request.setAttribute("members", memberMap);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>EL_MAP</h1><hr>
	<ol type="A">
		<li>${members}</li>
		<li>${members.first}</li>
		<li>${members.first.no}</li>
		<li>${members.first.name}</li>
		<li>${members.first.car.model}</li>
		<li>${members.first.car.company}</li>
		<li>${members.first.car.cc}</li>
	</ol>
	
	<h1>EL_MAP</h1><hr>
	<ol type="i">
		<li>${members["first"]}</li>
		<li>${members["first"].no}</li>
		<li>${members.first.name}</li>
		<li>${members.first.car.model}</li>
		<li>${members.first.car.company}</li>
		<li>${members.first.car.cc}</li>
	</ol>
</body>
</html>