<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.order.order.Order"%>
<%@page import="com.itwill.order.order_detail.OrderDetail"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	if (request.getMethod().equalsIgnoreCase("get")) {
		response.sendRedirect("../Item/item_list.jsp");
		out.print("구입안되나요?");
		return;
	}
	String sUserId = (String)session.getAttribute("sUserId");
    Member sMember = (Member)session.getAttribute("sUser");
	int userPoint = sMember.getM_point();
    
	String qty = request.getParameter("qty");
	String i_type = request.getParameter("type");
	String i_point = request.getParameter("point");

	
	int quantity = Integer.parseInt(qty);
	int point = Integer.parseInt(i_point);
	int type = Integer.parseInt(i_type);
	
	if(quantity*point > userPoint) {
		out.println("<script>");
		out.println("alert('포인트가 부족합니다.  수정해서 이제는 구매가 안된당~');");
		out.println("location.href='../Item/item_list.jsp';");
		out.println("</script>");
		return;
	}
	
	
	MemberDaoService memberManager = MemberDaoService.getInstance();
	OrderService orderManager = OrderService.getInstance();
	Member member = memberManager.findMember(sUserId);
	HashMap<Integer,OrderDetail> ODMap = new HashMap<Integer,OrderDetail>();
	
	OrderDetail od = new OrderDetail(0,type,quantity,quantity*point,0);
	ODMap.put(type, od);
	Order o = new Order(0,member.getM_no(),null,null,ODMap);
	try{
		orderManager.buy(o);
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('포인트가 부족합니다.');");
		out.println("location.href='../Item/item_list.jsp';");
		out.println("</script>");
	}
	response.sendRedirect("../Item/item_list.jsp");
%>