<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@include file="../include_head.jsp" %>
<%@include file="../include_common_header_other.jsp" %>

<%

	Integer boardno=null;
	int pageno=1;
	try{
		boardno=Integer.parseInt(request.getParameter("boardno"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	if(boardno==null){
		//��������̵�
		response.sendRedirect("board_list.jsp?pageno="+pageno);
		return;
	}
	Board board=BoardService.getInstance().findBoard_star(boardno);
	if(board==null){
		response.sendRedirect("board_list.jsp?pageno="+pageno);
		return;
	}
	//����ȸ������
	BoardService.getInstance().updateHitCount_star(boardno);
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Խ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script language="JavaScript">
	function boardCreate() {
		f.action = "../Board_Star/board_write.jsp";
		f.submit();
	}
	function boardReplyCreate() {
		document.f.action = "../Board_Star/board_reply_write.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	function boardUpdate() {
		f.action = "../Board_Star/board_modify.jsp";
		f.submit();
	}
	function boardRemove() {
		if (confirm("���� ������?")) {
			f.action = "../Board_Star/board_remove_action.jsp";
			f.submit();
		}
	}
	function boardList() {
		f.action = "../Board_Star/board_list.jsp?pageno="+<%=pageno%>;
		f.submit();
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
			
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> �Խù�
											���뺸�� </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->
							<!-- 
							<form name="f" method="post">
					<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>">
					<input type="hidden" name="pageno" value="<%=pageno%>">
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">�۾���</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getWriter()%></td>
						</tr>

						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getTitle()%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10"><%=board.getContent()%></td>
						</tr>
						
					</table>
					
				</form>
							 -->
							<form name="f" method="post">
								<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>">
								<input type="hidden" name="pageno" value="<%=pageno%>">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">�۾���</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getWriter()%></td>
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><%=board.getTitle()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
										<td width=490 bgcolor="ffffff" height="180px"
											style="padding-left: 10px" align="left"><%=board.getContent().replace("\n","<br/>")%><br />

										</td>
									</tr>

								</table>

							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									<input type="button" value="�۾���"	  onClick="boardCreate()"> &nbsp; 
									<input type="button" value="���" onClick="boardReplyCreate()"> &nbsp; 
									<input type="button" value="����" onClick="boardUpdate()">&nbsp; 
									<input type="button" value="����" onClick="boardRemove()">&nbsp; 
									<input type="button" value="�۸��" onClick="boardList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<%@include file="../include_common_footer.jsp" %>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>