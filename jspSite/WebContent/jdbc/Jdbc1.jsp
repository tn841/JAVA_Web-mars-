
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page
language="java"
contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"
 %>
 
<%
	//1. 오라클 DB 로딩
	String driver = "oracle.jdbc.driver.OracleDriver";
	try{
		Class.forName(driver); // httpServlet을 상속 받았기 때문에 예외처리 범위가 같거나 더 좁게만 throw할 수 있다. -> try-catch로 예외처리
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@210.16.214.203:1521:XE","user21", "user21");
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from address order by no desc");
		
		System.out.println(rs);
	
		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/com.css">
		
</head>
<body>
<br>
<p align=center><font size=5 color=#0000FF>◈◈ JDBC 테스트 1◈◈</font><br>
<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>
<tr bgcolor=#000000 class=t1>
<td align=center height=20 width=25%><font color=#FFFFFF>이름</font></td>
<td align=center height=20 width=25%><font color=#FFFFFF>전화번호</font></td>
<td align=center height=20 width=50%><font color=#FFFFFF>주소</font></td>
</tr>


<% while(rs.next()){ %>
<tr class=t1>
<td align=center width=25% height=20><%=rs.getString("name")%></td>
<td align=center width=25% height=20><%=rs.getString("phone")%></td>
<td align=center width=50% height=20><%=rs.getString("address")%></td>
</tr>
<% } %>

</table>
</body>
</html>

<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
