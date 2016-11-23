<%@page import="com.itwill.user.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String MSG1 = (String)request.getAttribute("MSG1");
String MSG2 = (String)request.getAttribute("MSG2");
String MSG3 = (String)request.getAttribute("MSG3");

if(MSG1 == null) {
	MSG1 = "";
}
if(MSG2 == null) {
	MSG2 = "";
}
if(MSG3 == null) {
	MSG3 = "";
}
%>
     
    
    
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

function findId() {
	f.action = "user_findId_form.jsp";
	f.submit();
}

function findPass() {
	f.action = "user_findPass_form.jsp";
	f.submit();
}

</script>
<body>
<%@include file="../include_head.jsp" %>


<!-- 상단 메뉴 바 -->
<%@include file="../include_common_header_other.jsp" %>


<div class="container" >
<div class="page-header">
		<h1>
			로그인<small> login</small>
		</h1>
	</div>
<form name = "f" method="post">
	<div class="form-group">
		<label>아이디</label>
		<input class="form-control" type="text" name ="id" style="width:300px;">&nbsp;&nbsp;<font color="red"><%=MSG1 %></font></br>
	</div>
	<div class="form-group">
		<label>패스워드</label>	
		<input class="form-control" type="password" name = "pass" style="width:300px;">&nbsp;&nbsp;<font color="red"><%=MSG2 %></font></br>
	</div>


		<input  class="btn btn-default" type="button" value="로그인" onclick="login()">
		<input  class="btn btn-default" type="button" value="회원가입" onclick="join()">
		<input  class="btn btn-default" type="button" value="아이디 찾기" onclick="findId()">
		<input  class="btn btn-default" type="button" value="패스워드 찾기" onclick="findPass()">
                
</form>

<%@include file="../include_common_footer.jsp" %>

</div>

</body>
</html>