<%@page import="com.itwill.cart.ShoppingCartItem"%>
<%@page import="com.itwill.cart.ShoppingCartService"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>



<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" session="true"%>

<%
	ShoppingCartService cart = (ShoppingCartService) session.getAttribute("cart");
	if (cart == null) {
		cart = new ShoppingCartService();
		session.setAttribute("cart", cart);
	}
	Collection<ShoppingCartItem> cartItems = cart.getItems();
	
%>
<!-- <head> -->
<%@include file="../include_head.jsp"%>

<!-- ��� �޴� �� -->
<%@include file="../include_common_header_other.jsp"%>

<script type="text/javascript">
	function buy() {
		if (
<%=session.getAttribute("sUserId") == null%>
	) {
			alert('�α��� �ϼ���');
			location.href = '../user/user_login_form.jsp';
		} else {
			var isOk = window.confirm("���� �����Ͻðڽ��ϱ�?");
			if(isOk==false){
				return;
			}
			location.href = 'shop_buy.jsp';
		}
	}
</script>

<div id="container">
	<div id="wrapper">
		<div id="content">
			<table align="center" border=0 cellpadding=0 cellspacing=0 >
				<tr>
					<td><br />
						<table border="0" cellpadding="0" cellspacing="1" width="590" >
							<tr>
								<p align="right">
								<button type="button" onclick="location.href = 'shop_delete_cart.jsp'" >��ٱ��� ����</button>&nbsp;&nbsp;
								<button type="button" onclick="location.href = '../Item/item_list.jsp'" >��� �����ϱ�</button>

								</p>
							</tr>
						</table>
						<form name="f" method="post">
							<p align="right">
							<table align=center border=1 width=80% cellspacing=0
								bordercolordark=#FFFFFF bordercolorlight=#4682b4>
								<tr>
									<td width=290 height=25 bgcolor=#4682b4 align=center class=t1><font
										color=#FFFFFF>������</font></td>
									<td width=112 height=25 bgcolor=#4682b4 align=center class=t1><font
										color=#FFFFFF>�� ��</font></td>
									<td width=166 height=25 bgcolor=#4682b4 align=center class=t1><font
										color=#FFFFFF>����Ʈ</font></td>
									<td width=50 height=25 bgcolor=#4682b4 align=center class=t1><font
										color=#FFFFFF>�� ��</font></td>
								</tr>
								<%
									int tot = 0;
									Iterator<ShoppingCartItem> cartItemsIter = cartItems.iterator();
									while (cartItemsIter.hasNext()) {
										ShoppingCartItem cartItem = cartItemsIter.next();
								%>
								<!-- cart item start -->
								<tr>
									<td width=290 height=26 align=center class=t1><%=cartItem.getItem().getI_name()%></td>
									<td width=112 height=26 align=center class=t1><%=cartItem.getQuantity()%></td>
									<td width=166 height=26 align=center class=t1><%=cartItem.getTot()%></td>
									<td width=50 height=26 align=center class=t1><a
										href='shop_delete_item_cart.jsp?i_type=<%=cartItem.getItem().getI_type()%>' class=m1>����</a></td>
								</tr>
								<!-- cart item end -->
								<%
									}
								%>

								<tr>
									
								</tr>
							</table>
							</p>
						</form> <br />
						<table>
						<tr>
						<td width=640 colspan=4 height=26 class=t1>
										<p align="right">
											<font color=#FF0000>�� ����Ʈ : <%=cart.getTotal()%> ����Ʈ
											</font>
										</p>
									</td>
						</tr>
						</table>
						<p align="center">
						<button type="button" onclick="buy()" >�ֹ�����</button>
									</p></td>
				</tr>
			</table>
		</div>
	</div>
</div>

<!-- �ϴ� -->
<%@include file="../include_common_footer.jsp"%>

</body>
</html>