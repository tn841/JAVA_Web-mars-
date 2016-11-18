<%@page import="com.sun.xml.internal.ws.api.streaming.XMLStreamWriterFactory.Default"%>
<%@page import="java.sql.Date"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.MemberDao"%>
<%@page pageEncoding="MS949" contentType="text/html; charset=MS949" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=MS949"/>
<title></title>
</head>
<body>

<% 
//MemberDaoService 
%>

<% 

String id = request.getParameter("m_id");
String pass = request.getParameter("m_pass");
String name = request.getParameter("m_name");
String phone = request.getParameter("m_phone");
String email = request.getParameter("m_email");
String birh = request.getParameter("m_birth");
String address = request.getParameter("m_address");
String ban = request.getParameter("m_class");

//String point = request.getParameter("point");

//int po= Integer.parseInt(point);

//Member member = new Member();
 Member member = new Member(-97, id, pass, name, phone, email, birh, address, ban, -99);

//System.out.print(id);
//System.out.print(pass);

/*
member.setM_id(id);
member.setM_password(pass);
member.setM_name(name);
member.setM_phone(phone);
member.setM_email(email);
member.setM_birth(birh);
member.setM_address(address);
member.setM_class(ban);

System.out.print(id);
*/
MemberDaoService.getInstance().create(member);

response.sendRedirect("main.jsp");

%>


</body>
</html>
