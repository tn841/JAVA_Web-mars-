<%@ page 
	language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    errorPage="error/error.jsp"
%>
<%!
	int count = 0;
%>
<%
	String str = null;
	if(count%5 != 0){
		str = "�����ƴ�!";
	}
		count++;
	int len = str.length();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�����߻�������</h1><hr>
	<div>�����߻��� errorPage="error/error.jsp" ������ ������</div>
	<%@ include file="5-6.directive_included_file.jspf" %>
</body>
</html>