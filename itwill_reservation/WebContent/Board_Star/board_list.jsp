<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.util.ListResultBean"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.util.ListPageConfigBean"%>

<%@include file="../include_head.jsp" %>
<%@include file="../include_common_header_other.jsp" %>

<div id="navigation" align="left">



</div>




<%
/*
String sUserID = (String)session.getAttribute("sUserId");
if(sUserID==null) {
	out.print("<script>");
	out.print("alert('로그인 한 후에 기입이 가능합니다');");
	out.print("location.href='../User/user_login_form.jsp'");
	out.print("</script>");
	
}
*/
%>

<% 


%>

<%!
public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getTitle();
		if (t.length() > 10) {
			//t = String.format("%s...", t.substring(0, 10));
			t =  t.substring(0, 10)+"...";
		}
		//답글공백삽입
		
		for (int i = 0; i < board.getDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		// re image 삽입
		if (board.getDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		
		
		title.append(t.replace(" ", "&nbsp;"));
		return title.toString();
	}
%>

<%
//1.요청페이지번호	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}	
//2.한페이지에표시할 게시물수 
int rowCountPerPage = 10;
//3.한페이지에보여줄 페이지번호갯수(<< 1 2 3 4 5 >>)
int pageCountPerPage = 5;
//페이징(계산)을위한DTO
ListPageConfigBean pageConfig=
		new ListPageConfigBean(rowCountPerPage,pageCountPerPage,pageno,"","");

//게시물조회
ListResultBean boardListPage 
	=BoardService.getInstance().findBoardList_star(pageConfig);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<!-- 
<link rel=stylesheet href="../css/styles.css" type="text/css">

<link rel=stylesheet href="../css/board.css" type="text/css">
 -->
<script type="text/javascript">
	function boardCreate() {
		location.href = "board_write.jsp";
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<%@include file="../include_common_Board.jsp" %>>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->

			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0 align ="center">
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0 align ="center"
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>평가 게시판-불만 있으면 입 아프게, 말로하지말고 글로 합시다</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">♠
										총 <font color="#FF0000"><%=boardListPage.getTotalRecordCount()%></font>
										건 | 현재페이지( <font color="#FF0000"><%=boardListPage.getSelectPageNo()%></font>
										/ <font color="#0000FF"><%=boardListPage.getTotalPageCount()%></font>
										)
									</td>
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴이</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">평점</td>
									</tr>
									<%
										for (Board board : boardListPage.getList()) {
									%>
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left"><a
											href='board_view.jsp?boardno=<%=board.getBoardNo()%>&pageno=<%=boardListPage.getSelectPageNo()%>'><%=getTitleString(board)%></a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=board.getWriter()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%=board.getRegDate().toString().substring(0, 10)%>
										</td>
										<%
										//board.setB_score("5점");
										//System.out.println(board.getB_score()); 
										
										%>
										<% if(board.getB_score().equals("만족")) {%>
										<td width=70 align=center bgcolor="ffffff" align="left">
										<img src="../img/up.png" width="55%">
										<% 
										}else{
										%>
											
										<td width=70 align=center bgcolor="ffffff" align="left">
										<img src="../img/down.png" width="35">
										
										
										
										<%	
											} 
											%>
										
										 
										
										</td>
									</tr>
									<!-- 
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10"><a
											href='board_view.jsp?boardno=532&pageno=6'>게시판타이틀514</a></td>
										<td width=120 align=center bgcolor="ffffff">김경호514</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10">2014-12-23
										</td>
										<td width=70 align=center bgcolor="ffffff">0</td>
									</tr>
									 -->
									<% 
										}
									%>
									
								</table>
								<!-- /list -->
							</form> <br>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
										<%if (boardListPage.isShowFirst()) {%> 
											<a href="./board_list.jsp?pageno=1">◀◀</a>&nbsp; 
										<%}%> 
										<%if (boardListPage.isShowPreviousGroup()) {%>
											<a href="./board_list.jsp?pageno=<%=boardListPage.getPreviousGroupStartPageNo()%>">◀</a>&nbsp;&nbsp;
										<%}%>
										<%
										 for (int i = boardListPage.getStartPageNo(); i <= boardListPage
										 			.getEndPageNo(); i++) {
											 	if (boardListPage.getSelectPageNo() == i) {
												%>
												 <font color='red'><strong><%=i%></strong></font>&nbsp;
												<%} else {%>
												<a href="./board_list.jsp?pageno=<%=i%>"> <strong><%=i%></strong></a>&nbsp;
												<%}%>
										 <%}%>
										<%
	 									if (boardListPage.isShowNextGroup()) {
	 									%> <a
											href="./board_list.jsp?pageno=<%=boardListPage.getNextGroupStartPageNo()%>">▶&nbsp;</a>
											<%
												}
											%> <%
	 										if (boardListPage.isShowLast()) {
	 										%> <a
											href="./board_list.jsp?pageno=<%=boardListPage.getTotalPageCount()%>">▶▶</a>&nbsp;
											<%
												}
											%>
									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right"><input type="button" value="게시물 생성"
										onclick="boardCreate();" /></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			
			
			<!-- include_content.jsp end-->
			<%@include file="../include_common_footer.jsp" %>
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>