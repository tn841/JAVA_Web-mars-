<%@page import="com.itwill.user.MemberDaoService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String sUserId = (String)session.getAttribute("sUserId");
int removeRow = MemberDaoService.getInstance().remove(sUserId);

if(removeRow == 0) { %>
<script>
	alert('ȸ�� ���� ����');
	location.href = 'user_modify_form.jsp';
</script>
<%}else { %>
<script>
	alert('ȸ�� ���� ����');
	location.href = 'user_logout_action.jsp';
</script>
<% }%>