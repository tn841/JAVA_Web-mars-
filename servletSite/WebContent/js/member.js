/**
 * 회원가입시 필요한 js 파일
 */	
function join_form_submit(){
		if(is_null(document.join.id.value)){
			alert("아이디를 입력하세요.");
			document.join.id.focus();
			return false;
		}
		if(is_null(document.join.pass.value)){
			alert('패쓰워드를 입력하세요!!');
			document.join.pass.focus();
			return false;
			
		}
		if(is_null(document.join.repass.value)){
			alert('패쓰워드확인를 입력하세요!!');
			document.join.repass.focus();
			return false;
			
		}
		
		//패쓰워드와 패쓰워드확인 일치여부
		
		if(!is_same(document.join.pass.value, document.join.repass.value)){
			alert("패쓰워드와 패쓰워드확인은 일치하여야합니다.");
			document.join.pass.select();
			return false;
		}
		if(is_null(document.join.name.value)){
			alert('이름을 입력하세요!!');
			document.join.name.focus();
			return false;
			
		}
		if(is_null(document.join.addr.value)){
			alert('주소를 입력하세요!!');
			document.join.addr.focus();
			return false;
			
		}
		
		
		
//		아이디는 3~7글자사이여야합니다
//		아이디는 영문대소문자숫자이외는 사용불가능합니다.
//		아이디는 숫자로 시작할수없습니다.
//		직업선택여부 체크
		
		
		return true;
	}