<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.el.Car"%>
<%@page import="com.itwill.el.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    Member m1 = new Member(1, "김수민", new Car("K3","KIA",1000), true);
	Member m2 = new Member(2, "이수민", new Car("K5","KIA",2000), true);
	Member m3 = new Member(3, "박수민", new Car("K7","KIA",3000), false);
	
	ArrayList<Member> mList = new ArrayList<Member>();
	mList.add(m1);
	mList.add(m2);
	mList.add(m3);
	
	Member[] mArray = {m1, m2, m3};
	
	
	request.setAttribute("memberList", mList);
	request.setAttribute("memberArray", mArray);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>EL array, collection</h1><hr>
	<ol>
		<li>${memberList}</li>
		<li>${memberList[0]}</li>
		<li>${memberList[0].no}</li>
		<li>${memberList[0].name}</li>
		<li>${memberList[0].car}</li>
		<li>${memberList[0].car.model}</li>
		<li>${memberList[0].car.company}</li>
		<li>${memberList[0].car.cc}</li>
	</ol>
	
	<ol>
		<li>${memberList[1]}</li>
	</ol>
	
	<ol>
		<li>${memberArray}</li>
		<li>${memberArray[2]}</li>
		<li>${memberArray[2].no}</li>
		<li>${memberArray[2].car.model}</li>
	</ol>
</body>
</html>