<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="sfn" uri="http://www.itwill.co.kr/jsp/simpleFunc" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String date="2016-12-01 12:13:45";
	pageContext.setAttribute("date", date);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>EL custom function</h1><hr/>
-----custom el function-------<br/>
${sfn:mySubString('ABCDEDFHIJKLMN',5)}<br/>
${sfn:mySubString(date,11)}<br/>
-----jstl el function-------<br/>
${fn:substring(date,0,10)}<br/>
${fn:toUpperCase('abcdEFgh')}<br/>
${fn:toLowerCase('abcdEFgh')}<br/>
${fn:length('abcdEFgh')}<br/>
-----???????????-------<br/>
<%-- 
${date.substring(0,10)}<br/>
${'Abcdefg'.toUpperCase()}<br/>
${'Abcdefg'.lastIndexOf('e')}<br/>
${'Abcdefg'.replace('A','Z')}<br/>
--%>
<%--
EL2.1 �̻󿡼��� .�����ڸ� ����� get�޽�尡�ƴ�
�޽��ȣ�� ����
 --%>
${'abcdefg'.toUpperCase()}<br/>
<%--
EL3.0�̻󿡼��� static �޽��ȣ�Ⱑ��
--%>
${Integer.parseInt('345')+888}<br/>
</body>
</html>

