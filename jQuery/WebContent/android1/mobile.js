$(function(){
	//메뉴숨기기
	$('#header ul').addClass('hide');
	
	//버튼 추가
	$('#header')
		.append("<div class='leftButton'>Menu</div>")
		.on('click', function(e){
			console.log(e.target);
			menuToggle();
			//$('#header ul').slideToggle();
		});
	
	//이벤트 핸들러 추가
	
});

function menuToggle(){
	$('#header .leftButton').toggleClass('pressed');
	
	if($('#header ul').hasClass('hide')){
		$('#header ul').slideDown(500);		
		$('#header ul').removeClass('hide');
	}else{
		$('#header ul').slideUp(500, function(){
			$('#header ul').addClass('hide');
		});
	}
}