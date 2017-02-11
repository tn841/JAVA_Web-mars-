<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%
	System.out.println("ajax요청:"+request.getMethod());
    String id= request.getParameter("id");
    String name=request.getParameter("name");
%>
<%=id%>,<%=name%>    
    
