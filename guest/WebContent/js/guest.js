/**
 * 
 */

function guestCreateForm() {
	document.f.action = 'guest_write.jsp';
	document.f.submit();
}
function guestModifyAction() {
	f.action = "guest_modify_action.jsp";
	f.submit();
}

function guestList() {
	f.action = "guest_list.jsp";
	f.submit();
}


function guestModify(no) {
	f.action = "guest_modify.jsp?guest_no="+no;
	f.submit();
}
function guestRemove() {
	if (window.confirm("정말 삭제하시겠습니까?")) {
		f.action = "guest_remove_action.jsp";
		f.submit();
	}
}
function guestCreate() {
	if (f.guest_name.value == "") {
		alert("이름을 입력하십시요.");
		f.guest_name.focus();
		return false;
	}
	if (f.guest_email.value == "") {
		alert("이메일을 입력하십시요.");
		f.guest_email.focus();
		return false;
	}
	if (f.guest_homepage.value == "") {
		alert("홈페이지를 입력하십시요.");
		f.guest_homepage.focus();
		return false;
	}

	if (f.guest_title.value == "") {
		alert("제목을 입력하십시요.");
		f.guest_title.focus();
		return false;
	}
	if (f.guest_content.value == "") {
		alert("내용을 입력하십시요.");
		f.guest_content.focus();
		return false;
	}

	f.action = "guest_write_action.jsp";
	f.submit();
}
