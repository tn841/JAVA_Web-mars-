<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=0;i<400000;i++){
		System.out.println(" ");
	}
	String id=request.getParameter("id");
	String msg="";
	if(id.startsWith("guard")){
		msg=id+" 사용가능";
	}else{
		msg=id+" 사용불가능";
	}
%>
<%=msg%>    
