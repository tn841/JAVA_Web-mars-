<%@page import="com.itwill.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String r_no = request.getParameter("r_no");

	ReservationService rService = new ReservationService();
	if(rService.deleteByRno(Integer.parseInt(r_no)) == 1){
		out.println("<script>alert('성공적으로 예약취소 되었습니다.'); location.href='../User/user_modify_form.jsp';</script>");
	}else
%>
 <h1><%=r_no %> 예약 삭제</h1> <hr>
