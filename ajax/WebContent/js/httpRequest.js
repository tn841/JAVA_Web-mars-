var httpRequest = null;

function getXMLHttpRequest() {
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
}


function sendRequest(url, params, callback, method) {
	
	httpRequest = getXMLHttpRequest();
	
	var httpMethod = method ? method : 'GET';
	/*
	if(method!=null){
		httpMethod = method;
	}else{
		httpMethod='GET';
	}
	*/
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	
	var httpParams = (params == null || params == '') ? null : params;
	/*
	if((params == null || params == '')){
		httpParams=null;
	}else{
		httpParams=params;
	}
	*/
	
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader(
		'Content-Type', 'application/x-www-form-urlencoded');
	
	httpRequest.onreadystatechange = callback;
	/*
	if(httpMethod=='POST'){
		httpRequest.send(httpParams);
	}else{
		httpRequest.send(null);
	}
	*/
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
	
	
}
