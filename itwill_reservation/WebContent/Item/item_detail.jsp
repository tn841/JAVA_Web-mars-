<%@page import="com.itwill.item.ItemService"%>
<%@page import="com.itwill.item.Item"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String type = request.getParameter("type");
	if (type == null) {
		response.sendRedirect("../Item/item_list.jsp");
		return;
	}
	int itemType = Integer.parseInt(type);
	Item item = ItemService.getInstance().selectByType(itemType);
	if (item == null) {
		out.println("<script>");
		out.println("alert('매진된 아이템입니다.')");
		out.println("location.href='../Item/item_list.jsp'");
		out.println("</script>");
		return;
	}
%>
<%@ include file="../include_head.jsp"%>
<script type="text/javascript">
	function buy(){
		if(f.qty.value<0){
			alert("양수를 입력하세요.");
			return;
		}
		f.action="hitUp_action.jsp?a=1";
		f.method='post';
		
			if (<%=session.getAttribute("sUserId") == null%>) {
				alert('로그인 하세요');
				location.href = '../User/user_login_form.jsp';
				return;
			} else {
				var isOk = window.confirm("정말 구매하시겠습니까?");
				if(isOk==false){
					return;
				}
			}
			f.submit();
		}
	function productList(){
		f.action="item_list.jsp";
		f.submit();
	}
</script>
<style>
#item_tab td {
	padding: 0 200px 0 150px;
}

#content {
	position: absolute;
	top: 100px;
	left: 50%;
	margin-left: -500px;
	z-index: 1;
	background: white;
	width: 1000px;
}
</style>
<body>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_header start -->
			<jsp:include page="../include_common_header_other.jsp"></jsp:include>
			<!-- include_header end -->
			<!-- header end -->
		</div>
		<!-- header end -->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<table style="padding-left: 10px" border=0 cellpadding=0
				cellspacing=0>
				<tr>
					<td bgcolor="f4f4f4" height="10">&nbsp;&nbsp; <a
						href="item_list.jsp"><font size="5" color="#1F7EE4"><b>아이템몰</b></font></a>
						<font size="5" color="#1F7EE4"><b>- 아이템상세</b></font>
					</td>
				</tr>
			</table>
			<table border=0 cellpadding=0 cellspacing=0 align="center" width=40%>
				<tr>
					<td><br />
						<table style="margin-left: 10px" border=0 width=100%>
							<tr valign=bottom>
								<td width=30%  class=t1><font size=5
									color=#0000FF><b>아이템 : <%=item.getI_name()%></b></font></td>
							</tr>
							<tr width=100%>
								<td colspan=3 height=5><hr color=#556b2f></td>
							</tr>
							<tr width=100%>

								<td width=50% height=250 align="center"><img width=250 height=250 border=0
									alt="아이템 이미지" src="../img/item/<%=item.getI_image()%>"
									width=150 height=150></td>
								<td width=60% height=200  class=t1 align="center">
									<ul type="disc">
										<li><b>아이템 : <%=item.getI_name()%>&nbsp;&nbsp;&nbsp;
										</b></li>
										<li><font color=#FF0000>포인트 가격: <%=item.getI_point()%>
												&nbsp;&nbsp;&nbsp;
										</font></li>
										<li><font color=#0000FF><%=item.getI_desc() %>&nbsp;&nbsp;</font></li>
									</ul>
									<br />
									<form name="f" method="post" action="./hitUp_action.jsp?a=2">
										수량 : <input type="number" name="qty" min="1" max="10" value="1" size="4" class="TXTFLD" >
										
										
										개 <br /> <br /> 
										<input type="button" value="구매"	onClick="buy()"> &nbsp; 
										<input type=submit value=장바구니	class=TXTFLD /> 
										<input type="hidden" name=type
											value=<%=item.getI_type()%>> <input type="hidden"
											name=point value=<%=item.getI_point()%>>
									</form>
								</td>
							</tr>
							<tr>
								<td colSpan=3 height=21><hr color=#556b2f></td>
							</tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="1" align="right">
							<tr>
								<td align=center><input type="button" value="아이템몰"
									onClick="productList();"></td>
							</tr>
						</table></td>
				</tr>
			</table>


			<!-- content end -->
		</div>
		<!--wrapper end-->
		<!-- footer start -->
		<!-- include_footer start -->
		<footer>
			<jsp:include page="../include_common_footer.jsp"></jsp:include>
		</footer>
		<!-- include_footer end -->
		<!-- footer end -->
	</div>
	<!--container end-->

</body>
</html>