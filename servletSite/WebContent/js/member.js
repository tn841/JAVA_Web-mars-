/**
 * ȸ�����Խ� �ʿ��� js ����
 */	
function join_form_submit(){
		if(is_null(document.join.id.value)){
			alert("���̵� �Է��ϼ���.");
			document.join.id.focus();
			return false;
		}
		if(is_null(document.join.pass.value)){
			alert('�о����带 �Է��ϼ���!!');
			document.join.pass.focus();
			return false;
			
		}
		if(is_null(document.join.repass.value)){
			alert('�о�����Ȯ�θ� �Է��ϼ���!!');
			document.join.repass.focus();
			return false;
			
		}
		
		//�о������ �о�����Ȯ�� ��ġ����
		
		if(!is_same(document.join.pass.value, document.join.repass.value)){
			alert("�о������ �о�����Ȯ���� ��ġ�Ͽ����մϴ�.");
			document.join.pass.select();
			return false;
		}
		if(is_null(document.join.name.value)){
			alert('�̸��� �Է��ϼ���!!');
			document.join.name.focus();
			return false;
			
		}
		if(is_null(document.join.addr.value)){
			alert('�ּҸ� �Է��ϼ���!!');
			document.join.addr.focus();
			return false;
			
		}
		
		
		
//		���̵�� 3~7���ڻ��̿����մϴ�
//		���̵�� ������ҹ��ڼ����ܴ̿� ���Ұ����մϴ�.
//		���̵�� ���ڷ� �����Ҽ������ϴ�.
//		�������ÿ��� üũ
		
		
		return true;
	}