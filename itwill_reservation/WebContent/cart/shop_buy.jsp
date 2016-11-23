<%@page import="com.itwill.order.OrderService"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.itwill.order.order_detail.OrderDetail"%>
<%@page import="com.itwill.cart.ShoppingCartItem"%>
<%@page import="java.util.Collection"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.order.order.Order"%>
<%@page import="com.itwill.cart.ShoppingCartService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	
	String sUserId = (String)session.getAttribute("sUserId");
	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	MemberDaoService memberManager = MemberDaoService.getInstance();
	OrderService orderManager = OrderService.getInstance();
	Member member = memberManager.findMember(sUserId);
	HashMap<Integer,OrderDetail> ODMap = new HashMap<Integer,OrderDetail>();
	Collection<ShoppingCartItem> items = cart.getItems();
	for(ShoppingCartItem item : items){
		int i_type = item.getItem().getI_type();
		OrderDetail od = new OrderDetail(0,i_type,item.getQuantity(),item.getTot(),0);
		ODMap.put(i_type, od);
	}
	Order o = new Order(0,member.getM_no(),null,null,ODMap);
	try{
		orderManager.buy(o);
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('포인트가 부족합니다.');");
		out.println("location.href='shop_delete_cart.jsp';");
		out.println("</script>");
	}
	response.sendRedirect("../Item/item_list.jsp");
%>
