function sendRequest(method, url, account, action) {
	var settings = new Object();
	settings.method  = method;
	settings.contentType = "application/x-www-form-urlencoded; charset=UTF-8";
	settings.url = url;
	settings.data = "action="+action+"&account="+account;
	settings.async = true;
	settings.cache = false;
	settings.success = processText;
	
	$.ajax(settings);
}
function processText(data) {
	$("#myfont").text(data);
}
