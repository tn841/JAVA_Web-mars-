<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println(">>> ajaxRequest 요청");
	String id = (String)request.getParameter("id");
	String msg = "";
	if(id.startsWith("t")){
		msg = id+" 사용가능";
	}else{
		msg = id+" 사용불가능";
	}
	Thread.sleep(1000);
%>
<%=msg%>