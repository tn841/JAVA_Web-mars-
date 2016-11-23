<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.util.ListResultBean"%>
<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.util.ListPageConfigBean"%>

<% 
String sUserID = (String)session.getAttribute("sUserId");
if(sUserID==null) {
	out.print("<script>");
	out.print("alert('�α��� �� �Ŀ� ������ �����մϴ�');");
	out.print("location.href='../User/user_login_form.jsp'");
	out.print("</script>");
	
}
%>

<%!
public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getTitle();
		if (t.length() > 10) {
			//t = String.format("%s...", t.substring(0, 10));
			t =  t.substring(0, 10)+"...";
		}
		//��۰������
		
		for (int i = 0; i < board.getDepth(); i++) {
			title.append("��");
		}
		/*
		// re image ����
		if (board.getDepth() > 0) {
			title.append("<img border='0' src='../image/re.gif'/>");
		}
		*/
		
		title.append(t.replace(" ", "&nbsp;"));
		return title.toString();
	}
%>

<%
//1.��û��������ȣ	
String pageno=request.getParameter("pageno");
if(pageno==null||pageno.equals("")){
	pageno="1";
}	
//2.����������ǥ���� �Խù��� 
int rowCountPerPage = 10;
//3.���������������� ��������ȣ����(<< 1 2 3 4 5 >>)
int pageCountPerPage = 5;
//����¡(���)������DTO
ListPageConfigBean pageConfig=
		new ListPageConfigBean(rowCountPerPage,pageCountPerPage,pageno,"","");

//�Խù���ȸ
ListResultBean boardListPage 
	=BoardService.getInstance().findBoardList(pageConfig);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Խ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<!-- 
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
 -->

<script type="text/javascript">
	function boardCreate() {
		location.href = "board_write.jsp";
	}
	function returnMain() {
		location.href="../main.jsp";
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- <head> -->
			<%@include file="../include_head.jsp"%>

			<!-- ��� �޴� �� -->
			<%@include file="../include_common_header_other.jsp"%>
		</div>
		<!-- header end -->
		
		<div class="row"><!-- row start -->
		
			<!-- navigation start-->
			<div class="col-md-2"></div>
			<div class="col-md-2" id="navigation">
				<!-- include_common_left.jsp start-->
				<%@include file="../include_common_Board.jsp" %>
				<!-- include_common_left.jsp end-->
			</div>
			<!-- navigation end-->
			<!-- wrapper start -->
			<div class="col-md-6" id="wrapper">
				<!-- content start -->
				<!-- include_content.jsp start-->
	
				<div id="content">
					
			
					<form name="f" method="post" action=""></form>
					<div bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>�����Խ��� - �������� ������ �Ƴ����� �ۺξ� ���ƿ�~</b></div>
					<div height="20" class="t1" align="right" valign="bottom">��
								�� <font color="#FF0000"><%=boardListPage.getTotalRecordCount()%></font>
								�� | ����������( <font color="#FF0000"><%=boardListPage.getSelectPageNo()%></font>
								/ <font color="#0000FF"><%=boardListPage.getTotalPageCount()%></font>
								)
							</div>
						<table class="table">
							<tr>
								<td width=280 align=center bgcolor="E6ECDE">����</td>
								<td width=120 align=center bgcolor="E6ECDE">�۾���</td>
								<td width=120 align=center bgcolor="E6ECDE">�۾���</td>
								<td width=70 align=center bgcolor="E6ECDE">��Ƚ��</td>
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
								<td width=70 align=center bgcolor="ffffff" align="left"><%=board.getReadCount()%>
								</td>
							</tr>
							<!-- 
							<tr>
								<td width=280 bgcolor="ffffff" style="padding-left: 10"><a
									href='board_view.jsp?boardno=532&pageno=6'>�Խ���Ÿ��Ʋ514</a></td>
								<td width=120 align=center bgcolor="ffffff">���ȣ514</td>
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
					 <br>
				
							<div align="center">
								<%if (boardListPage.isShowFirst()) {%> 
									<a href="./board_list.jsp?pageno=1">����</a>&nbsp; 
								<%}%> 
								<%if (boardListPage.isShowPreviousGroup()) {%>
									<a href="./board_list.jsp?pageno=<%=boardListPage.getPreviousGroupStartPageNo()%>">��</a>&nbsp;&nbsp;
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
									href="./board_list.jsp?pageno=<%=boardListPage.getNextGroupStartPageNo()%>">��&nbsp;</a>
									<%
										}
									%> <%
										if (boardListPage.isShowLast()) {
										%> <a
									href="./board_list.jsp?pageno=<%=boardListPage.getTotalPageCount()%>">����</a>&nbsp;
									<%
										}
									%>
							</div> <!-- button -->
					<table border="0" cellpadding="0" cellspacing="1" width="590">
						<tr>
							<td align="right">
							<input type="button" value="��������" onclick="returnMain();" />&nbsp; 
							<input type="button" value="�۾���" onclick="boardCreate();" /></td>
						</tr>
					</table>
		
			
					
				</div>
				<!-- include_content.jsp end-->
				<!-- content end -->
			</div>
			<div class="col-md-2"></div>
			<!--wrapper end-->
		
		</div><!-- row end -->
		
		
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="../include_common_footer.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>