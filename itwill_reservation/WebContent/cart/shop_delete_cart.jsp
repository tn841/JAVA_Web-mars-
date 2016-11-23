<%@page import="com.itwill.cart.ShoppingCartService"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	/* if (request.getMethod().equalsIgnoreCase("get")) {
		response.sendRedirect("../Item/item_list.jsp");
		return;
	} */
	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		cart=new ShoppingCartService();
		session.setAttribute("cart", cart);
	}
	cart.clear();
	response.sendRedirect("../Item/item_list.jsp");
%>