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
		alert('���̵� �Է����ּ���');
		f.id.focus();
		return false;
	}
	if(f.pass.value == "") {
		alert('��й�ȣ�� �Է����ּ���'); 
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
���̵�:<input type="text" name ="id"> </br>
�н�����:<input type="text" name = "pass"></br>


<input type="button" value="�α���" onclick="login()">
<input type="button" value="ȸ������" onclick="join()">




</form>


</body>
</html>