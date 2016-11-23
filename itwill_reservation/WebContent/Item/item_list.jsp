<%@page import="com.itwill.item.ListNowGroup"%>
<%@page import="com.itwill.item.ListPageConfig"%>
<%@page import="com.itwill.item.ItemService"%>
<%@page import="com.itwill.item.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//1. 요청페이지번호
	String pageno=request.getParameter("pageno");
	if(pageno==null || pageno.equals("")){
		pageno="1";
	}
	//2. 한페이지에 표시할 게시물수
	int rowCountPerPage = 8;
	//3. 한페이지에보여줄 페이지 번호갯수
	int pagecountPerPage = 3;
	//페이징(계산)을위한DTO
	ListPageConfig pageConfig
		=new ListPageConfig(rowCountPerPage,pagecountPerPage,pageno);

	//게시물조회
	ListNowGroup currPage 
		= ItemService.getInstance().findItemList(pageConfig);
	ArrayList<Item> itemList=currPage.getItemList();
	
	//아이템 리스트 히트순으로 받기
	ArrayList<Item> itemListAsHit=new ArrayList<Item>();
	int start=1; //best아이템 순위 시작번호
 	int end =4;  //best아이템 순위 끝번호			
	itemListAsHit=ItemService.getInstance().findItemListAsHit(start, end);

%>
<%@ include file="../include_head.jsp"%>
<style>
#item_tab td {
	padding: 0 400px 0 500px ;
}
#content{
    position:absolute; top:100px; left:50%; margin-left:-500px; z-index:1;
	background:white;
    width:1000px;
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
		</div>
		<!-- header end -->
		<!-- wrapper start -->
		<div id="wrapper" >
		<!-- content start-->
			
					<table border=0 cellpadding=0 cellspacing=0 align="center" >
					<tr> <!-- <tr></tr> 행구분 -->
						<td><br/>
						<!-- 타이틀표시 -->
						<table id="item_tab"  style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
							<tr>
								<td align="center" bgcolor="f4f4f4" height="50" align="center" >&nbsp;&nbsp;
								<a href="item_list.jsp"><font size="50" ><b>아이템몰 - 아이템리스트</b></font></a>
								</td>
							</tr>
						</table>
						<!-- end 타이틀표시 -->
						<!-- ♠ 총 10 건 | 현재페이지( 4 / 4 ) -->
						<table border=0 cellpadding=0 cellspacing=0 align="right">
							<tr bgcolor="#FFFFFF">
								<td  height="20" class="t1"  valign="bottom">
									♠ 총 <font color="#FF0000"><%=currPage.getTotalRecordCount()%></font>
									건 | 현재페이지( <font color="#FF0000"><%=currPage.getSelectPageNo()%></font>
									/ <font color="#0000FF"><%=currPage.getTotalPageCount()%></font>
									)
								</td>
							</tr>
						</table><br/>
						<!-- end -->
						<!-- 인기 아이템 뿌리기 -->
						
						<table  width="100%"  border="5" cellspacing="0"
							  cellpadding="3" bordercolor="pink" >
							<tr>
								<div class="page-header" style="margin: 0; margin-bottom: -17px;">
								  	<h1><font style="color:rgb(255, 51, 153)">히트다 히트<font/> <small>인기아이템</small></h1>
								</div>
								<%
									for(Item item : itemListAsHit){
								%>
								<td width="25%" align="center"  ><br/>
								<a href="item_detail.jsp?type=<%=item.getI_type()%>">
								<img width="200px" height="200px" alt="아이템 이미지" src="../img/item/<%=item.getI_image()%>"></a><br/><br/>
								<b>아이템 : <%=item.getI_name() %></b><br/>
								<font color="#FF0000">포인트 가격 : <%=item.getI_point() %></font>
								</td>
								<% }%>
							</tr>
						</table>
					<!-- end list -->
					<br>
						<!-- 아이템 뿌리기 list -->
					<form name="Item_f" action="" method="post" width=1500>
						<table id="item_t" width="100%"  border="1" cellspacing="0"
							  cellpadding="3" bordercolordark="white" bordercolorlight="#556b2f">
							  
							<%
								for(int j=0; j < (itemList.size()/4+1);j++){
							%>
							<tr>
								<%
									for(int i=0; i<4; i++){ 
										int z=i+(j*4);
										if(z > (itemList.size()-1)) break;
								%>
								<td width="25%" align="center"  ><br/>
								<a href="item_detail.jsp?type=<%=itemList.get(z).getI_type()%>">
								<img width="150px" height="150px" alt="아이템 이미지" src="../img/item/<%=itemList.get(z).getI_image()%>"></a><br/><br/>
								<b>아이템 : <%=itemList.get(z).getI_name() %></b><br/>
								<font color="#FF0000">포인트 가격 : <%=itemList.get(z).getI_point() %></font>
								</td>
								<% }%>
							</tr>
							<%} %>
						</table>
					<!-- end list -->
					</form><br>
					<!-- start paging -->
						<table border="0" cellpadding="0" cellspacing="1" width="590" align="center">
						<tr>
							<td align="center">
								<%if (currPage.isShowFirst()) {%>
									<a href="./item_list.jsp?pageno=1">◀◀</a>&nbsp;
								<%}%>
								<%if (currPage.isShowPreGroup()) {%>
									<a href="./item_list.jsp?pageno=<%=currPage.getPreGroupStartPage()%>">◀</a>&nbsp;&nbsp;
								<%} %>
								<%
									for(int i = currPage.getStartPageNo(); 
											i <= currPage.getEndPageNo(); i++){
										if (currPage.getSelectPageNo() == i){
											//현재 선택된 페이지
								%>
								<font color='red'><strong><%=i %></strong></font>&nbsp;
								<%} else { 
									//다음 선택할 페이지
								%>
								<a href="./item_list.jsp?pageno=<%=i %>"><strong><%=i%></strong></a>&nbsp;
								<%
								  }
								}
								%>
								<% if (currPage.isShowNextGroup()) { %>
								<a href="./item_list.jsp?pageno=<%=currPage.getNextGroupStartPage()%>">▶</a>&nbsp;
								<%}%>
								<% if (currPage.isShowLast()) { %>
								<a href="./item_list.jsp?pageno=<%=currPage.getTotalPageCount()%>">▶▶</a>&nbsp;
								<%}%> 
										
							</td>	
						</tr>
						</table>
					<!-- end paging -->
						</td>
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