<%@page import="com.itwill.user.Member"%>
<%@page language = "java" pageEncoding="EUC-KR" contentType="text/html; charset=EUC-KR" %>

<!-- <head> -->
<%@include file="../include_head.jsp" %>


<!-- ��� �޴� �� -->
<%@include file="../include_common_header_other.jsp" %>

<!-- ������ ���� -->
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
		alert('���̵� �Է����ּ���');
		f.m_id.focus();
		return false;
	}
	
	if(document.f.m_id.value.length < 3 || document.f.m_id.value.length > 9) {
		alert('���̵�� 3~9���� ���̷� �Է����ּ���');
		f.m_id.focus();
		return false;
	}
	
	var idStr = document.f.m_id.value;
	
	if((idStr.charAt(0) >= '0') && (idStr.charAt(0) <= '9')) {
		alert('���̵�� ���ڷ� ������ �� �����ϴ�. �ٽ� �Է����ּ���');
		f.m_id.focus();
		return false;
	}
	for (var i = 0; i < idStr.length; i++) {
		var tempId = idStr.charAt(i);
		if((tempId >= 'a' && tempId <= 'z') || (tempId >= 'A' && tempId <= 'Z') || (tempId >= '0' && tempId <= '9')){
			
		} else {
			alert('���̵�� ���� ��ҹ���, ���ڷθ� �Է����ּ���');
			document.f.m_id.focus();
			return false;
		}
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
	
	if(document.f.m_birth.value == "") {
		alert('��������� �Է����ּ���');
		f.m_birth.focus();
		return false;
	}
	
	if(document.f.m_birth.value.length < 7 || document.f.m_birth.value.length > 9) {
		alert('��������� 8���� ���ڷ� �Է����ּ���');
		f.m_birth.focus();
		return false;
	}
	/*
	if(phone != 46 && phone > 31(phone < 48 || phone > 57)) {
		alert('��ȭ��ȣ���� ���ڸ� �Է����ּ���');
	    return false;
	}
	*/
	/*
	if(document.f.m_class.value == "") {
		alert('���� �Է����ּ���');
		f.m_class.focus();
		return false;
	}
	*/
	/*
	for( var i=0; i=phone.length; i++ ) {
		if(phone.charAt(i) >= '0' && phone.charAt(i) <= '9') {
			
		} else {
			alert('����ó�� ���ڷ� ��Ź�帳�ϴ�');
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
			ȸ������<small> join</small>
		</h1>
	</div>
	
	<form name="f"    method="post">
	<ul>
		<li>���̵�� 3~9���� ������ ���� ��ҹ���, ���ڷθ� �Է����ּ���</li><br/>
		<li>���̵�� ���ڷ� ������ �� �����ϴ�.</li><br/>
		<li>��������� 8���� ���ڷ� �Է����ּ���.	��)19901225</li><br/><br/>
	</ul>
	<div class="form-group">
		<lable>���̵�</lable>
		<input class="form-control" style="width:300px" type="text" name ="m_id" value = "<%=fMember.getM_id() %>"/>&nbsp;&nbsp;<font color="red"><%=MSG %></font><br/>
	</div>
	
	<div class="form-group">
	��й�ȣ:
	<input type="password" class="form-control" style="width:300px" name="m_pass" value="<%=fMember.getM_password() %>" /><br/>
	</div>
	
	<div class="form-group">
	��й�ȣ Ȯ��:<input type="password" class="form-control" style="width:300px" name="m_passcheck" value=""/><br/>
	</div>
	
	<div class="form-group">
	�̸�:<input type="text" class="form-control" style="width:300px" name="m_name" value="<%=fMember.getM_name() %>"/><br/>
	</div>
	
	<div class="form-group">
	����ó:<input type="text" class="form-control" style="width:300px" name="m_phone" value="<%=fMember.getM_phone() %>"/><br/>
	</div>
	
	<div class="form-group">
	�̸���:<input type="text" class="form-control" style="width:300px" name="m_email" value="<%=fMember.getM_email() %>"/><br/>
	</div>
	
	<div class="form-group">
	�������:<input type="text" class="form-control" style="width:300px" name="m_birth" value="<%=fMember.getM_birth() %>"/><br/>
	</div>
	
	<div class="form-group">
	�ּ�:<input type="text" class="form-control" style="width:300px" name="m_address" value="<%=fMember.getM_address() %>"/><br/>
	</div>
	
	<div class="form-group">
	��:<select name="m_class" class="form-control" style="width:300px" >
    	<option value="1��">1��</option>
    	<option value="2��">2��</option>
    	<option value="3��">3��</option>
    	<option value="4��">4��</option>
    	<option value="5��">5��</option>
    	</select>
	</div>


	<br/> 
	
	<button type="button" class="btn" onclick="userCreate()">ȸ������</button>
	
	<!--  
	<button type="submit" onclick="userList()">ȸ�����</button>-->
	
	
	</form>

</div>
<!-- �ϴ� -->
<%@include file="../include_common_footer.jsp" %>

</body>
</html>

