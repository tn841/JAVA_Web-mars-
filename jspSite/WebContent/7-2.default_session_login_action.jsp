<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("7-2.defalut_session_login.jsp");
		return;
	}

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	

	/*
		id   : user1,user2
		pass : 1111 ,2222
 	*/
 	
 	boolean isMember1=id.equals("user1")&& pass.equals("1111");
 	boolean isMember2=id.equals("user2")&& pass.equals("2222");
 	if(!(isMember1 || isMember2)){
 		//login����
		out.print("<script>"); 		
		out.print("alert('���̵�,�о����带 Ȯ���ϼ���');"); 		
		out.print("location.href='7-2.default_session_login.jsp'"); 		
		out.print("</script>");
		return;
 	}
 	//login����
 	session.setAttribute("sid", id);
 	response.sendRedirect("7-2.default_session_use1.jsp");
%>
    