<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@include file ="../include_head.jsp" %>

<%@include file ="../include_common_header_other.jsp" %>


    
<% 
if(request.getMethod().equalsIgnoreCase("get")) {
	response.sendRedirect("user_findId_form.jsp");
	return;
}
//�Ķ��Ÿ �ޱ�
request.setCharacterEncoding("EUC-KR");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");

//����
try{
	String m_id = null;
	Member member = MemberDaoService.getInstance().findMByBP(birth, phone);
	m_id = member.getM_id();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="../User/user_login_form.jsp">

������ ���̵�� �Ʒ��� �����ϴ�<input type="text" value="<%=m_id%>">
<input type="submit" value="�α��� ȭ������ ���ư���" >
</form>
<%@include file ="../include_common_footer.jsp" %>
</body>
</html>
<%
} catch(Exception e) { 
	out.println("<script>");
	out.println("alert('�ùٸ� ���� �Է� ���ּ���');");
	out.println("location.href='../User/user_findId_form.jsp'");
	
	out.println("</script>");
 }%>