<%@page import="com.itwill.cart.ShoppingCartService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//��ٱ��Ͽ��� ���ϴ� ǰ���� ������Ų �� view_cart.jsp �� sendRedirect ��Ų��..
	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		response.sendRedirect("../Item/item_list.jsp");
		return;

	}
	String i_type = request.getParameter("i_type");
	if (i_type == null || i_type.equals("")) {
		response.sendRedirect("../Item/item_list.jsp");
		return;
	}
	cart.remove(i_type);
	response.sendRedirect("shop_view_cart.jsp");
%>
