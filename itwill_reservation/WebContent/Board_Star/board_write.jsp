<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�Խ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">

<% 

    String sId =  (String)session.getAttribute("sUserId"); 
  //Member sMember = (Member)session.getAttribute("sUser");
  Member sMember = MemberDaoService.getInstance().findMember(sId);
%>



<script type="text/javascript">
	function boardCreate() {
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

		f.action = "board_write_action.jsp";
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
			<!-- include_common_top.jsp start-->
			<%@include file="../include_head.jsp" %>
			<%@include file="../include_common_header_other.jsp" %>
			
			
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
				<table border=0 cellpadding=0 cellspacing=0 align="center">
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0 align="center"
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>�����Խ��� -
											������� ��������������~</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="title"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">�ۼ���</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" readonly="readonly"  value="<%=sMember.getM_id() %>"width: 150px"
											name="writer"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">����</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><select 
											name="board_star">
											<option value="����">����</option>
											<option value="�Ҹ���">�Ҹ���</option>
											</select>
											</td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">����</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="content" class="textarea"
												style="width: 350px" rows="14"></textarea></td>
									</tr>
								</table>
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="�Խ��� ����"
										onClick="boardCreate()"> &nbsp; <input type="button"
										value="�Խ��� ���" onClick="boardList()"></td>
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
		   <%@include  file="../include_common_footer.jsp" %>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>