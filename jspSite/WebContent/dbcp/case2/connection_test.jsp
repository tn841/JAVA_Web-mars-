<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB2");
	Connection con = null;
	try {
		con = ds.getConnection();
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from guest");
		while (rs.next()) {
			out.println("<li>" + rs.getInt("guest_no") + "|"
					+ rs.getString("guest_name") + "|"
					+ rs.getString("guest_email")+"</li>");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<li>Connection:<%=con%></li>
