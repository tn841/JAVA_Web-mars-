<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.user.UserService"%>
<%@page import="com.itwill.user.User"%>
<%@page import="com.itwill.user.PasswordMismatchException"%>
<%@page import="com.itwill.user.UserNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.sendRedirect("user_list.do");
%>