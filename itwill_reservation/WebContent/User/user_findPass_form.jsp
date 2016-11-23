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
function findPass() {
	f.action = "user_findPass_action.jsp";
	f.submit();
}

function findCheck() {
	if(f.id.value == "") {
		alert('아이디를 입력해주세요');
		f.id.focus();
		return false;
	}
	if(f.birth.value == "") {
		alert('생년월일을 입력해주세요'); 
		f.birth.focus();
		return false;
	}
	if(f.phone.value == "") {
		alert('전화번호를 입력해주세요'); 
		f.phone.focus();
		return false;
	}
	f.action = "user_findPass_action.jsp";
	f.method = "post";
	f.submit();
}
</script>

</head>
<body>
<form name="f" method="post">
아이디:<input type="text" name="id"></br>
생년월일:<input type="text" name="birth"></br>
전화번호:<input type="text" name="phone"></br>
<input type="button" value="비밀번호 찾기" onclick="findPass()">
</form>
<%@include file="../include_common_footer.jsp" %>
</body>
</html>