<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String guest_email = request.getParameter("guest_email");
	if(guest_email == null){
		guest_email="";
	}
	
	String result = "";
	if(guest_email.startsWith("t")){
		result = "true";
	}else{
		result = "false";
	}
%>

<%=result%>