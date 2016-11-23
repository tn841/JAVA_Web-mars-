<%@page import="com.itwill.user.ExistedUserException"%>
<%@page import="com.sun.xml.internal.ws.api.streaming.XMLStreamWriterFactory.Default"%>
<%@page import="java.sql.Date"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.MemberDao"%>
<%@page pageEncoding="EUC-KR" contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<!-- 
<meta http-equiv="Content-Type" content="text/html; charset=MS949"/>
 -->

<title></title>
</head>
<body>
<%-- catch 부분 수정할것 --%>
<% 
if(request.getMethod().equalsIgnoreCase("get")) {
	response.sendRedirect("../User/user_write_form.jsp");
	return;
}
%>

<% 
request.setCharacterEncoding("EUC-KR");

String sUserId = (String)session.getAttribute("sUserId");

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

*/
System.out.println(id);
System.out.println(pass);
System.out.println(name);
System.out.println(phone);
System.out.println(email);



Member member = new Member(-97, id, pass, name, phone, email, birh, address, ban, -99);
try{
	//성공
	MemberDaoService.getInstance().create(member);
	out.print("<script>");
	out.print("alert('가입이 완료되었습니다. 축하드립니다.');");
	out.print("location.href = '../User/user_login_form.jsp';");
	out.print("</script>");
/*
	alert('가입이 완료 되었습니다. 축하드립니다');
	response.sendRedirect("user_login_form.jsp");
*/
	return;
} catch(ExistedUserException e) {
	request.setAttribute("fMember", member);
	request.setAttribute("MSG", e.getMessage()); 
	RequestDispatcher rd = request.getRequestDispatcher("../User/user_write_form.jsp");
	rd.forward(request, response);
} catch(Exception e) { %>
	<script>
	alert('가입 실패-메인화면으로');
	</script>
<%	RequestDispatcher rd = request.getRequestDispatcher("../main.jsp");
	rd.forward(request, response);
}

%>



</body>
</html>
