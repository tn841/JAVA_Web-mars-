<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="java.util.List"%>
<%@page language = "java" pageEncoding="EUC-KR" contentType="text/html; charset=EUC-KR" %>
<%
	List<Member> memberList= MemberDaoService.getInstance().findMemberList();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
<title></title>
</head>
<body>
<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원리스트</b></td>
								</tr>
							</table>
		
							<form name="f" method="post">
							<table border="0" cellpadding="0" cellspacing="1"
									bgcolor="BBBBBB">
									<tr>
										<td align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td align=center bgcolor="E6ECDE">이름</td>
										<td align=center bgcolor="E6ECDE">이메일</td>
										<td align=center bgcolor="E6ECDE">전화번호</td>
										<td align=center bgcolor="E6ECDE">반</td>
									</tr>
									
									<% for(Member member:memberList){ %>
									<tr>
										<td width=190 align=center bgcolor="ffffff" height="20">
											<%=member.getM_id()%>
										</td>
										<td width=200 bgcolor="ffffff" style="padding-left: 10">
											<a href="user_view.jsp?userId=<%=member.getM_id()%>"
											class="user"><%=member.getM_name() %></a>
										</td>
										<td width=200 align=center bgcolor="ffffff"><%=member.getM_email()%>
										</td>
										<td width=200 align=center bgcolor="ffffff"><%=member.getM_phone()%>
										</td>
										<td width=200 align=center bgcolor="ffffff"><%=member.getM_class()%>
										</td>
									</tr>
									<%} %>
									</table>

</form><br />

</body>
</html>
