/**
 * 
 */

$(document).on('pagebeforecreate','#home',function(){
	alert("1.#home pagebeforecreate")
});
$(document).on('pagecreate','#home',function(){
	alert("2.#home pagecreate")
});
$(document).on('pagebeforeshow','#home',function(){
	alert("3.#home pagebeforeshow")
});
$(document).on('pageshow','#home',function(){
	alert("4.#home pageshow")
});
$(document).on('pagebeforehide','#home',function(){
	alert("5.#home pagebeforehide")
});
$(document).on('pagehide','#home',function(){
	alert("6.#home pagehide")
});

$(document).on('pagebeforecreate','#secondPage',function(){
	alert("1.#secondPage pagebeforecreate")
});
$(document).on('pagecreate','#secondPage',function(){
	alert("2.#secondPage pagecreate")
});
$(document).on('pagebeforeshow','#secondPage',function(){
	alert("3.#secondPage pagebeforeshow")
});
$(document).on('pageshow','#secondPage',function(){
	alert("4.#secondPage pageshow")
});
$(document).on('pagebeforehide','#secondPage',function(){
	alert("5.#secondPage pagebeforehide")
});
$(document).on('pagehide','#secondPage',function(){
	alert("6.#secondPage pagehide")
});

