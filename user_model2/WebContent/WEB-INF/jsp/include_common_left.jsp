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
	<strong>�� ��</strong>
</p>
<ul>
<% if(sUserId != null){ %>
		<li><a href=""><%=sUserId%>��</a>&nbsp;<a href="user_logout_action.do">�α׾ƿ�</a></li>
<%}else{ %>
		<li><a href="user_login_form.do">�α���</a></li>
<% }%>	
		<li><a></a></li>
		<% if(sUserId != null) { %>
		<li><a href="">����</a></li>
		<li><a href="">���θ�</a></li>
		<% } %>
		<li><a href="javascript:<%=userState%>;">ȸ������</a></li>
		<% if(sUserId != null) { %>
		<li><a href="">�Խ���</a></li>
		<% } %>
		
</ul>

<script>
	function userLogin(){
		alert('�α��� �ϼ���');
		location.href='user_login_form.do';		
	}
	function userList(){
		location.href='user_list.do';
	}
</script>