<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<TITLE>방가워요 JSP</TITLE>
</head>
<BODY>
<center><H2>JSP 잘났어 정말 별꼴이야!!!!!!!!!</H2><center>
<div><% out.print(new java.util.Date()); %></div>
<img src='tomcat.gif'>
<center><H2>JSP 구구단</H2></center>
<table border=1 width=1000 bgcolor=#CCFF33 bordercolordark=#FF6600 cellspacing=0>

<% for(int i=2; i<10; i++){ %>
<tr>
	<% for(int j=2; j<10; j++){ %>
		<td align=center><% out.print(j); %> * <% out.print(i);%>= <%out.print(i*j); %></td>
	<% } %>
</tr>
<% } %>

</table>
<hr>
<h3>expression사용 &lt;%= &gt;</h3>
<% for(int i=2; i<10; i++){ %>
<tr>
	<% for(int j=2; j<10; j++){ %>
		<td align=center><%= j %> * <%= i%>= <%= i*j %></td>
	<% } %>
	<br>
</tr>
<% } %>

<br>

</BODY>
</HTML>
