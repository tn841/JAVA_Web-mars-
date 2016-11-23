<%@page import="com.itwill.item.ItemService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String type=request.getParameter("type");
	String qty=request.getParameter("qty");
	String point=request.getParameter("point");

	int itemType=Integer.parseInt(type);
	
	String a=request.getParameter("a");
	ItemService.getInstance().hitsUp(itemType);
	
	request.setAttribute("type", type);
	request.setAttribute("qty", qty);
	request.setAttribute("point", point);
	
	 if(a.equals("1")){
%>
	<jsp:forward page="../cart/shop_buy_item.jsp"></jsp:forward>
<%
		
	}else if(a.equals("2")){
%>
	<jsp:forward page="../cart/shop_add_cart.jsp"></jsp:forward>
<%
	}
%>		
