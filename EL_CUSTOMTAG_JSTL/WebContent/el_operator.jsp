<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%

	pageContext.setAttribute("int1", 10);
	pageContext.setAttribute("int2", 20);
	pageContext.setAttribute("double1", 1.5);
	pageContext.setAttribute("double2", 2.34);
	pageContext.setAttribute("string1", "KIM");
	pageContext.setAttribute("string2", "���ڿ�2");
	pageContext.setAttribute("string3", "");
	pageContext.setAttribute("bool1", true);
	pageContext.setAttribute("bool2", false);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>EL ������</h1><hr>
<h3>�⺻ ����</h3>
<ul>
	<li>${1+1}</li>
	<li>${1+1}</li>
	<li>${'���ڿ�'}</li>
	<li>${true}</li>
	<li>${"100"+"200"}</li>
</ul>
<hr>
<h3>���� ����</h3>
<ul>
	<li>${int1}</li>
	<li>${empty int1}</li>
	<li>${empty string3}</li>
	<li>${bool1 == bool2}</li>
	<li>${bool1 != bool2}</li>
	<li>�达 �ΰ�? : ${string1 == 'KIM'}</li>
	<li>kim�� aim���� ���������� ���ΰ�? : ${string1 < 'AIM'}</li>
</ul>


</body>
</html>