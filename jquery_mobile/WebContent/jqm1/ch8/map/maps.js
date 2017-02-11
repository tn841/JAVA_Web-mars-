/**
 * 
 */
$(document).on('pagecreate','#map-page',function(){
	alert('pagecreate!!!');
	/*
	  1.google map document
	   https://developers.google.com/maps/documentation/javascript/
	  2.geolocation document
	   https://developer.mozilla.org/ko/docs/Web/API/Geolocation
	 */
	if(navigator.geolocation){
		alert(navigator.geolocation);
		navigator.geolocation
			.getCurrentPosition(
					function(position){
						alert(position.coords.latitude+","+position.coords.longitude);
						
						var latlng =
							new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
						var options={
							zoom:17,
							center:latlng,
							mapTypeId:google.maps.MapTypeId.ROADMAP
						};
						var map_canvasE = document.getElementById("map-canvas");
						var map = new google.maps.Map(map_canvasE,options);
						var marker = new google.maps.Marker({
							position:latlng,
							map:map,
							title:'현재위치['+position.coords.latitude+','+position.coords.longitude+']'
						});
						
					}, 
					function(){
						alert('error: no current position!!!');
					},
					{
						enableHighAccuray:true,
						maximumAge:0
					});
		
	}
	
});