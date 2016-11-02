<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("EUC-KR");
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("4.form.jsp");
	return;
}

String id = request.getParameter("id");
String pass = request.getParameter("pass");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<ol>
		<li>아이디 : <%=id%></li>
		<li>비밀번호 : <%=pass%></li>
		
	</ol>

</body>
</html>