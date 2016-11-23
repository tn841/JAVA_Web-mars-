<%@page import="com.itwill.user.Member"%>
<%@page language = "java" pageEncoding="EUC-KR" contentType="text/html; charset=EUC-KR" %>

<!-- <head> -->
<%@include file="../include_head.jsp" %>


<!-- 상단 메뉴 바 -->
<%@include file="../include_common_header_other.jsp" %>

<!-- 컨텐츠 영역 -->
<%

Member fMember = (Member)request.getAttribute("fMember");
if(fMember==null) {
	fMember = new Member(-99,"","","","","","","","",0);

}





String MSG = (String)request.getAttribute("MSG");
if(MSG == null) {
	MSG = "";
}
%>
<script type="text/javascript">
function userCreate() {
	
	var phone = document.f.m_phone.value;
	
	if(document.f.m_id.value == "") {
		alert('아이디를 입력해주세요');
		f.m_id.focus();
		return false;
	}
	
	if(document.f.m_id.value.length < 3 || document.f.m_id.value.length > 9) {
		alert('아이디는 3~9글자 사이로 입력해주세요');
		f.m_id.focus();
		return false;
	}
	
	var idStr = document.f.m_id.value;
	
	if((idStr.charAt(0) >= '0') && (idStr.charAt(0) <= '9')) {
		alert('아이디는 숫자로 시작할 수 없습니다. 다시 입력해주세요');
		f.m_id.focus();
		return false;
	}
	for (var i = 0; i < idStr.length; i++) {
		var tempId = idStr.charAt(i);
		if((tempId >= 'a' && tempId <= 'z') || (tempId >= 'A' && tempId <= 'Z') || (tempId >= '0' && tempId <= '9')){
			
		} else {
			alert('아이디는 영문 대소문자, 숫자로만 입력해주세요');
			document.f.m_id.focus();
			return false;
		}
	}
	
	
	if(document.f.m_pass.value == "") {
		alert('비밀번호를 입력해주세요');
		f.m_pass.focus();
		return false;
	}
	
	if(document.f.m_passcheck.value == "") {
		alert('비밀번호확인을 입력해주세요');
		f.m_passcheck.focus();
		return false;
	}
	if(f.m_pass.value != f.m_passcheck.value) {
		alert('비밀번호와 비밀번호 확인이 일치하지 않습니다');
		return false;
	}
	
	if(document.f.m_name.value == "") {
		alert('이름을 입력해주세요');
		f.m_name.focus();
		return false;
	}
	
	if(document.f.m_phone.value == "") {
		alert('전화번호를 입력해주세요');
		f.m_phone.focus();
		return false;
	}
	
	if(document.f.m_birth.value == "") {
		alert('생년월일을 입력해주세요');
		f.m_birth.focus();
		return false;
	}
	
	if(document.f.m_birth.value.length < 7 || document.f.m_birth.value.length > 9) {
		alert('생년월일은 8개의 숫자로 입력해주세요');
		f.m_birth.focus();
		return false;
	}
	/*
	if(phone != 46 && phone > 31(phone < 48 || phone > 57)) {
		alert('전화번호에는 숫자를 입력해주세요');
	    return false;
	}
	*/
	/*
	if(document.f.m_class.value == "") {
		alert('반을 입력해주세요');
		f.m_class.focus();
		return false;
	}
	*/
	/*
	for( var i=0; i=phone.length; i++ ) {
		if(phone.charAt(i) >= '0' && phone.charAt(i) <= '9') {
			
		} else {
			alert('연락처는 숫자로 부탁드립니다');
			return false;
		}
	}
	*/
	
	f.action = "user_write_action.jsp";
	f.method = 'post';
	f.submit();
}

function userList() {
	f.action = "user_list.jsp";
}

</script>

</head>
<body>

<div class="container">
	<div class="page-header">
		<h1>
			회원가입<small> join</small>
		</h1>
	</div>
	
	<form name="f"    method="post">
	<ul>
		<li>아이디는 3~9글자 사이의 영문 대소문자, 숫자로만 입력해주세요</li><br/>
		<li>아이디는 숫자로 시작할 수 없습니다.</li><br/>
		<li>생년월일은 8개의 숫자로 입력해주세요.	예)19901225</li><br/><br/>
	</ul>
	<div class="form-group">
		<lable>아이디</lable>
		<input class="form-control" style="width:300px" type="text" name ="m_id" value = "<%=fMember.getM_id() %>"/>&nbsp;&nbsp;<font color="red"><%=MSG %></font><br/>
	</div>
	
	<div class="form-group">
	비밀번호:
	<input type="password" class="form-control" style="width:300px" name="m_pass" value="<%=fMember.getM_password() %>" /><br/>
	</div>
	
	<div class="form-group">
	비밀번호 확인:<input type="password" class="form-control" style="width:300px" name="m_passcheck" value=""/><br/>
	</div>
	
	<div class="form-group">
	이름:<input type="text" class="form-control" style="width:300px" name="m_name" value="<%=fMember.getM_name() %>"/><br/>
	</div>
	
	<div class="form-group">
	연락처:<input type="text" class="form-control" style="width:300px" name="m_phone" value="<%=fMember.getM_phone() %>"/><br/>
	</div>
	
	<div class="form-group">
	이메일:<input type="text" class="form-control" style="width:300px" name="m_email" value="<%=fMember.getM_email() %>"/><br/>
	</div>
	
	<div class="form-group">
	생년월일:<input type="text" class="form-control" style="width:300px" name="m_birth" value="<%=fMember.getM_birth() %>"/><br/>
	</div>
	
	<div class="form-group">
	주소:<input type="text" class="form-control" style="width:300px" name="m_address" value="<%=fMember.getM_address() %>"/><br/>
	</div>
	
	<div class="form-group">
	반:<select name="m_class" class="form-control" style="width:300px" >
    	<option value="1반">1반</option>
    	<option value="2반">2반</option>
    	<option value="3반">3반</option>
    	<option value="4반">4반</option>
    	<option value="5반">5반</option>
    	</select>
	</div>


	<br/> 
	
	<button type="button" class="btn" onclick="userCreate()">회원가입</button>
	
	<!--  
	<button type="submit" onclick="userList()">회원목록</button>-->
	
	
	</form>

</div>
<!-- 하단 -->
<%@include file="../include_common_footer.jsp" %>

</body>
</html>

