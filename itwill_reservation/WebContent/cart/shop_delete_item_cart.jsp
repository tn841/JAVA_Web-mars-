<%@page import="com.itwill.cart.ShoppingCartService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//장바구니에서 원하는 품목을 삭제시킨 후 view_cart.jsp 로 sendRedirect 시킨다..
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
