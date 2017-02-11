
$(function(){
	// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			name: "required",
			password: { required: true, minlength: 8 },
			confirm_password: { required: true, minlength: 8, equalTo: "#password"},
			email: { required: true, email: true},
			topic: { required: "#newsletter:checked", minlength: 2 },
			agree: "required"
		},
		messages: {
			name: "�̸��� �Է��� �ּ���",
			password: {
				required: "��ȣ�� �Է��� �ּ���",
				minlength: "��ȣ�� 8�� �̻��̾�� �մϴ�."
			},
			confirm_password: {
				required: "��ȣ�� �� �� �� �Է��� �ּ���",
				minlength: "��ȣ�� 8�� �̻��̾�� �մϴ�.",
				equalTo: "��ȣ�� ��ġ���� �ʽ��ϴ�."
			},
			email: "��Ŀ� �´� �̸����� �Է��� �ּ���.",
			agree: "��å ���ǿ� üũ�� �ּ���"
		}
	});
});
