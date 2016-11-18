<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="org.apache.catalina.tribes.MembershipService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    
    if(request.getMethod().equalsIgnoreCase("get")) {
    	response.sendRedirect("user_login_form.jsp");
    }
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String forwardPath ="";
    try{
    Member loginMember = MemberDaoService.getInstance().login(id, pass);
    //로그인 성공시
    session.setAttribute("sUserId", id);
    session.setAttribute("sUser", loginMember);
    response.sendRedirect("main.jsp");
    return;
    }catch(UserNotFoundException e){
    	//아이디가 없을때
    }catch(PasswordMismatchException e) {
    	
    }catch(Exception e) {
    	
    }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>