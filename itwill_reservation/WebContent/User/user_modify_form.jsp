<%@page import="com.itwill.item.Item"%>
<%@page import="com.itwill.item.ItemService"%>
<%@page import="com.itwill.order.order_detail.OrderDetail"%>
<%@page import="java.util.Collection"%>
<%@page import="com.itwill.order.OrderService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.ReservationService"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@include file="../include_head.jsp"%>
<%@include file="../include_common_header_other.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	/*
	if(request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("user_list.jsp");
		return;
	}
	*/

	sUserId = (String) session.getAttribute("sUserId");
	if (sUserId != null) {

		Member member = (Member) session.getAttribute("sUser");

		//String m_id = request.getParameter("m_id");
		Member reallMember = MemberDaoService.getInstance().findMember(member.getM_id());
		
		//예약정보
		ArrayList<HashMap<String, Object>> rlist = new ArrayList<HashMap<String, Object>>();
		ReservationService rService = new ReservationService();
		rlist = rService.getR_by_MemberId(member.getM_no());
		Collection<OrderDetail> col = OrderService.getInstance().getOrder(member.getM_no()).getOdMap().values();
		ArrayList<Item> itemList = ItemService.getInstance().selectAll(1, 19);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보수정</title>
<script type="text/javascript">
	function modify() {
		f.action = "../User/user_modify_action.jsp";
		f.submit();
	}

	function userList() {
		f.action = "../User/user_list.jsp";
		f.submit();
	}
	function remove() {
		f.action = "../User/user_remove_action.jsp";
		f.submit();
	}

	function combackMenu() {
		f.action = "../main.jsp";
		f.submit();
	}
	
	function reserv_cancel(){
		rf.action = "../reservation/reserve_cancle.jsp";
		rf.submit();
	}
</script>
<script type="text/javascript">
<!-- 아이템 사용-->
	function item_action(){
		itemf.action = "../Item/reserve_item_use_view.jsp";
		itemf.submit();
	}


</script>
</head>
<body>


<!-- 회원개인정보 수정 -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 well">
				<div class="page-header">
					<h1>
						회원정보 <small>내정보</small>
					</h1>
				</div>
				
				
				<form name="f" method="post">
					<input type="hidden" name="m_number" value="<%=member.getM_no()%>">
					<input type="hidden" name="m_point" value="<%=member.getM_point()%>">
					<input type="hidden" name="m_Id" value="<%=member.getM_id()%>">
				  <div class="form-group">
				    <label for="exampleInputEmail1">아이디 : <%=member.getM_id()%></label>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">비밀번호</label>
				    <input type="password" class="form-control" name="m_password" value="<%=member.getM_password()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">비밀번호 확인</label>
				    <input type="password" class="form-control" name="password2" value="<%=member.getM_password()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">이름</label>
				    <input type="text" class="form-control" name="name" value="<%=member.getM_name()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">전화번호</label>
				    <input type="text" class="form-control" name="phone" value="<%=member.getM_phone()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">이메일</label>
				    <input type="text" class="form-control" name="email" value="<%=member.getM_email()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">생일</label>
				    <input type="text" class="form-control" name="birth" value="<%=member.getM_birth()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">주소</label>
				    <input type="text" class="form-control" name="address" value="<%=member.getM_address()%>">
				  </div>
				 
				  <div class="form-group">
				    <label for="exampleInputPassword1">반</label>
				    <input type="text" class="form-control" name="ban" value="<%=member.getM_class()%>">
				  </div>
				    
					<button type="submit" class="btn btn-default" value="수정" onClick="modify()">수정</button> &nbsp; 
					<button type="submit" class="btn btn-default" value="탈퇴" onClick="remove()">탈퇴</button> &nbsp; 
					<button type="submit" class="btn btn-default" value="돌아가기" onClick="combackMenu()">돌아가기</button>
				  
				</form>
				
			</div>
			<!-- 예약정보 확인/취소 -->
			<div class="col-md-6 well">
				<div class="page-header">
					<h1>
						예약정보 <small>예약</small>
					</h1>
				</div>
				<% if(rlist.size() > 0) {%>
				<form name="rf" method="post">
					<div class="form-group">
						<input type="hidden" name="r_no" value="<%=rlist.get(0).get("r_no")%>">
						<label for="exampleInputEmail1">예약번호 : <%=rlist.get(0).get("r_no")%></label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">예약자 : <%=member.getM_name()%> 님</label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">예약좌석 : 15층 - <%=rlist.get(0).get("s_no")%>번 자리</label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">예약날짜 : <%=rlist.get(0).get("enroll_time")%></label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">예약시간 : <%=rlist.get(0).get("r_s_time")%>~<%=rlist.get(0).get("r_e_time")%></label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">예약인원 : <%=rlist.size()%></label>
					</div>
				</form>
					<button type="submit" class="btn btn-default" value="예약취소" onClick="reserv_cancel()">예약취소</button> &nbsp;
				  <%}else {%>
				  	<label for="exampleInputEmail1">예약 정보가 없습니다.</label>
				  <%} %>
				  
				
			</div>
			
			<!--  아이템 정보 및 사용 -->
			<div class="col-md-6 well">
				<div class="page-header">
					<h1>
						아이템정보 <small>아이템</small>
					</h1>
				</div>
				<% for(OrderDetail od : col) {%>
				<%if(od==null){%> 
					<label for="exampleInputEmail1">아이템이 없습니다.</label>
				<%
					break;
				}
				%>
				
				<form name="itemf" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">아이템 타입 : 
						<%for(int j = 0 ; j < itemList.size() ; j++){
							if(itemList.get(j).getI_type()==od.getI_type()){
								%><%=itemList.get(j).getI_name()%><%
								break;
							}
						}
						%></label>
					
						 <br/><label for="exampleInputEmail1">아이템 갯수 : <%=od.getJd_quantity()%> 개</label>
					&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-default" value="아이템사용" onClick="item_action()">아이템사용</button>  &nbsp;
											<input type="hidden" name=type value=<%=od.getI_type()%>>
					</div>
					
				</form> 
				  
				  <%} %>
				  
				
			</div>
			
			
		</div>


					<%
						} else {
							response.sendRedirect("main.jsp");
							return;
						}
					%>
					</div>
					<!-- container -->
					<%@include file="../include_common_footer.jsp"%>
</body>
</html>