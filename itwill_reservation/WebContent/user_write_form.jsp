<%@page language = "java" pageEncoding="EUC-KR" contentType="text/html; charset=EUC-KR" %>

<!-- <head> -->
<%@include file="include_head.jsp" %>


<!-- ��� �޴� �� -->
<%@include file="include_common_header.jsp" %>

<!-- ������ ���� -->


<script type="text/javascript">
function userCreate() {
	if(document.f.m_id.value == "") {
		alert('���̵� �Է����ּ���');
		f.m_id.focus();
		return false;
	}
	
	if(document.f.m_pass.value == "") {
		alert('��й�ȣ�� �Է����ּ���');
		f.m_pass.focus();
		return false;
	}
	
	if(document.f.m_passcheck.value == "") {
		alert('��й�ȣȮ���� �Է����ּ���');
		f.m_passcheck.focus();
		return false;
	}
	if(f.m_pass.value != f.m_passcheck.value) {
		alert('��й�ȣ�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�');
		return false;
	}
	
	if(document.f.m_name.value == "") {
		alert('�̸��� �Է����ּ���');
		f.m_name.focus();
		return false;
	}
	
	if(document.f.m_phone.value == "") {
		alert('��ȭ��ȣ�� �Է����ּ���');
		f.m_phone.focus();
		return false;
	}
	
	if(document.f.m_class.value == "") {
		alert('���� �Է����ּ���');
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
	���̵�:<input type="text" name ="m_id" value = ""/><br/>
	��й�ȣ:<input type="password" name="m_pass" value="" /><br/>
	��й�ȣ Ȯ��:<input type="password" name="m_passcheck" value=""/><br/>
	�̸�:<input type="text" name="m_name" value=""/><br/>
	����ó:<input type="text" name="m_phone" value=""/><br/>
	�̸���:<input type="text" name="m_email" value=""/><br/>
	�������:<input type="text" name="m_birth" value=""/><br/>
	�ּ�:<input type="text" name="m_address" value=""/><br/>
	��:<input type="text" name="m_class" value=""/><br/> 
	
	<button type="submit" onclick="userCreate()">ȸ������</button>
	<button type="submit" onclick="userList()">ȸ�����</button>
	
	
	</form>

</div>
<!-- �ϴ� -->
<%@include file="include_common_footer.jsp" %>

</body>
</html>
