<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String sUserId = (String)session.getAttribute("sUserId");
	String userState = "userLogin()";
	if(sUserId != null){
		userState = "userList()";
	}
%>			
<p>
	<strong>메 뉴</strong>
</p>
<ul>
<% if(sUserId != null){ %>
		<li><a href=""><%=sUserId%>님</a>&nbsp;<a href="user_logout_action.do">로그아웃</a></li>
<%}else{ %>
		<li><a href="user_login_form.do">로그인</a></li>
<% }%>	
		<li><a></a></li>
		<% if(sUserId != null) { %>
		<li><a href="">방명록</a></li>
		<li><a href="">쇼핑몰</a></li>
		<% } %>
		<li><a href="javascript:<%=userState%>;">회원관리</a></li>
		<% if(sUserId != null) { %>
		<li><a href="">게시판</a></li>
		<% } %>
		
</ul>

<script>
	function userLogin(){
		alert('로그인 하세요');
		location.href='user_login_form.do';		
	}
	function userList(){
		location.href='user_list.do';
	}
</script>