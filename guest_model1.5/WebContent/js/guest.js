
function guestCreateForm() {
	document.f.action = 'guest_write_form.do';
	document.f.submit();
}
function guestModifyAction() {
	document.f.action = "guest_modify_action.do";
	document.f.method='POST';
	document.f.submit();
}

function guestList() {
	/*
	document.f.action = "guest_list.do";
	f.method="POST";
	document.f.submit();
	 */
	location.href="guest_list.do";
}

function guestModify() {
	document.f.action = "guest_modify_form.do";
	document.f.method='POST';
	document.f.submit();
}
function guestRemove() {
	if (window.confirm("���� �����Ͻðڽ��ϱ�?")) {
		document.f.action = "guest_remove_action.do";
		document.f.method='POST';
		document.f.submit();
	}
}
function guestCreate() {
	if (document.f.guest_name.value == "") {
		alert("�̸��� �Է��Ͻʽÿ�.");
		f.guest_name.focus();
		return false;
	}
	if (f.guest_email.value == "") {
		alert("�̸����� �Է��Ͻʽÿ�.");
		f.guest_email.focus();
		return false;
	}
	if (f.guest_homepage.value == "") {
		alert("Ȩ�������� �Է��Ͻʽÿ�.");
		f.guest_homepage.focus();
		return false;
	}

	if (f.guest_title.value == "") {
		alert("������ �Է��Ͻʽÿ�.");
		f.guest_title.focus();
		return false;
	}
	if (f.guest_content.value == "") {
		alert("������ �Է��Ͻʽÿ�.");
		f.guest_content.focus();
		return false;
	}

	f.action = "guest_write_action.do";
	f.method='POST';
	f.submit();
}










