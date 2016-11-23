<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>

<!-- 
<meta http-equiv="Content-Type" content="text/html; charset=MS949"/>
 -->
<title></title>
</head>
<body>

	<%
		request.setCharacterEncoding("EUC-KR");

		String no = request.getParameter("m_number");
		String id = request.getParameter("m_Id");
		String pass = request.getParameter("m_password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String ban = request.getParameter("ban");
		String point = request.getParameter("m_point");

		Member updateMember = new Member(Integer.parseInt(no), id, pass, name, phone, email, birth, address, ban,
				Integer.parseInt(point));

		System.out.println(updateMember.getM_no());
		System.out.println(updateMember.getM_id());
		System.out.println(updateMember.getM_password());
		System.out.println(updateMember.getM_name());
		System.out.println(updateMember.getM_phone());
		System.out.println(updateMember.getM_email());
		System.out.println(updateMember.getM_birth());
		System.out.println(updateMember.getM_address());
		System.out.println(updateMember.getM_class());
		System.out.println(updateMember.getM_point());

		MemberDaoService.getInstance().update(updateMember);

		session.removeAttribute("sUserId");
		session.removeAttribute("sUser");

		session.setAttribute("sUserId", id);
		session.setAttribute("sUser", updateMember);

		response.sendRedirect("../main.jsp");
	%>



</body>
</html>
