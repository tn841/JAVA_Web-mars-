/**
 * 
 */

// 1. reviews.html #reviewsPage -> twitter.html #twitterPage
$(document).on('pagecreate', '#reviewsPage', function(){
	// page 생성 시 해당 페이지의 이벤트 처리, 서버 데이터 요청(ajax), UI향상
	
	// 버튼 이벤트 처리
	$('#twitterBtn').click(function(e){
		// 1. loading icon show
		$.mobile.loading('show');
		
		// 2. 페이지 load -> change
		$.mobile.pageContainer.pagecontainer('load', 'twitter.html');
		
		alert('reviewsPage create!');
		e.preventDefault();
	});
});


$(document).on('pagebeforecreate', '#twitterPage', function(){
	//alert('twitterPage beforecreate!');
	
	$.mobile.loading('show');
	
	//1.ajax요청
	var lat="37.499597";
	var lng="127.031372";
	var dataUrl=null;
	
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(
				function(pos){
					lat = pos.coords.latitude;
					lng = pos.coords.longitude;
				}, 
				function(){
					lat="37.499597";
					lng="127.031372";
					alert('위치를사용할수없습니다.(디폴트위치를사용합니다)');
				}, 
				{
					enableHighAccuray:true,
					maximumAge:0
				});
	}else{
		lat="37.499597";
		lng="127.031372";
	}
	
	
	dataUrl="https://api.foursquare.com/v2/venues/explore?ll="
        +lat+","+lng+"&radius=250&limit=50&oauth_token=45HKGUJ5WESVY2X1GD0BNDOGWABCPCG2GUH5BWBR2NUXZG5L&v=20170101";

	
	$.ajax({
		async:true,
		url:dataUrl,
		dataType:'jsonp',
		jsonpCallback:'foursquareCallback',
		success:function(jsonObject){
			console.log(jsonObject);
			
			var items = jsonObject.response.groups[0].items;
			var html="";
			$.each(items,function(i,item){
				console.log(item.venue.name);
				var $htmlTemplate=$("<a href='#'>"
						+"<li>"
						+"<img class='ui-li-icon profile'/>"
						+"<h3 class='from'></h3>"
						+"<p class='tweet'></p>"
						+"</li>"
						+"</a>");
				$htmlTemplate.find('.profile').attr('src',item.venue.categories[0].icon.prefix+'bg_32.png');
				$htmlTemplate.find('.from').append(item.venue.name);
				try{
					$htmlTemplate.find('.tweet').append(item.tips[0].text);
				}catch(e){
					$htmlTemplate.find('.tweet').append('tip이 없습니다.');					
				}
				html+=$htmlTemplate.html();
			});
			$.mobile.pageContainer.pagecontainer('change','#twitterPage');
			$('#tweet-list').append(html);
			$('#tweet-list').enhanceWithin();
			// 향상시키는 다른 방법 : $('#tweet-list').listview('refresh', true);
			
			$.mobile.loading('hide');
		},
		fail:function(){
			alert('ajax request fail!!!');
			$.mobile.loading('hide');
		}
		
	});
	
});