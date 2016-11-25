<%@page import="com.itwill.guest.Guest"%>
<%@page import="com.itwill.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Guest guest = (Guest) request.getAttribute("guest");
	if(guest == null){
		guest = (Guest) request.getAttribute("updateGuest");
	}
	
	String s_msg = (String)request.getAttribute("success_msg");
	String e_msg = (String)request.getAttribute("error_msg");
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">


<link rel="stylesheet"
	href="css/styles.css">
<link rel="stylesheet"
	href="css/guest.css">


<script	src="js/guest.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<%if(s_msg != null){ %>
	<script>alert(<%=s_msg%>);</script>
<%} if(e_msg != null){ %>
	<script>alert(<%=e_msg%>);</script>
<%} %>

	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
		<!-- include_common_top.jsp start-->
		<jsp:include page="include_common_top.jsp"/>	
		<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper content start -->
		<div id="wrapper">
			



<div id="content">
	<table border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td>
				<!--contents--> <br />
				<table style="padding-left: 10px" border=0 cellpadding=0
					cellspacing=0>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>���� ���� -
								���� �󼼺���</b></td>
					</tr>
				</table> <!-- view Form  -->
				<form name="f" method="post">
					<input type="hidden" name="guest_no" value="<%=guest.guest_no%>" />
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">��ȣ</td>
							<td width=490 bgcolor="ffffff" align="left"
								style="padding-left: 10px"><%=guest.guest_no%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">�̸�</td>
							<td width=490 bgcolor="ffffff" align="left"
								style="padding-left: 10px"><%=guest.guest_name%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">��¥</td>
							<td width=490 bgcolor="ffffff" align="left"
								style="padding-left: 10px"><%=guest.guest_date%></td>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">Ȩ������</td>
							<td width=490 bgcolor="ffffff" align="left"
								style="padding-left: 10px"><%=guest.guest_homepage%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
							<td width=490 bgcolor="ffffff" align="left"
								style="padding-left: 10px"><%=guest.guest_title%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="110">����</td>
							<td width=490 bgcolor="ffffff" align="left"
								style="padding-left: 10px"><%=guest.guest_content%></td>
						</tr>
					</table>
				</form> <br />
				<table width=590 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td align=center><input type="button" value="����"
							onClick="guestModify();"> &nbsp; <input type="button"
							value="����" onClick="guestRemove();"> &nbsp; <input
							type="button" value="���" onClick="guestList()"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>


		</div>
		<!-- wrapper content end-->
		<!-- footer start-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
		<!-- footer end -->
	</div>
	<!--container end-->
</body>
</html>