<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String sUserId = (String)session.getAttribute("sUserId");
%>			
<p>
	<strong>메 뉴</strong>
</p>
<ul>
<% if(sUserId != null){ %>
		<li><a href=""><%=sUserId%>님</a>&nbsp;<a href="user_logout_action.jsp">로그아웃</a></li>
<%}else{ %>
		<li><a href="user_login_form.jsp">로그인</a></li>
<% }%>	
		<li><a></a></li>
		<li><a href="">방명록</a></li>
		<li><a href="">쇼핑몰</a></li>
		<li><a href="user_list.jsp">회원관리</a></li>
		<li><a href="">게시판</a></li>
</ul>