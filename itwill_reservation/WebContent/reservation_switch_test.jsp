<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.ReservationDao"%>
<%@page import="com.itwill.item.ItemService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ReservationDao rd = ReservationDao.getInstance();
	ItemService is = ItemService.getInstance();
	/* ArrayList<HashMap<String, Object>> rList = rd.selectByRmno(1);
	System.out.println(rList.get(0).get("r_no")); */
	is.swithSeat(1, 11);
%>
</body>
</html>