<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String sUserId = (String)session.getAttribute("sUserId");
if(sUserId == null) {
	response.sendRedirect("main.jsp");
	return;
}


%>