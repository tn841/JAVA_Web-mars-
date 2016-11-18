<%@page import="com.itwill.user.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
     
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function login() {
	if(f.id.value == "") {
		alert('아이디를 입력해주세요');
		f.id.focus();
		return false;
	}
	if(f.pass.value == "") {
		alert('비밀번호를 입력해주세요'); 
		f.pass.focus();
		return false;
	}
	f.action = "user_login_action.jsp";
	f.method = "post";
	f.submit();
}

function join() {
	f.action = "user_write_form.jsp";
	f.submit();
}

</script>
<body>



<form name = "f" method="post">
아이디:<input type="text" name ="id"> </br>
패스워드:<input type="text" name = "pass"></br>


<input type="button" value="로그인" onclick="login()">
<input type="button" value="회원가입" onclick="join()">




</form>


</body>
</html>