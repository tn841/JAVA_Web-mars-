/**
 * 
 */
function checkForm(f) {
	alert('checkForm()');
	// ��üũ
	if (isNull(f.id.value)) {
		alert('���̵� �Է��ϼ���');
		f.id.focus();
		return false;
	}
	if (isNull(f.pass.value)) {
		alert('�о����带 �Է��ϼ���');
		f.pass.focus();
		return false;
	}
	if (isNull(f.repass.value)) {
		alert('�о�����Ȯ���� �Է��ϼ���');
		f.repass.focus();
		return false;
	}
	if (isNull(f.name.value)) {
		alert('�̸��� �Է��ϼ���');
		f.name.focus();
		return false;
	}
	if (isNull(f.addr.value)) {
		alert('�ּҸ� �Է��ϼ���');
		f.addr.focus();
		return false;
	}
	// �о�����,Ȯ����ġüũ
	if (!isSame(f.pass.value, f.repass.value)) {
		alert("�о������Ȯ���� ��ġ�ؾ��մϴ�");
		f.pass.select();
		return false;
	}

	// ���̵�
	// 1.5~8���ڻ���
	// 2.����,_,���� �θ�����
	// 3.���ڷν����ϸ�ȵǿ�
	
	
	// �������ÿ���üũ
	var selectedIndex = f.job.options.selectedIndex;
	if(selectedIndex == 0){
		alert("������ �����ϼ���.");
		return false;
	}
	
	// ��� ���� ���� üũ
	var hobbyArr = f.hobby
	var count = 0;
	for(i=0; i<hobbyArr.length; i++){
		if(hobbyArr[i].checked){
			count++;
		}
	}
	
	if(count<1){
		alert("���� ��̰� ������?");
	}
	
	
	if(!window.confirm("�����ϽǷ���?")){
		return false;
	}
	return true;
}

















