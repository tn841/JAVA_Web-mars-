
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
	//1. ����Ŭ DB �ε�
	String driver = "oracle.jdbc.driver.OracleDriver";
	try{
		Class.forName(driver); // httpServlet�� ��� �޾ұ� ������ ����ó�� ������ ���ų� �� ���Ը� throw�� �� �ִ�. -> try-catch�� ����ó��
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
<p align=center><font size=5 color=#0000FF>�¢� JDBC �׽�Ʈ 1�¢�</font><br>
<table width=80% align=center border=1 cellspacing=0 bordercolordark=white bordercolorlight=#ADADAD>
<tr bgcolor=#000000 class=t1>
<td align=center height=20 width=25%><font color=#FFFFFF>�̸�</font></td>
<td align=center height=20 width=25%><font color=#FFFFFF>��ȭ��ȣ</font></td>
<td align=center height=20 width=50%><font color=#FFFFFF>�ּ�</font></td>
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
