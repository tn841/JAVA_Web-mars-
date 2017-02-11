$(document).on("mobileinit", function () {
	
	alert('mobileinit event--> jQuery Mobile 이 초기화될때 발생하는이벤트( 전역설정작업 )');
	
    $.extend($.mobile, {
        metaViewportContent: 
        	'width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=yes'   
             
    });
    
    $.mobile.ajaxEnabled=true;
    $.mobile.pageLoadErrorMessage="페이지 로드 애로발생!!!";
    $.mobile.pageLoadErrorMessageTheme='b';
    $.mobile.popup.prototype.options.overlayTheme='b';
    $.mobile.page.prototype.options.domCache=true;
    $.mobile.defaultPageTransition='popup';
   
});
