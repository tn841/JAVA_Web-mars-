<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String sUserId = (String)session.getAttribute("sUserId");
%>			
<p>
	<strong>�� ��</strong>
</p>
<ul>
<% if(sUserId != null){ %>
		<li><a href=""><%=sUserId%>��</a>&nbsp;<a href="user_logout_action.jsp">�α׾ƿ�</a></li>
<%}else{ %>
		<li><a href="user_login_form.jsp">�α���</a></li>
<% }%>	
		<li><a></a></li>
		<li><a href="">����</a></li>
		<li><a href="">���θ�</a></li>
		<li><a href="user_list.jsp">ȸ������</a></li>
		<li><a href="">�Խ���</a></li>
</ul>