<%@page language = "java" pageEncoding="EUC-KR" contentType="text/html; charset=EUC-KR" %>

<!-- <head> -->
<%@include file="include_head.jsp" %>


<!-- 상단 메뉴 바 -->
<%@include file="include_common_header.jsp" %>

<!-- 컨텐츠 영역 -->


<script type="text/javascript">
function userCreate() {
	if(document.f.m_id.value == "") {
		alert('아이디를 입력해주세요');
		f.m_id.focus();
		return false;
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
	
	if(document.f.m_class.value == "") {
		alert('반을 입력해주세요');
		f.m_class.focus();
		return false;
	}
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
	<form name="f"    method="post">
	아이디:<input type="text" name ="m_id" value = ""/><br/>
	비밀번호:<input type="password" name="m_pass" value="" /><br/>
	비밀번호 확인:<input type="password" name="m_passcheck" value=""/><br/>
	이름:<input type="text" name="m_name" value=""/><br/>
	연락처:<input type="text" name="m_phone" value=""/><br/>
	이메일:<input type="text" name="m_email" value=""/><br/>
	생년월일:<input type="text" name="m_birth" value=""/><br/>
	주소:<input type="text" name="m_address" value=""/><br/>
	반:<input type="text" name="m_class" value=""/><br/> 
	
	<button type="submit" onclick="userCreate()">회원가입</button>
	<button type="submit" onclick="userList()">회원목록</button>
	
	
	</form>

</div>
<!-- 하단 -->
<%@include file="include_common_footer.jsp" %>

</body>
</html>
