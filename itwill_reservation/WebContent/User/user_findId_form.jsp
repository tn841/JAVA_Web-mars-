<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file ="../include_head.jsp" %>

<%@include file ="../include_common_header_other.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
function findId() {
	f.action = "user_findId_action.jsp"
	f.submit();
}

function findCheck() {
	
	if(f.birth.value == "") {
		alert('��������� �Է����ּ���'); 
		f.birth.focus();
		return false;
	}
	if(f.phone.value == "") {
		alert('��ȭ��ȣ�� �Է����ּ���'); 
		f.phone.focus();
		return false;
	}
	f.action = "user_findId_action.jsp";
	f.method = "post";
	f.submit();
}
</script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h1>
			���̵� ã��<small> find</small>
		</h1>
	</div>
	<form name="f" method="post">
	<div class="form-group">
	�������:<input type="text" class="form-control" style="width:300px" name="birth"></br>
	</div>
	
	<div class="form-group">
	��ȭ��ȣ:<input type="text" class="form-control" style="width:300px" name="phone"></br>
	</div>
	
	<input type="button" class="btn" value="���̵�ã��" onclick="findId()">
	</form>
</div>
<%@include file="../include_common_footer.jsp" %>
</body>
</html>