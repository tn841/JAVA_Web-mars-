<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
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
String id = request.getParameter("id");
String birth = request.getParameter("birth");
String phone = request.getParameter("phone");

//����
try{
	String pass = null;
	Member member1 =  MemberDaoService.getInstance().findMember(id);
	Member member2 =  MemberDaoService.getInstance().findMByBP(birth, phone);
	if(member1.getM_password().equals(member2.getM_password())) {
		pass = member1.getM_password();
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="../User/user_login_form.jsp">
������ �н������ �Ʒ��� �����ϴ�<input type="text" value="<%=pass%>">

<input type="submit" value="�α��� ȭ������ ���ư���" >
</form>

   <%@include file ="../include_common_footer.jsp" %>
</body>
</html>
<% 	
} 

catch(UserNotFoundException e) {
	request.setAttribute("MSG", e.getMessage());
	RequestDispatcher rd = request.getRequestDispatcher("user_write_form.jsp");
	rd.forward(request, response);
} catch (Exception e){ 
	out.println("<script>");
	out.println("alert('�ùٸ� ���� �Է� ���ּ���');");
	out.println("</script>");
 } %>