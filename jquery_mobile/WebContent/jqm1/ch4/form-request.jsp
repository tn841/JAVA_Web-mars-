<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	System.out.println("email : "+email);

%>

<div data-role="page" data-theme="a">
            <div data-role="header" data-add-back-btn="true">
                <h1>결과</h1>
            </div>
            <div data-role="content">
               입력한 이메일 : <%=email%>
            </div>
</div>