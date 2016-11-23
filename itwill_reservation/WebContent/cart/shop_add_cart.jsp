
<%@page import="com.itwill.item.ItemService"%>
<%@page import="com.itwill.cart.ShoppingCartService"%>
<%@page import="com.itwill.item.Item"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	if (request.getMethod().equalsIgnoreCase("get")) {
		response.sendRedirect("../Item/item_list.jsp");
		return;
	}


	String i_type = request.getParameter("type");
	String qty = request.getParameter("qty");
	if (i_type == null || qty == null) {
		response.sendRedirect("../Item/item_list.jsp");
		return;
	}
	
	
	Item item = ItemService.getInstance().selectByType(Integer.parseInt(i_type));

	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		cart = new ShoppingCartService();
		session.setAttribute("cart", cart);
	}
	cart.add(i_type, item, Integer.parseInt(qty));
	response.sendRedirect("../cart/shop_view_cart.jsp");
%>
