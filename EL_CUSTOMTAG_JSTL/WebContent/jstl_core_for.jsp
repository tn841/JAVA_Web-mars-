<%@page import="java.util.HashMap"%>
<%@page import="com.itwill.el.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.el.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<%    
	Member m1=new Member(1,"김수미",new Car("K3","KIA",1900),true);
	Member m2=new Member(2,"김우미",new Car("K5","KIA",2400),false);
	Member m3=new Member(3,"김미미",new Car("K7","KIA",3000),true);
	
	ArrayList<Member> memberList=new ArrayList<Member>();
	memberList.add(m1);
	memberList.add(m2);
	memberList.add(m3);
	
	Member[] memberArray=new Member[3];
	memberArray[0]=m1;
	memberArray[1]=m2;
	memberArray[2]=m3;
	
	HashMap<String,Member> memberMap=new HashMap<String,Member>();
	memberMap.put("FIRST", m1);
	memberMap.put("SECOND", m2);
	memberMap.put("THIRD", m3);
	
	//javax.servlet.jsp.jstl.core.LoopTagStatus
	
	request.setAttribute("memberList", memberList);
	request.setAttribute("memberArray", memberArray);
	request.setAttribute("memberMap", memberMap);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL core tag forEach </h1><hr/>

<h3>ArrayList 출력</h3>
<ul>
<core:forEach items="${memberList}" var="member" begin="0" varStatus="status">
	<li>${status.index}, ${member.no}, ${member.name}, ${member.car.model}, ${member.married}</li>
</core:forEach>
</ul>
<br>

<h3>Array 출력</h3>
<ol>
<core:forEach items="${memberArray}">
	<li>ㅋㅋㅋ</li>
</core:forEach>
</ol>
<br>

<h3>HashMap 출력</h3>
<ol>
<core:forEach items="${memberMap}" var="memberMapEntry">
	<li>${memberMapEntry}, ${memberMapEntry.value.no }</li>
</core:forEach>
</ol>
<br>
</body>
</html>