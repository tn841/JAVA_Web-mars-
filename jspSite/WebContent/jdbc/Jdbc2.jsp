<%@page import="com.itwill.address.AddressDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.address.AddressDao"%>
<%@ page
language="java"
contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"
 %>
 
<%
//1. Dao 생성
	AddressDao addrDao = new AddressDao();
	System.out.println(addrDao);

	ArrayList<AddressDTO> addrList = new ArrayList<AddressDTO>();
	
	addrList = addrDao.selectAll();	
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type=text/css>

</style>
</head>
<body>
<br>
<p align=center><font size=5 color=#0000FF>◈◈ JDBC 테스트 2[Dao]◈◈</font><br>
<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>
<tr bgcolor=#000000 class=t1>
<td align=center height=20 width=25%><font color=#FFFFFF>이름</font></td>
<td align=center height=20 width=25%><font color=#FFFFFF>전화번호</font></td>
<td align=center height=20 width=50%><font color=#FFFFFF>주소</font></td>
</tr>

<% for(AddressDTO addr : addrList){ %>

<tr class=t1>
<td align=center width=25% height=20><%=addr.getName() %></td>
<td align=center width=25% height=20><%=addr.getPhone() %></td>
<td align=center width=50% height=20><%=addr.getAddress() %></td>
</tr>
<% } %>




</table>
</body>
</html>
