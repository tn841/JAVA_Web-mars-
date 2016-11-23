<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	Integer boardno = null;
	try {
		boardno = Integer.valueOf(request.getParameter("boardno"));
	} catch (Exception ex) {
	}
	//�۹�ȣ�� ���ٸ�
	if (boardno == null) {
		//������� �̵�
		response.sendRedirect("board_list.jsp");
		return;
	}
	Board board = BoardService.getInstance().findBoard(boardno);
	if (board == null) {
		response.sendRedirect("board_list.jsp");
		return;
	}
	String pageno = "1";
	if (request.getParameter("pageno") != null) {
		pageno = request.getParameter("pageno");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Խ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function boardUpdate() {
		if (f.title.value == "") {
			alert("������ �Է��Ͻʽÿ�.");
			f.title.focus();
			return false;
		}
		if (f.writer.value == "") {
			alert("�ۼ��ڸ� �Է��Ͻʽÿ�.");
			f.writer.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("������ �Է��Ͻʽÿ�.");
			f.content.focus();
			return false;
		}

		f.action = "board_modify_action.jsp";
		f.submit();
	}

	function boardList() {
		f.action = "board_list.jsp";
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
			<!-- <head> -->
			<%@include file="../include_head.jsp"%>

			<!-- ��� �޴� �� -->
			<%@include file="../include_common_header_other.jsp"%>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>�Խ��� -
											�Խ��� ����</b>
									</td>
								</tr>
							</table> <br> <!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" /> <input
									type="hidden" name="boardno" value="<%=board.getBoardNo()%>" />
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150"
											name="title" value="<%=board.getTitle()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">�ۼ���</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150"
											name="writer" value="<%=board.getWriter()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="content"
												style="width: 350px" rows="14"><%=board.getContent()%></textarea></td>
									</tr>


								</table>
							</form> <!-- 
							<form name="f" method="post">
				
		        	
					<table border="0" cellpadding="0" cellspacing="1" width="590"
						bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10">
							<input
								value="[RE]<%=board.getTitle()%>" 
								type="text" style="width: 150" name="title"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">�ۼ���</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10">
							<input
								value=""
								type="text" style="width: 150" name="writer"></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10">
							<textarea
									name="content" style="width:480" rows="15"></textarea>
							</td>
						</tr>
						
						
					</table>
				</form> 
							 --> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="����"
										onClick="boardUpdate()"> &nbsp; <input type="button"
										value="����Ʈ" onClick="boardList()"></td>
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
			<jsp:include page="../include_common_footer.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>