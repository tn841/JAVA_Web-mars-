<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cmd=request.getParameter("cmd");
	if(cmd==null){
		response.sendRedirect("6-1.member_menu.jsp");
		return;
	}	
	
	String forwardPath="";
	if(cmd.equals("member_list")){
		
		//MemberDao��ü�� ����ؼ� ArrayList��ü�� ��´�.
		
		ArrayList<String> memberList=new ArrayList<String>();
		memberList.add("��ȿ��");
		memberList.add("�Ÿ���");
		memberList.add("�ְ��");
		memberList.add("������");
		
		request.setAttribute("memberList", memberList);
		
		forwardPath="6-1.member_list.jsp";
		
		
	}else if(cmd.equals("member_login")){
		
		forwardPath="6-1.member_login.jsp";
		
	}else if(cmd.equals("member_detail")){
		//MemberDao��ü�� ����ؼ� MemberDto ��ü�� ��´�.
		request.setAttribute("member", "������");
		forwardPath="6-1.member_detail.jsp";
	}else{
		forwardPath="../error/error.jsp";
	}
%>
<%--
	��� action tag�� property���� <%=%>�̱���ɼ��ִ�

 --%>

<jsp:forward page="<%=forwardPath%>"/>

<%-- 
<jsp:forward page="6-1.member_list.jsp"/>
<jsp:forward page="6-1.member_detail.jsp"/>
<jsp:forward page="6-1.member_login.jsp"/>
--%>









 