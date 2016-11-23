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
		
		//��������
		ArrayList<HashMap<String, Object>> rlist = new ArrayList<HashMap<String, Object>>();
		ReservationService rService = new ReservationService();
		rlist = rService.getR_by_MemberId(member.getM_no());
		Collection<OrderDetail> col = OrderService.getInstance().getOrder(member.getM_no()).getOdMap().values();
		ArrayList<Item> itemList = ItemService.getInstance().selectAll(1, 19);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ����������</title>
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
<!-- ������ ���-->
	function item_action(){
		itemf.action = "../Item/reserve_item_use_view.jsp";
		itemf.submit();
	}


</script>
</head>
<body>


<!-- ȸ���������� ���� -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 well">
				<div class="page-header">
					<h1>
						ȸ������ <small>������</small>
					</h1>
				</div>
				
				
				<form name="f" method="post">
					<input type="hidden" name="m_number" value="<%=member.getM_no()%>">
					<input type="hidden" name="m_point" value="<%=member.getM_point()%>">
					<input type="hidden" name="m_Id" value="<%=member.getM_id()%>">
				  <div class="form-group">
				    <label for="exampleInputEmail1">���̵� : <%=member.getM_id()%></label>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">��й�ȣ</label>
				    <input type="password" class="form-control" name="m_password" value="<%=member.getM_password()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">��й�ȣ Ȯ��</label>
				    <input type="password" class="form-control" name="password2" value="<%=member.getM_password()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">�̸�</label>
				    <input type="text" class="form-control" name="name" value="<%=member.getM_name()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">��ȭ��ȣ</label>
				    <input type="text" class="form-control" name="phone" value="<%=member.getM_phone()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">�̸���</label>
				    <input type="text" class="form-control" name="email" value="<%=member.getM_email()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">����</label>
				    <input type="text" class="form-control" name="birth" value="<%=member.getM_birth()%>">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleInputPassword1">�ּ�</label>
				    <input type="text" class="form-control" name="address" value="<%=member.getM_address()%>">
				  </div>
				 
				  <div class="form-group">
				    <label for="exampleInputPassword1">��</label>
				    <input type="text" class="form-control" name="ban" value="<%=member.getM_class()%>">
				  </div>
				    
					<button type="submit" class="btn btn-default" value="����" onClick="modify()">����</button> &nbsp; 
					<button type="submit" class="btn btn-default" value="Ż��" onClick="remove()">Ż��</button> &nbsp; 
					<button type="submit" class="btn btn-default" value="���ư���" onClick="combackMenu()">���ư���</button>
				  
				</form>
				
			</div>
			<!-- �������� Ȯ��/��� -->
			<div class="col-md-6 well">
				<div class="page-header">
					<h1>
						�������� <small>����</small>
					</h1>
				</div>
				<% if(rlist.size() > 0) {%>
				<form name="rf" method="post">
					<div class="form-group">
						<input type="hidden" name="r_no" value="<%=rlist.get(0).get("r_no")%>">
						<label for="exampleInputEmail1">�����ȣ : <%=rlist.get(0).get("r_no")%></label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">������ : <%=member.getM_name()%> ��</label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">�����¼� : 15�� - <%=rlist.get(0).get("s_no")%>�� �ڸ�</label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">���೯¥ : <%=rlist.get(0).get("enroll_time")%></label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">����ð� : <%=rlist.get(0).get("r_s_time")%>~<%=rlist.get(0).get("r_e_time")%></label>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">�����ο� : <%=rlist.size()%></label>
					</div>
				</form>
					<button type="submit" class="btn btn-default" value="�������" onClick="reserv_cancel()">�������</button> &nbsp;
				  <%}else {%>
				  	<label for="exampleInputEmail1">���� ������ �����ϴ�.</label>
				  <%} %>
				  
				
			</div>
			
			<!--  ������ ���� �� ��� -->
			<div class="col-md-6 well">
				<div class="page-header">
					<h1>
						���������� <small>������</small>
					</h1>
				</div>
				<% for(OrderDetail od : col) {%>
				<%if(od==null){%> 
					<label for="exampleInputEmail1">�������� �����ϴ�.</label>
				<%
					break;
				}
				%>
				
				<form name="itemf" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">������ Ÿ�� : 
						<%for(int j = 0 ; j < itemList.size() ; j++){
							if(itemList.get(j).getI_type()==od.getI_type()){
								%><%=itemList.get(j).getI_name()%><%
								break;
							}
						}
						%></label>
					
						 <br/><label for="exampleInputEmail1">������ ���� : <%=od.getJd_quantity()%> ��</label>
					&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-default" value="�����ۻ��" onClick="item_action()">�����ۻ��</button>  &nbsp;
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